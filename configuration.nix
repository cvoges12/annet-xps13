# configuration.nix(5) man page
# ‘nixos-help’

{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./network.nix
    ./packages.nix
    ./services.nix
  ];

  # Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    #consoleKeyMap = "us";
    consoleUseXkbConfig = true;
    defaultLocale = "en_US.UTF-8";
  };

  time.timeZone = "America/Chicago";

  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fontconfig = {
      defaultFonts.monospace = ["Fira Mono"];
      defaultFonts.sansSerif = ["Fira Sans"];
      ultimate.enable = true;
    };
    fonts = with pkgs; [
      fira-code fira-mono font-droid
    ];
  };

  sound = {
    enable = true;
    mediaKeys = {
      enable = true;
      volumeStep = "1";
    };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    extraUsers = {

      # Clayton
      cvoges = {
        description = "Clayton Voges";
        createHome = true;
        home = "/home/cvoges";
        isNormalUser = true;
        uid = 1001;
        extraGroups = [ 
          "wheel" "disk" "audio" "video"
          "networkmanager" "systemd-journal"
        ];
        shell = pkgs.zsh;
      };
    };
    defaultUserShell = "/run/current-system/sw/bin/zsh";
  };

  system.autoUpgrade.enable = true;
}
