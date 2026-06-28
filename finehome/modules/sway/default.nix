{ 
  config,
  lib,
  dotflies,
  ... 
}: 

let
  cfg = config.home.modules.sway.config;
in {
  options.home.modules.sway.config = {
    enable = lib.mkEnableOption "Enable sway config";
  };

  # TODO needs configuring
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
