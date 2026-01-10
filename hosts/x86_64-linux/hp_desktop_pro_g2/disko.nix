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
        device = "/dev/sda";
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
                    "/root" = {
                      mountpoint = "/";
                      mountOptions = sharedOpts;
                    };
                    "/home" = {
                      mountpoint = "/home";
                      mountOptions = sharedOpts;
                    };
                    "/nix" = {
                      mountpoint = "/nix";
                      mountOptions = sharedOpts;
                    };
                    "/snapshots/home" = {
                      mountpoint = "/snapshots/home";
                      mountOptions = sharedOpts;
                    };
                    "/swap" = {
                      mountpoint = "/swap";
                      mountOptions = [
                        "noatime"
                        "nodatacow" 
                        "discard=async"
                      ];
                      swap.swapfile.size = "20G";
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
