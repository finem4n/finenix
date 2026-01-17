{ 
  config,
  lib,
  ... 
}: 

let
  cfg = config.home.packages.niri.config;
in {
  options.home.packages.niri.config = {
    enable = lib.mkEnableOption "Enable niri config";
  };

  config = lib.mkIf cfg.enable {
    home.file.".config/niri" = {
      source = ../../../fine-stew/niri;
      recursive = true;
    };
  };
}
