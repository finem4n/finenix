{ 
  declarative-flatpak, 
  config,
  lib,
  ... 
}: 

let
  cfg = config.home.modules.flatpaks.config;
  lib.mkIf pkgs.stdenv.isx86_64 {
    arch = "x86_64"
  };
in {
  imports = [
    declarative-flatpak.homeModules.default
  ];

  options.home.modules.flatpaks.config = {
    enable = lib.mkEnableOption "Enable declarative-flatpak";
  };

  config = lib.mkIf cfg.enable {
    services.flatpak = {
      enable = true;
      remotes = {
        "flathub" = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      };
    };

    # TODO if options.flatpak utils. enable
    services.flatpak.packages = lib.mkAfter [
      "flathub:app/com.github.tchx84.Flatseal/${arch}/stable"
    ];

    # services.flatpak.overrides = lib.mkMerge [
    # "firefox"
    # ]
    # services.flatpak.overrides = lib.mkMerge [
    # "flatseal"
    # ]
  };
}
