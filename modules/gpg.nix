{ pkgs, ... }:
{
  programs.gnupg.agent  = {
    enable = true;
    pinentryPackage = pkgs.pinentry-gnome3;
    settings = {
      default-cache-ttl = 3600;
      max-cache-ttl = 86400;
    };
  };
}
