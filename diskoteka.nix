{
  disko.devices = {
    disk.my-diskoteka = {
      device = "/dev/nvme0n1";
      type = "disk";
      content = {
        type = "gpt";
        partitions = {
          ESP = {
            type = "EF00";
            size = "260M";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
              mountOptions = [ "umask=0077" ];
            };
          };
          
          #use this
          luks = {
            size = 100%;
            content = {
              type = "luks";
              name = "cryptroot";
              
              settings = {
                allowDiscards = true;
              };

              content = {
                  type = "filesystem";
                  format = "ext4";
                  mountpoint = "/";
              };
            };
          };
          
          #this is just example
          root = {
            size = "100%";
            content = {
              type = "filesystem";
              format = "ext4";
              mountpoint = "/";
            };
          };
        };
      };
    };
  };
}
