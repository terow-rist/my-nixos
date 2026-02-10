# HAHAHHA MY NIXOS CONFIG >:))
{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./local-pkgs.nix
      ../../nixos/modules
    ];

  # Docker install/enabling
  virtualisation.docker.enable = true;
  # TEMP: for hosts and hostname nixos
  networking.hostName = "te14"; 

  system.stateVersion = "25.11";

}
