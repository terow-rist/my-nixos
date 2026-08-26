{
    networking = {
      networkmanager.enable = true;
      firewall = {
        allowedTCPPorts = [ 22 111 2049 20048 ];
        allowedUDPPorts = [ 51820 111 2049 20048 ];  
        trustedInterfaces = [ "wg7"];
      };
    };
}
