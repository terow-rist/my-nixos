{
    services.xserver.enable = true;
    
    # enabling dwm
    services.xserver.windowManager.dwm = {
        enable = true;
    };
    # cursor resize
    services.xserver = {
        upscaleDefaultCursor = true;
        dpi = 120;
    };

    # cursor resize
    services.xserver = {
        upscaleDefaultCursor = true;
        dpi = 120;
    };

    # Configure keymap in X11
    services.xserver.xkb = {
        layout = "us,ru";
        variant = "";
        options = "grp:win_space_toggle";
    };

    # Enable CUPS to print documents.
    services.printing.enable = true;

    # Enable touchpad support (enabled default in most desktopManager).
    services.xserver.libinput.enable = true;

    services.openssh = {
        enable = true;
        settings.X11Forwarding = true;
    };

}