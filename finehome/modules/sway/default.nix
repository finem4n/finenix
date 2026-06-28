{ 
  config,
  lib,
  dotflies,
  ... 
}: 

let
  cfg = config.home.programs.sway.config;
in {
  options.home.programs.sway.config = {
    enable = lib.mkEnableOption "Enable sway config";
  };

  config = lib.mkIf cfg.enable {
    # xdg.configFile.niri = {
    #   source = ../../../fine-stew/niri/.config/niri;
    #   # TODO or maybe should i do fetchfrom git???
    #   recursive = true;
    # };
    wayland.windowManager.sway = {
      enable = true;
      
      config = null;
      extraConfig = builtins.readFile "${dotflies}/.config/sway/config";
    };
  };
}
