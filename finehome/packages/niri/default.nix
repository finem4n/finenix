{ 
  config,
  lib,
  ... 
}: 

let
  cfg = config.packages.niri.config;
in {
  options.packages.niri.config = {
    enable = lib.mkEnableOption "Enable niri config";
  };

  config = lib.mkIf cfg.enable {
    home.file.".config/niri" = {
      source = ../../../fine-stew/niri/;
      recursive = true;
    };
  };
}
