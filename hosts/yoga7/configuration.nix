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
  
  networking.hostName = "nixos"; 

  system.stateVersion = "24.11";

}
