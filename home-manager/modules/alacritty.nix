{
  programs.alacritty = {
    enable = true;
    # theme = "gruvbox_dark"; DOES NOT AFFECT!!!
    settings = {
      env = {
        TERM = "xterm-256color";
      };
    };
  };
}