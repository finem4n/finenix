{ 
  config,
  lib,
  pkgs,
  ... 
}: 

let
  cfg = config.home.programs.steam;

  arch = 
    if pkgs.stdenv.isx86_64 then
      "x86_64"
    else
      throw "What are you doin?";
in {
  imports = [
    ../../modules/flatpaks
  ];

  options.home.programs.steam = {
    enable = lib.mkEnableOption "Enable steam flatpak";
  };

  config = lib.mkIf cfg.enable {
    home.modules.flatpaks.config.enable = true;

    services.flatpak.packages = lib.mkAfter [
      "flathub:app/com.valvesoftware.Steam/${arch}/stable"
    ];
  };
}
