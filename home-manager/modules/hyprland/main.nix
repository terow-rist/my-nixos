{ lib, ... }:
{
    wayland.windowManager.hyprland = {
        enable = true;
        systemd.enable = true;

        settings = {
            env = [
                #standard, may change https://wiki.hypr.land/Configuring/Environment-variables/
                #"XCURSOR_SIZE,24"
                #"HYPRCURSOR_SIZE,24"
            ];

            monitor = ",preferred,auto,auto";
            "$mainMod" = "SUPER";
            "$terminal" = "alacritty";
            "$fileManager" = "thunar";
            "$menu" = "wofi --show drun"; #temp drun
            
            exec-once = [
                "waybar"
                "wl-paste --type text --watch cliphist store"
                "wl-paste --type image --watch cliphist store"
            ];

            xwayland = {
                force_zero_scaling = true;
            };

            general = {
                gaps_in = 2;
                gaps_out = 2;

                border_size = 3;

                # https://wiki.hypr.land/Configuring/Variables/#variable-types for info about colors
                "col.active_border" = lib.mkForce "rgba(d65d0eff) rgba(98971aff) 45deg";
                "col.inactive_border" = lib.mkForce "rgba(3c3836ff)";

                resize_on_border = true;

                allow_tearing = false;
                layout = "master";
            };

            decoration = {
                rounding = 10;
                rounding_power = 2;

                active_opacity = 1.0;
                inactive_opacity = 1.0;

                shadow = {
                    enabled = false;
                };

                blur = {
                    enabled = false;
                };
            };
            
            animations = {
                enabled = true;
                bezier = [
                    "easeOutQuint,0.23,1,0.32,1"
                    "easeInOutCubic,0.65,0.05,0.36,1"
                    "linear,0,0,1,1"
                    "almostLinear,0.5,0.5,0.75,1.0"
                    "quick,0.15,0,0.1,1"
                ];

                animation = [
                    "global, 1, 10, default"
                    "border, 1, 5.39, easeOutQuint"
                    "windows, 1, 4.79, easeOutQuint"
                    "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
                    "windowsOut, 1, 1.49, linear, popin 87%"
                    "fadeIn, 1, 1.73, almostLinear"
                    "fadeOut, 1, 1.46, almostLinear"
                    "fade, 1, 3.03, quick"
                    "layers, 1, 3.81, easeOutQuint"
                    "layersIn, 1, 4, easeOutQuint, fade"
                    "layersOut, 1, 1.5, linear, fade"
                    "fadeLayersIn, 1, 1.79, almostLinear"
                    "fadeLayersOut, 1, 1.39, almostLinear"
                    "workspaces, 1, 1.94, almostLinear, fade"
                    "workspacesIn, 1, 1.21, almostLinear, fade"
                    "workspacesOut, 1, 1.94, almostLinear, fade"
                ];
            };

            input = {
                kb_layout = "us,ru";
                kb_options = "grp:win_space_toggle";
            };

            gestures = {
                workspace_swipe = false;
            };


            dwindle = {
                pseudotile = true;
                preserve_split = true;
            };

            master = {
                new_status = "slave";
            };

            misc = {
                force_default_wallpaper = 0;
                disable_hyprland_logo = true;
            };

            # See https://wiki.hypr.land/Configuring/Window-Rules/ for more
            # See https://wiki.hypr.land/Configuring/Workspace-Rules/ for workspace rules
            windowrulev2 = [
                "suppressevent maximize, class:.*"
                "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
            ];

        };
    };

}