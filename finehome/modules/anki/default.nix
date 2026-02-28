{ 
  config, 
  lib,
  ... 
}:

let
  cfg = config.home.modules.anki;
in {
  options.home.modules.anki = {
    enable = lib.mkEnableOption "Enable Anki";

    videoDriver = lib.mkOption {
      type = lib.types.str;
      default = "vulkan"; 
      description = "Video driver for Anki";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.anki = {
      enable = true;
      theme = "dark";
      reduceMotion = true;
      hideTopBar = false;
      hideBottomBar = false;
      style = "anki";

      videoDriver = cfg.videoDriver;
    };
  };
}
