{ pkgs, ... } :
{
  programs.helix = {
    enable = true;
    settings = {
      theme = "base16_terminal";
    };
    extraPackages = with pkgs; [
      nixd
      gopls
    ];
  };    
}
