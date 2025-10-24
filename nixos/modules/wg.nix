{ config, ... }:
{
  age.secrets.wg-yoga.file =  ../../secrets/wg-yoga.age;
  age.identityPaths = [ "/home/terow-rist/.ssh/ed25519_github" ];

  networking.wireguard = {
    enable = true;
    interfaces = {
      wg0 = {
        ips = [ "172.16.45.11/24" ];

        listenPort = 51820;

        privateKeyFile = config.age.secrets.wg-yoga.path;

        peers = [
          {
            name = "Asshole";
            publicKey = "bXm95yJy9KNd0lqQqQso+y8oSiJRfSc76A1g0jcDiHE=";
            allowedIPs = [
              "172.16.45.0/24"
            ];
            endpoint = "167.71.46.121:51820";
            persistentKeepalive = 25;
          }
        ];
      };
    };
  };
}
