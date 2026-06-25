{ ... }:

let
  sharedOpts = [
    "compress=zstd:3"
    "noatime"
    "discard=async"
  ];
in
{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/nvme0";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              size = "2G";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };
            luks = {
              size = "100%";
              content = {
                type = "luks";
                name = "crypted";
                settings = {
                  allowDiscards = true;
                };
                content = {
                  type = "btrfs";
                  extraArgs = [ "-f" ];
                  subvolumes = {
                    "@root" = {
                      mountpoint = "/";
                      mountOptions = sharedOpts;
                    };
                    "@home" = {
                      mountpoint = "/home";
                      mountOptions = sharedOpts;
                    };
                    "@nix" = {
                      mountpoint = "/nix";
                      mountOptions = [
                        "noatime"
                      ];
                    };
                    "@var" = {
                      mountpoint = "/var";
                      mountOptions = sharedOpts;
                    };
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}
