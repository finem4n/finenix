{ 
  # declarative-flatpak, 
  config,
  lib,
  ... 
}: 

let
  cfg = config.home.modules.flatpaks;
in {
  options.home.modules.flatpaks = {
    enable = lib.mkEnableOption "Enable declarative-flatpak";
  };

  config = lib.mkIf cfg.enable {
    imports = [
      declarative-flatpak.homeModules.default
    ];

    services.flatpak = {
      enable = true;
    };

    # TODO if options.flatpak utils. enable
    services.flatpak.packages = lib.mkAfter [
      "com.github.tchx84.Flatseal"
    ];

    # services.flatpak.overrides = lib.mkMerge [
    # "firefox"
    # ]
    # services.flatpak.overrides = lib.mkMerge [
    # "flatseal"
    # ]
  };
}
