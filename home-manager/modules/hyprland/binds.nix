{
    wayland.windowManager.hyprland.settings = {
        bind = [
            "$mainMod, return, exec, $terminal"
            "$mainMod, C, killactive,"
            "$mainMod SHIFT, Q, exit,"
            "$mainMod, E, exec, $fileManager"
            "$mainMod, F, togglefloating,"
            "$mainMod, R, exec, $menu"
            "$mainMod, P, togglefloating,"
            "$mainMod, J, layoutmsg, orientationcycle"
            "$mainMod, TAB, focuscurrentorlast"
            "$mainMod, V, exec, cliphist list | $menu --dmenu | cliphist decode | wl-copy"
            ", Print, exec, grimblast --notify --freeze copysave area"
            "$mainMod, L, exec, hyprlock & systemctl suspend"
            "$mainMod, H, exec, pkill -SIGUSR1 -x .waybar-wrapped"
            "$mainMod, X, exec, passmenu"

            # Resizeing windows                   X  Y
            "$mainMod CTRL, left,  resizeactive, -60 0"
            "$mainMod CTRL, right, resizeactive,  60 0"
            "$mainMod CTRL, up,    resizeactive,  0 -60"
            "$mainMod CTRL, down,  resizeactive,  0  60"

            # swap windows
            "$mainMod SHIFT, left,  swapwindow, l"
            "$mainMod SHIFT, right, swapwindow, r"
            "$mainMod SHIFT, up,    swapwindow, u"
            "$mainMod SHIFT, down,  swapwindow, d"
            
            # change focus
            "$mainMod, left, movefocus, l"
            "$mainMod, right, movefocus, r"
            "$mainMod, up, movefocus, u"
            "$mainMod, down, movefocus, d"

            "$mainMod, 1, workspace, 1"
            "$mainMod, 2, workspace, 2"
            "$mainMod, 3, workspace, 3"
            "$mainMod, 4, workspace, 4"
            "$mainMod, 5, workspace, 5"
            "$mainMod, 6, workspace, 6"
            "$mainMod, 7, workspace, 7"
            "$mainMod, 8, workspace, 8"
            "$mainMod, 9, workspace, 9"
            "$mainMod, 0, workspace, 10"

            "$mainMod SHIFT, 1, movetoworkspace, 1"
            "$mainMod SHIFT, 2, movetoworkspace, 2"
            "$mainMod SHIFT, 3, movetoworkspace, 3"
            "$mainMod SHIFT, 4, movetoworkspace, 4"
            "$mainMod SHIFT, 5, movetoworkspace, 5"
            "$mainMod SHIFT, 6, movetoworkspace, 6"
            "$mainMod SHIFT, 7, movetoworkspace, 7"
            "$mainMod SHIFT, 8, movetoworkspace, 8"
            "$mainMod SHIFT, 9, movetoworkspace, 9"
            "$mainMod SHIFT, 0, movetoworkspace, 10"

            "$mainMod, S, togglespecialworkspace, magic"
            "$mainMod SHIFT, S, movetoworkspace, special:magic"
        ];

        bindm = [
            "$mainMod, mouse:272, movewindow"
            "$mainMod, mouse:273, resizewindow"
        ];

        bindel = [
            ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
            ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
            ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
            ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
            ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
            ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
        ];

        bindl = [
            ", XF86AudioNext,  exec, playerctl next"
            ", XF86AudioPause, exec, playerctl play-pause"
            ", XF86AudioPlay,  exec, playerctl play-pause"
            ", XF86AudioPrev,  exec, playerctl previous"
        ];
    };
}