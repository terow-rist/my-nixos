#
# NOW I AM NOT USING THIS :D
# (kept disabled, same as the old hypridle.nix it replaces)
#
{
  services.swayidle = {
    enable = false;

    timeouts = [
      {
        timeout = 180;
        command = "brightnessctl -s set 30";
        resumeCommand = "brightnessctl -r";
      }
      {
        timeout = 300;
        command = "loginctl lock-session";
      }
      {
        timeout = 1200;
        command = "systemctl suspend";
      }
    ];

    events = {
      before-sleep = "loginctl lock-session";
    };
  };
}
