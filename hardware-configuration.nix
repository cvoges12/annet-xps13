{ config, lib, pkgs, ... }:

{
  imports = [ 
    <nixpkgs/nixos/modules/hardware/network/broadcom-43xx.nix>
    <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
  ];

  boot = {
    initrd.availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
    kernelModules = [ "kvm-intel" "coretemp" ];
    extraModulePackages = [ ];
    loader = {
      grub = {
        enable = true;
        version = 2;
        # efiSupport = true;
        # efiInstallAsRemovable = true;
        device = "/dev/sda"; # or "nodev" for efi only
      };
      # efi.efiSysMountPoint = "/boot/efi";
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };

  fileSystems."/" = { 
    device = "/dev/disk/by-uuid/ebb3b5a1-3562-4897-826b-e49b84571ea9";
    fsType = "ext4";
  };

  swapDevices = [ 
    { device = "/dev/disk/by-uuid/3f2d5025-51bc-48d7-b9a1-12b378d5084f"; }
  ];

  nix.maxJobs = lib.mkDefault 4;
  powerManagement.cpuFreqGovernor = "powersave";
  hardware = {                                                                                                                
    pulseaudio = {
      enable = true;
      support32Bit = true;
    };
    opengl = {
      driSupport = true;
      driSupport32Bit = true;
    };
  };
}
