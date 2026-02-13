{ config, pkgs, stateVersion, ... }:

{
  imports = [
    ./home-pkgs.nix
    ./modules
  ];

  home = {
    username = "terow-rist";
    homeDirectory = "/home/terow-rist";
    stateVersion = stateVersion; # this version of HM is associated with my conf.nix
    enableNixpkgsReleaseCheck = true;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
