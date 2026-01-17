{ 
  declarative-flatpak, 
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

  imports = lib.mkIf cfg.enable [
    declarative-flatpak.homeModules.default
  ];

  config = lib.mkIf cfg.enable {
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
