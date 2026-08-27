{ pkgs, ... }:
{
    services.greetd = {
      enable = true;
      settings = {
        initial_session = {
          command = "niri-session";
          user = "terow-rist";
        };

        default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --cmd niri-session";
        };
      };
    };
}
