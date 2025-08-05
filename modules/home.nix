{ config, pkgs, ... }:

{
  home.username = "terow-rist";
  home.homeDirectory = "/home/terow-rist";

  home.stateVersion = "24.05"; # this version of HM is associated with my conf.nix

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    git
    wget
    dig
    htop
    inetutils
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
    alacritty
    go
    gopls
    postman
    vscode
    gnumake
    gcc
    man-pages
    trashy
    stacer
    hugo
    cloudflared
    python314
    ansible
    nginx
    (dwm.override {
      conf = ./config.h;
    })
  ];

  # plan for future :()
  # programs.vscode = {
  #   enable = true;
  #   extensions = with pkgs.vscode-extensions; [
  #     dracula-theme.theme-dracula
  #     vscodevim.vim
  #     yzhang.markdown-all-in-one
  #   ];
  # };



  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  home.enableNixpkgsReleaseCheck = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
