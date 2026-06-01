{
    networking = {
      networkmanager.enable = true;
      firewall = {
        allowedTCPPorts = [ 22 ];
        allowedUDPPorts = [ 51820 69 ];  
        trustedInterfaces = [ "wg7"];
      };
    };
}
