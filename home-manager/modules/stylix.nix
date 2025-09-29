{ pkgs, inputs, ... }:
{
  imports = [ inputs.stylix.homeModules.stylix ];
  
  # Enable font configuration
  fonts.fontconfig.enable = true;
  
  home.packages = with pkgs; [
    # Basic fonts
    dejavu_fonts
    noto-fonts
    noto-fonts-lgc-plus
    noto-fonts-emoji
    
    # Icon and symbol fonts
    font-awesome
    
    # Nerd Fonts (consolidated)
    nerd-fonts.jetbrains-mono
    nerd-fonts.symbols-only
    
    # Optional: Hebrew support
    # texlivePackages.hebrew-fonts
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
      hyprland.enable = true;
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
        package = pkgs.noto-fonts-emoji;
      };
      
      monospace = {
        name = "JetBrainsMono Nerd Font";
        package = pkgs.nerd-fonts.jetbrains-mono;
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
        # terminal = 12;
        applications = 11;
      };
    };
  };
}