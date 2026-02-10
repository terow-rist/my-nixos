{
    # Enable CUPS to print documents.
    services.printing.enable = true;
    services.dbus.implementation = "broker";
    services.openssh = {
        enable = true;
        settings.X11Forwarding = false;
    };
    services.fstrim.enable = true;
}
