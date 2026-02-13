# HAHAHHA MY NIXOS CONFIG >:))
{ config, pkgs, host, stateVersion, ... }:
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
  networking.hostName = host; 

  system.stateVersion = stateVersion;

}
