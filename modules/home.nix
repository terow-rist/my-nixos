{ config, pkgs, ... }:

{
  home.username = "terow-rist";
  home.homeDirectory = "/home/terow-rist";

  home.stateVersion = "24.05"; # this version of HM is associated with my conf.nix

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    git
    wget
    sshpass
    tree
    sl
    cowsay
    lolcat
    neofetch
    feh
    dmenu
    acpi
    dunst
    libnotify
    betterlockscreen
    brightnessctl 
    flameshot
    kitty
    go
    postman
    vscode
    code-cursor
    gnumake
    gcc
    man-pages
    hugo
    cloudflared
    python314
    ansible
    nginx
  ];


  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  home.enableNixpkgsReleaseCheck = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
