{ config, lib, pkgs, ... }:

{
  services = {
    openssh.enable = true;
    printing.enable = true;
    xserver = {
      enable = true;
      layout = "us";
      xkbVariant = "colemak";

      # Enable touchpad support.
      libinput = {
        enable = true;
        tapping = false;
      };
      synaptics.enable = false;

      # de / wm / dm
      #displayManager.sddm.enable = true;
      windowManager = {
        i3 = {
          enable = true;
          package = pkgs.i3-gaps;
        };
        default = "i3";
      };
    };

    # Enable Android udev rules
    udev.packages = with pkgs; [
      android-udev-rules
    ];

    nixosManual.showManual = true;

    upower.enable = true;
  };
}
