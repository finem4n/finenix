# Resources:
# https://nix-community.github.io/lanzaboote/introduction.html
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
    enable = lib.mkEnableOption "Enable secureboot";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      sbctl
    ];

    boot.loader.systemd-boot.enable = lib.mkForce false;
    boot.loader.efi.canTouchEfiVariables = true;

    boot.lanzaboote = {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
      autoGenerateKeys.enable = true;
      autoEnrollKeys = {
        enable = true;
        autoReboot = true;
      };
    };
  };
}
