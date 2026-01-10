{
  pkgs,
  config,
  lib,
  ...
}:

let
  cfg = config.wihajsters.secureboot-lanzaboote;
in {
  options.wihajsters.secureboot-lanzaboote = {
    enable = mkEnableOption "Enable secureboot";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      hello
    ];
  };
}
