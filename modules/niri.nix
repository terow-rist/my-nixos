{
    # niri's NixOS module already wires up swaylock PAM, dconf, xdg-portal
    # and xwayland via the shared wayland-session.nix helper (same one
    # Hyprland used), so nothing else needs to be duplicated here.
    programs.niri.enable = true;
}
