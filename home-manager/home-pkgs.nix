{ pkgs, ... }:
{
    nixpkgs.config.allowUnfree = true;
    
    home.packages = with pkgs; [
        # Communication & Web
        telegram-desktop

        # System utilities (keep these - they work everywhere)
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
        acpi
        lsof
        trashy
        man-pages
        ragenix
        killall
        zip
        unzip
        
        # Wayland/Hyprland specific replacements
        waybar             
        wofi               
        # rofi-wayland     # Alternative to wofi (more powerful)
        swaynotificationcenter    # Notification daemon (replaces dunst)
        wlogout            # Logout menu
        hyprlock
        wofi-power-menu               

        # Wayland utilities
        wl-clipboard       # Clipboard utilities (wl-copy, wl-paste)
        cliphist           # Clipboard history
        grimblast          # Screenshot utility (replaces flameshot)
        wf-recorder        # Screen recording
        brightnessctl      # Brightness control (keep this)
        pamixer            # Audio control
        playerctl          # Media player control
        
        # File management
        xfce.thunar        # File manager (better than pcmanfm for Wayland)
        # nemo             # Alternative file manager
        
        # Terminal
        alacritty
        
        # Development tools (keep these)
        go
        gopls
        postman
        vscode
        gnumake
        gcc
        python314
        hugo
        cloudflared
        
        # DevOps tools (keep these)
        kubernetes
        minikube
        ansible
        nginx
        
        # System monitoring & utilities
        btop               # Better than htop
        stacer             # garbage cleaner
        
        # Wayland-specific tools
        wayland-utils      # Wayland development utilities
        wayland-protocols  # Wayland protocols
        xdg-desktop-portal-hyprland  # Desktop portal for Hyprland
        
        # Optional but useful
        blueman            # Bluetooth manager
        networkmanagerapplet  # Network management
    ];
}
