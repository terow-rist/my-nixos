{ config, ... }:
{
  age.identityPaths = [ "/home/terow-rist/.ssh/ed25519_github" ];
  age.secrets = {
    wg-yoga.file = ../../secrets/wg-yoga.age;
    wg-jubber.file = ../../secrets/wg-jubber.age;
    wg-jubber-presh.file = ../../secrets/wg-jubber-presh.age;
  };

  networking.wireguard = {
    enable = true;
    interfaces = {
      # wg0 = {
      #   ips = [ "172.16.45.11/24" ];

      #   listenPort = 51820;

      #   privateKeyFile = config.age.secrets.wg-yoga.path;

      #   peers = [
      #     {
      #       name = "Asshole";
      #       publicKey = "bXm95yJy9KNd0lqQqQso+y8oSiJRfSc76A1g0jcDiHE=";
      #       allowedIPs = [
      #         "172.16.45.0/24"
      #       ];
      #       endpoint = "167.71.46.121:51820";
      #       persistentKeepalive = 25;
      #     }
      #   ];
      # };

      wg7 = {
        ips = [ "10.10.12.19/32" ];
        listenPort = 51820;

        privateKeyFile = config.age.secrets.wg-jubber.path;

        peers = [
          {
            publicKey = "D3/fgyPIawaw954/xeYTJDoXgC28r2LBBC1M6sOJ41k=";
            allowedIPs = [
              "10.10.5.0/24"
              "10.10.10.0/24"
            ];
            endpoint = "45.86.82.14:13231";
            presharedKeyFile = config.age.secrets.wg-jubber-presh.path;
            persistentKeepalive = 25;
          }
        ];
      };
    };
  };
}
