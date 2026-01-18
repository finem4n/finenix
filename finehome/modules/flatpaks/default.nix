{ 
  declarative-flatpak, 
  config,
  lib,
  pkgs,
  ... 
}: 

let
  cfg = config.home.modules.flatpaks.config;

  arch = 
    if pkgs.stdenv.is86_64 then
      "x86_64"
    else
      throw "What are you doin";
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
