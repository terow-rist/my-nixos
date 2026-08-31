{ config, ... }:
let
  # Hardcore base16 accents, kept in sync with waybar/style.nix and swaylock.nix
  # (same convention this repo already used for atelier-savanna: hardcode the
  # palette per-module instead of wiring through Stylix, since niri has no
  # Stylix target to begin with).
  red = "#f92672";
  border-inactive = "#4A4A4A";

  terminal = "foot";
  menu = "wofi --show drun";
  fileManager = "thunar";
  cliphistDb = "/run/user/1000/cliphist/db";
  fullscreenTermAppId = "fullscreen-term";

  # awww-daemon (spawned at startup below) needs a client command to
  # actually push an image to it - reuse the same image Stylix is already
  # configured with instead of introducing a separate wallpaper picker.
  wallpaperImage = config.stylix.image;
in
{
  xdg.configFile."niri/config.kdl".text = ''
    input {
        keyboard {
            xkb {
                layout "us,ru"
                options "grp:win_space_toggle"
            }
        }

        // With an external monitor plugged into the laptop, keybinds like
        // Mod+Left/Right stayed on whichever output last had focus instead
        // of the one the mouse is actually over. This makes hovering a
        // window/output focus it, same as moving the mouse to the other
        // monitor did on the previous WM.
        focus-follows-mouse

        // Without this block tap-to-click is off entirely (niri leaves
        // touchpad features disabled unless listed), which is why taps -
        // including a quick double-tap for double-click-to-select - did
        // nothing after switching from Hyprland (tap-to-click was on by
        // Hyprland's default). Tap-and-drag (tap, then hold and move) stays
        // on so you can still drag-select text by holding after a tap.
        touchpad {
            tap
            dwt
        }
    }

    output "eDP-1" {
        mode "1920x1200@60"
        position x=0 y=0
    }

    output "HDMI-A-1" {
        mode "2560x1440@144"
        position x=0 y=-1440
    }

    // Named workspaces never disappear even while empty, unlike niri's
    // normal dynamic workspaces (which collapse to a single trailing empty
    // one) - this keeps 10 slots permanently visible on *each* monitor.
    // They still get addressed by position (Mod+1..0 below use bare,
    // unquoted indices), so this is layered on top of the per-monitor
    // "Mod+N targets whichever output is focused" behavior, not instead of
    // it - the names below exist only to pin them to an output and keep
    // them alive; waybar is set to show {index} rather than the name, so
    // both monitors still just read 1-10. Names must be config-wide unique,
    // hence the "e-" prefix on the external monitor's set.
    workspace "1" { open-on-output "eDP-1"; }
    workspace "2" { open-on-output "eDP-1"; }
    workspace "3" { open-on-output "eDP-1"; }
    workspace "4" { open-on-output "eDP-1"; }
    workspace "5" { open-on-output "eDP-1"; }
    workspace "6" { open-on-output "eDP-1"; }
    workspace "7" { open-on-output "eDP-1"; }
    workspace "8" { open-on-output "eDP-1"; }
    workspace "9" { open-on-output "eDP-1"; }
    workspace "10" { open-on-output "eDP-1"; }

    workspace "e-1" { open-on-output "HDMI-A-1"; }
    workspace "e-2" { open-on-output "HDMI-A-1"; }
    workspace "e-3" { open-on-output "HDMI-A-1"; }
    workspace "e-4" { open-on-output "HDMI-A-1"; }
    workspace "e-5" { open-on-output "HDMI-A-1"; }
    workspace "e-6" { open-on-output "HDMI-A-1"; }
    workspace "e-7" { open-on-output "HDMI-A-1"; }
    workspace "e-8" { open-on-output "HDMI-A-1"; }
    workspace "e-9" { open-on-output "HDMI-A-1"; }
    workspace "e-10" { open-on-output "HDMI-A-1"; }

    layout {
        gaps 0

        // Hyprland config used a single always-on border (border_size 2)
        // rather than a separate focus ring, so the focus ring is off here
        // and the border alone carries the active/inactive distinction.
        focus-ring {
            off
        }

        border {
            width 2
            active-color "${red}"
            inactive-color "${border-inactive}"
        }
    }

    spawn-at-startup "waybar"
    spawn-at-startup "awww-daemon"
    // awww-daemon's IPC socket isn't up the instant it's spawned, so poll
    // briefly before handing it the wallpaper image.
    spawn-sh-at-startup "for i in $(seq 1 30); do awww query >/dev/null 2>&1 && break; sleep 0.1; done; awww img ${wallpaperImage}"
    spawn-sh-at-startup "wl-paste --type text --watch cliphist -db-path ${cliphistDb} store"
    spawn-sh-at-startup "wl-paste --type image --watch cliphist -db-path ${cliphistDb} store"

    hotkey-overlay {
        skip-at-startup
    }

    screenshot-path "~/Pictures/Screenshots/%Y-%m-%d_%H-%M-%S.png"

    // Many apps (GTK4/libadwaita, Chromium-based) draw their own rounded
    // corners client-side, but niri's border defaults to square corners -
    // without this, the border draws a plain rectangle that pokes past the
    // app's already-rounded corner, looking like it's "trying" to be
    // rounded but isn't. This tells the border/focus-ring to round to
    // match, and clips the window itself to the same radius for apps that
    // don't round their own corners.
    window-rule {
        geometry-corner-radius 16
        clip-to-geometry true
    }

    // A window spawned as `foot --app-id float-btop ...` (see waybar's
    // cpu/memory on-click-right) opens floating instead of tiled.
    window-rule {
        match app-id="float-btop"
        open-floating true
    }

    // "Fullscreen" here means maximized-in-the-layout (still has borders/
    // gaps, waybar stays visible) - real edge-to-edge fullscreen swallows
    // the whole screen, which is more than what was asked for.
    window-rule {
        match app-id="${fullscreenTermAppId}"
        open-maximized true
    }

    binds {
        Mod+Return { spawn "${terminal}"; }
        Mod+Shift+Return { spawn "${terminal}" "--app-id" "${fullscreenTermAppId}"; }
        Mod+C { close-window; }
        Mod+Shift+Q { quit; }
        Mod+E { spawn "${fileManager}"; }
        Mod+F { toggle-window-floating; }
        Mod+Shift+F { maximize-column; }
        Mod+R { spawn-sh "${menu}"; }
        Mod+V { spawn-sh "cliphist -db-path ${cliphistDb} list | wofi --dmenu | cliphist -db-path ${cliphistDb} decode | wl-copy"; }
        Mod+L { spawn-sh "swaylock & systemctl suspend"; }
        Mod+H { spawn-sh "pkill -SIGUSR1 -x .waybar-wrapped"; }
        Mod+X { spawn "passmenu"; }

        Print { screenshot; }

        // Resizing windows: niri has no free-form resizeactive, so this
        // resizes the column width / the window's slice of the column.
        Mod+Ctrl+Left  { set-column-width "-60"; }
        Mod+Ctrl+Right { set-column-width "+60"; }
        Mod+Ctrl+Up    { set-window-height "-60"; }
        Mod+Ctrl+Down  { set-window-height "+60"; }

        // Swap windows: closest niri analogues to Hyprland's swapwindow.
        Mod+Shift+Left  { move-column-left; }
        Mod+Shift+Right { move-column-right; }
        Mod+Shift+Up    { move-window-up; }
        Mod+Shift+Down  { move-window-down; }

        // Change focus: left/right moves between columns, up/down moves
        // within the focused column's stack of windows.
        Mod+Left  { focus-column-left; }
        Mod+Right { focus-column-right; }
        Mod+Up    { focus-window-up; }
        Mod+Down  { focus-window-down; }

        // Bare (unquoted) indices, not quoted names: these address the Nth
        // workspace on whichever monitor is currently focused, per niri's
        // native per-monitor workspace model. Quoted names would instead
        // refer to a single global workspace pinned to one output, which is
        // what caused Mod+2 to always jump back to the laptop screen.
        Mod+1 { focus-workspace 1; }
        Mod+2 { focus-workspace 2; }
        Mod+3 { focus-workspace 3; }
        Mod+4 { focus-workspace 4; }
        Mod+5 { focus-workspace 5; }
        Mod+6 { focus-workspace 6; }
        Mod+7 { focus-workspace 7; }
        Mod+8 { focus-workspace 8; }
        Mod+9 { focus-workspace 9; }
        Mod+0 { focus-workspace 10; }

        Mod+Shift+1 { move-column-to-workspace 1; }
        Mod+Shift+2 { move-column-to-workspace 2; }
        Mod+Shift+3 { move-column-to-workspace 3; }
        Mod+Shift+4 { move-column-to-workspace 4; }
        Mod+Shift+5 { move-column-to-workspace 5; }
        Mod+Shift+6 { move-column-to-workspace 6; }
        Mod+Shift+7 { move-column-to-workspace 7; }
        Mod+Shift+8 { move-column-to-workspace 8; }
        Mod+Shift+9 { move-column-to-workspace 9; }
        Mod+Shift+0 { move-column-to-workspace 10; }

        // Closest analogue to Hyprland's special:magic scratch workspace:
        // a regular named workspace you jump to/from (it replaces the view
        // rather than overlaying it like a true scratchpad would).
        Mod+S       { focus-workspace "magic"; }
        Mod+Shift+S { move-column-to-workspace "magic"; }

        XF86AudioRaiseVolume   allow-when-locked=true { spawn-sh "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"; }
        XF86AudioLowerVolume   allow-when-locked=true { spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"; }
        XF86AudioMute          allow-when-locked=true { spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"; }
        XF86AudioMicMute       allow-when-locked=true { spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"; }
        XF86MonBrightnessUp    allow-when-locked=true { spawn-sh "brightnessctl -e4 -n2 set 5%+"; }
        XF86MonBrightnessDown  allow-when-locked=true { spawn-sh "brightnessctl -e4 -n2 set 5%-"; }
    }
  '';
}
