{
    networking = {
      networkmanager.enable = true;
      firewall = {
        allowedTCPPorts = [ 22 ];
        allowedUDPPorts = [ 51820 ];  
        trustedInterfaces = [ "wg7"];
      };
    };
}
