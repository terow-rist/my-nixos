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

  system.stateVersion = "24.11";

}
