{ pkgs, ... }:
{
  # Colors, background image and scaling all come from stylix's swaylock
  # target (see stylix.nix) - only the swaylock-effects-only extras go here.
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      clock = true;
      indicator-idle-visible = true;
      indicator-radius = 100;
      indicator-thickness = 10;
      font-size = 32;
      effect-blur = "8x3";
    };
  };
}
