{ pkgs, ... }:
{
    nixpkgs.config.allowUnfree = true;

    home.packages = with pkgs; [
        # Communication & Web
        telegram-desktop
        teams-for-linux
        discord
        obs-studio
        mpv
        yandex-music
        # System utilities (keep these - they work everywhere)
        git
        net-snmp
        wget
        dig
        htop
        sshpass
        tree
        sl
        sshuttle
        cowsay
        lolcat
        fastfetch
        acpi
        lsof
        trashy
        man-pages
        ragenix
        killall
        zip
        unzip
        tcpdump
        dpdk
        libcap
        rsync
        nmap
        openfortivpn
        tmux
        docutils        
        sshuttle
        screen
        minicom
        drawio
        winbox4
        dmenu-wayland
        jq
        arp-scan
        pigz
        # Wayland-specific replacements
        waybar             
        wofi               
        # rofi-wayland     # Alternative to wofi (more powerful)
        swaynotificationcenter    # Notification daemon (replaces dunst)
        wlogout            # Logout menu
        awww               # Wallpaper daemon (pushes the stylix wallpaper at startup), formerly swww

        # Wayland utilities
        wl-clipboard       # Clipboard utilities (wl-copy, wl-paste)
        cliphist           # Clipboard history
        wf-recorder        # Screen recording
        brightnessctl      # Brightness control (keep this)
        pamixer            # Audio control
        playerctl          # Media player control
        jellyfin-ffmpeg
        thunar        # File manager (better than pcmanfm for Wayland)
        pass-wayland
        gnupg
        dmidecode

        # Development tools (keep these)
        go
        gopls
        postman
        vscodium
        gnumake
        gcc
        python3
        hugo
        cloudflared
        virtualenv
                
        # DevOps tools (keep these)
        kubernetes
        minikube
        ansible
        nginx
        
        # System monitoring & utilities
        btop               # Better than htop
        ncdu
        
        # Wayland-specific tools
        wayland-utils      # Wayland development utilities
        wayland-protocols  # Wayland protocols

        # Optional but useful
        blueman            # Bluetooth manager
        networkmanagerapplet  # Network management
        smassh
	    wpsoffice
    ];
}
