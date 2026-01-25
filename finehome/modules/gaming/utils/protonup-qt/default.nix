{ 
  config,
  lib,
  pkgs,
  ... 
}: 

let
  # TODO move all programs to modules or sth
  cfg = config.home.modules.gaming.utils.protonup-qt;

  arch = 
    if pkgs.stdenv.isx86_64 then
      "x86_64"
    else
      throw "What are you doin?";
in {
  imports = [
    ../flatpaks
  ];

  options.home.modules.gaming.utils.protonup-qt = {
    enable = lib.mkEnableOption "Enable ProtonUp-Qt Flatpak";
  };

  config = lib.mkIf cfg.enable {
    home.modules.flatpaks.config.enable = true;

    services.flatpak.packages = lib.mkAfter [
      "flathub:app/net.davidotek.pupgui2/${arch}/stable"
    ];
    # TODO add config
  };
}
