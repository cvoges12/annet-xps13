{ config, lib, pkgs, ... }:

{
  networking = {
    hostName = "annet3";
    # wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    networkmanager.enable = true;
    firewall = {
      # allowedTCPPorts = [ ... ];
      # allowedUDPPorts = [ ... ];
      enable = false;
    };
  };
}
