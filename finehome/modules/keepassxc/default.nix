{ 
  config,
  lib,
  pkgs,
  ... 
}: 

let
  cfg = config.home.modules.keepassxc;

  arch = 
    if pkgs.stdenv.isx86_64 then
      "x86_64"
    else
      throw "What are you doin?";
in {
  imports = [
    ../flatpaks
  ];

  options.home.modules.keepassxc = {
    enable = lib.mkEnableOption "Enable KeePassXC flatpak";
  };

  config = lib.mkIf cfg.enable {
    home.modules.flatpaks.config.enable = true;

    services.flatpak.packages = lib.mkAfter [
      "flathub:app/org.keepassxc.KeePassXC/${arch}/stable"
    ];
  # TODO add config
  };
}
