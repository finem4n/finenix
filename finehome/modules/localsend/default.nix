{ 
  config,
  lib,
  pkgs,
  ... 
}: 

let
  cfg = config.home.modules.localsend;

  arch = 
    if pkgs.stdenv.isx86_64 then
      "x86_64"
    else
      throw "What are you doin?";
in {
  imports = [
    ../flatpaks
  ];

  options.home.modules.localsend = {
    enable = lib.mkEnableOption "Enable flatseal flatpak";
  };

  config = lib.mkIf cfg.enable {
    home.modules.flatpaks.config.enable = true;

    services.flatpak.packages = lib.mkAfter [
      "flathub:app/org.localsend.localsend_app/${arch}/stable"
    ];
  # TODO add config
  };
}
