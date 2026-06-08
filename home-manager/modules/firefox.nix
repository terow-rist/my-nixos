{ config, pkgs, lib, host, ... }:
{
  programs.firefox.enable = true;
  programs.firefox.configPath = ".mozilla/firefox";

  home.file.".mozilla/firefox/5satmgyo.default/user.js" =
    lib.mkIf (host == "te14") {
      text = ''
        user_pref("layout.css.devPixelsPerPx", "1.3");
      '';
      force = true;
    };
}