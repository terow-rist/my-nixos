{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;  # if you use flakes / nix-shell
    silent = true;
  };
}
