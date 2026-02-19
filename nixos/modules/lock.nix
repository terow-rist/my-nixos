{ pkgs, ... }:
{
    services.greetd = {
      enable = true;
      settings = {
        initial_session = {
          command = "start-hyprland";
          user = "terow-rist";
        };

        default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --cmd start-hyprland";
        };
      };
    };
}
