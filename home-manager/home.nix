{ config, pkgs, ... }:

{
  imports = [
    ./home-pkgs.nix
    ./modules/helix.nix
  ];

  home = {
    username = "terow-rist";
    homeDirectory = "/home/terow-rist";
    stateVersion = "24.05"; # this version of HM is associated with my conf.nix
    enableNixpkgsReleaseCheck = true;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
