# HAHAHHA MY NIXOS CONFIG >:))
{ config, pkgs, host, stateVersion, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ./local-pkgs.nix
      ../../modules
    ];

  networking.hostName = host; 

  system.stateVersion = stateVersion;

}
