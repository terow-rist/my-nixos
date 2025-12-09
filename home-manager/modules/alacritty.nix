{
  programs.alacritty = {
    enable = true;
    theme = "gruvbox_dark";
    settings = {
      env = {
        TERM = "xterm-256color";
      };
    };
  };
}