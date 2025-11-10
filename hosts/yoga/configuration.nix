# HAHAHHA MY NIXOS CONFIG >:))
{ config, pkgs, stateVersion, hostname, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./local-pkgs.nix
      ../../nixos/modules
    ];

  # Docker install/enabling
  virtualisation.docker.enable = true;

  networking.hostName = hostname; 
  system.stateVersion = stateVersion;
}
