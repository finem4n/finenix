{ 
  config,
  lib,
  ... 
}: 

let
  cfg = config.home.programs.niri.config;
in {
  options.home.programs.niri.config = {
    enable = lib.mkEnableOption "Enable niri config";
  };

  config = lib.mkIf cfg.enable {
    xdg.configFile."niri" = {
      source = ../../../fine-stew/niri/.config/niri;
      recursive = true;
    };
  };
}
