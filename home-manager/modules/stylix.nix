{ pkgs, inputs, ... }:
{
  imports = [ inputs.stylix.homeModules.stylix ];

  home.packages = with pkgs; [
      dejavu_fonts
      jetbrains-mono
      noto-fonts
      noto-fonts-lgc-plus
      texlivePackages.hebrew-fonts
      noto-fonts-emoji
      font-awesome
      powerline-fonts
      powerline-symbols
      nerd-fonts.symbols-only
  ];

  stylix = {
    enable = true;
    polarity = "dark";

    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";

    image = ../../images/anime_skull.png;

    targets = {
      helix.enable = false;
      waybar.enable = true;
      wofi.enable = false;
      hyprland.enable = false;
      hyprlock.enable = false;
      alacritty.enable = false;
    };

    cursor = {
      name = "Bibata-Modern-Ice";
      size = 16;
      package = pkgs.bibata-cursors;
    };

    iconTheme = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      dark = "Papirus-Dark";
      light = "Papirus-Light";
    };

    fonts = {
      emoji = {
        name = "Noto Color Emoji";
        package = pkgs.noto-fonts-color-emoji;
      };
      monospace = {
        name = "JetBrains Mono";
        package = pkgs.jetbrains-mono;
      };
      sansSerif = {
        name = "Noto Sans";
        package = pkgs.noto-fonts;
      };
      serif = {
        name = "Noto Serif";
        package = pkgs.noto-fonts;
      };

      sizes = {
        # terminal = 13;
        applications = 11;
      };
    };

  };

}
