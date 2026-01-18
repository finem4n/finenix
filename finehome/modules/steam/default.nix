{ 
  config,
  lib,
  pkgs,
  ... 
}: 

let
  # TODO move all programs to modules or sth
  cfg = config.home.modules.steam;

  arch = 
    if pkgs.stdenv.isx86_64 then
      "x86_64"
    else
      throw "What are you doin?";
in {
  imports = [
    ../flatpaks
  ];

  options.home.modules.steam = {
    enable = lib.mkEnableOption "Enable steam flatpak";
  };

  config = lib.mkIf cfg.enable {
    home.modules.flatpaks.config.enable = true;

    services.flatpak.packages = lib.mkAfter [
      "flathub:app/com.valvesoftware.Steam/${arch}/stable"
    ];

    home.packages = with pkgs; [
      steam-devices-udev-rules
    ];
  };
}
