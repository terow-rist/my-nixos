{
  programs.waybar = {
    enable = true;
    style = ./style.css;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 12;
        margin-top = 0;
        margin-left = 0;
        margin-right = 0;
        margin-bottom = 6;
        spacing = 0;

        modules-left = [
          "hyprland/workspaces"
          "custom/lock"
          "custom/reboot"
          "custom/power"
        ];
        modules-center = [ "clock" ];
        modules-right = [
          "tray"
          "pulseaudio"
          "memory"
          "custom/temperature"
          "cpu"
        ];

        tray = {
          icon-size = 21;
          spacing = 10;
        };

        "custom/separator" = {
          format = " ‎";
          interval = "once";
          tooltip = false;
        };

        "hyprland/workspaces" = {
          format = "{name}";
          disable-scroll = true;
          all-outputs = true;
          on-click = "activate";
          persistent-workspaces = {
            "*" = [ 1 2 3 4 5 ];
          };
        };

        "custom/temperature" = {
          exec = "sensors | awk '/^Package id 0:/ {print int($4)}'";
          format = " <span color='#f6c177'></span>{}°C ";
          interval = 5;
          tooltip = true;
          tooltip-format = "CPU Temperature: {}°C";
        };

        pulseaudio = {
          format = "{icon}{volume}%";
          format-muted = "󰖁 ";
          format-icons = {
            headphone = " ";
            hands-free = " ";
            headset = " ";
            phone = " ";
            portable = " ";
            car = " ";
            default = [ "" " " " " ];
          };
          on-click-right = "pavucontrol -t 3";
          on-click = "pactl -- set-sink-mute 0 toggle";
          tooltip = true;
          tooltip-format = "Volume: {volume}%";
        };

        "keyboard-state" = {
          format = "⌨ {layout}";
        };

        memory = {
          interval = 2;
          format = " {percentage}%";
        };

        cpu = {
          interval = 2;
          format = " {usage}%";
        };

        clock = {
          interval = 1;
          format = " {:%H:%M}";
          format-alt = "{:%Y-%m-%d %H:%M:%S}";
        };

        "custom/lock" = {
          format = " ";
          on-click = "hyprlock";
          tooltip = true;
          tooltip-format = "Lock";
        };

        "custom/reboot" = {
          format = " ";
          on-click = "systemctl reboot";
          tooltip = true;
          tooltip-format = "Reboot";
        };

        "custom/power" = {
          format = " ";
          on-click = "systemctl poweroff";
          tooltip = true;
          tooltip-format = "Poweroff";
        };
      };
    };
  };

}