# HAHAHHA MY NIXOS CONFIG >:))
{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Aqtobe";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "kk_KZ.UTF-8";
    LC_IDENTIFICATION = "kk_KZ.UTF-8";
    LC_MEASUREMENT = "kk_KZ.UTF-8";
    LC_MONETARY = "kk_KZ.UTF-8";
    LC_NAME = "kk_KZ.UTF-8";
    LC_NUMERIC = "kk_KZ.UTF-8";
    LC_PAPER = "kk_KZ.UTF-8";
    LC_TELEPHONE = "kk_KZ.UTF-8";
    LC_TIME = "kk_KZ.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = false;
  services.desktopManager.plasma6.enable = false;

  # enabling dwm
  services.xserver.windowManager.dwm = {
    enable = true;
    package = pkgs.dwm.override {
      conf = ./modules/config.h;
      # patches
    };
  };

  # enabling lockscreen
  programs.i3lock.enable = true;
  security.pam.services.i3lock = {};

  # enabling ly DM 
  services.displayManager.ly.enable = true;

  # cursor resize
  services.xserver = {
    upscaleDefaultCursor = true;
    dpi = 120;
  };
  environment.variables = {
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    XCURSOR_SIZE = "64"; # default 16 I think
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us,ru";
    variant = "";
    options = "grp:win_space_toggle";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.terow-rist = {
    isNormalUser = true;
    description = "Madikozha Issayev";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [
      kdePackages.kate
    #  thunderbird
    ];
    shell = pkgs.fish;
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Install fish
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      if not contains -- $HOME/go/bin $PATH
        set -x PATH $HOME/go/bin $PATH
      end
    '';
  };
  
  # NIX_PATH
  nix.nixPath = [
    "nixpkgs=flake:nixpkgs"
    "nixos-config=/home/terow-rist/my-nixos/flake.nix"
  ];

  # Flakes enabling
  nix.settings.experimental-features = [ "nix-command" "flakes" ];  

  # Docker install/enabling
  virtualisation.docker.enable = true;

  environment.systemPackages = with pkgs; [
  	vim 
    docker
	  home-manager
	  fish
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:
  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    settings.X11Forwarding = true;
  };

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 22 ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  system.stateVersion = "24.11"; # Did you read the comment?

}
