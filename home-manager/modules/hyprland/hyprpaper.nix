{ pkgs, inputs, ... }:

let
  wallpapers = [
    "${inputs.self}/images/black-hole.png"
    "${inputs.self}/images/anime_skull.png"
    "${inputs.self}/images/vabd.jpg"
  ];

  randomWallpaper = pkgs.writeShellScriptBin "hyprpaper-random" ''
    WALLPAPERS=(
      ${pkgs.lib.concatStringsSep "\n  " wallpapers}
    )

    RANDOM_WALLPAPER="''${WALLPAPERS[RANDOM % ''${#WALLPAPERS[@]}]}"

    exec ${pkgs.hyprland}/bin/hyprctl hyprpaper wallpaper ",$RANDOM_WALLPAPER"
  '';
in
{
  home.packages = [
    randomWallpaper
  ];

  services.hyprpaper = {
    enable = true;

    settings = {
      ipc = "on";
      splash = false;

      preload = wallpapers;

      wallpaper = [
        ",${inputs.self}/images/black-hole.png"
      ];
    };
  };
}
