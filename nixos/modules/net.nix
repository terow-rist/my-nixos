{
    networking.hostName = "nixos"; 
    networking.networkmanager.enable = true;
    networking.firewall.allowedTCPPorts = [ 22 ];

    # What can be configured too
    # networking.wireless.enable = true;  
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
    # networking.firewall.allowedUDPPorts = [ ... ];
    # networking.firewall.enable = false;

}