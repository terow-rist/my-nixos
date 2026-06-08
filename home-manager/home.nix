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
    enableNixpkgsReleaseCheck = false; # I don't want to be spammed with notifications about new HM releases, since I love lady gaga
  };
  # to silence this shit.
  gtk.gtk4.theme = null;
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
