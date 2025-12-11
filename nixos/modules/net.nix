{
    networking = {
      networkmanager.enable = true;
      firewall = {
        allowedTCPPorts = [ 22 ];
        allowedUDPPorts = [ 51820 ];  
        trustedInterfaces = [ "wg0" "tailscale0" ];
      };
      nameservers = [ "10.10.5.2" ];
    };   
}
