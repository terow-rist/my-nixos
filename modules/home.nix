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
    st
    dmenu
    lightdm
    lightdm-gtk-greeter
    dwm
    waybar
    kitty
    go
    postman
    vscode
    gnumake
    gcc
    man-pages
    hugo
    cloudflared
    python314
    ansible
    nginx
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/terow-rist/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.git = {
    enable = true;
    userName = "terow-rist";
    userEmail = "feeerhd.342@gmail.com";
    aliases = {
      al = "git add .";
      cm = "!gcm() { git commit -m \"$*\"; }; gcm";
      p = "!git pull && push";
    };
  };

  home.enableNixpkgsReleaseCheck = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
