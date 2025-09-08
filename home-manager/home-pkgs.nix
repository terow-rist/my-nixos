{ pkgs, ... }: 
{
    nixpkgs.config.allowUnfree = true;
          
    home.packages = with pkgs; [
    telegram-desktop
    git
    wget
    dig
    htop
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
    lsof
    kubernetes
    minikube
    ansible
    nginx
    (dwm.override {
    conf = ./modules/config.h;
    })
    ];

}
