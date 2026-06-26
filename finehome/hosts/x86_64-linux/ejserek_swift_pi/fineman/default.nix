{ config,
  lib,
  pkgs, 
  nixgl,
  ... }:

{
  home.username = "fineman"; # TODO read from file or sth
  home.homeDirectory = "/home/fineman";
  imports = [
    ../../../../modules/firefox
    ../../../../modules/anki
  ];

  # TODO: move to its own module
  targets.genericLinux.nixGL.packages = import nixgl { inherit pkgs; };
  targets.genericLinux.nixGL.defaultWrapper = "mesa";
  targets.genericLinux.nixGL.installScripts = [ "mesa" ];
  # programs.satty.enable = true;

  programs.chromium= {
    enable = true;
    package = (config.lib.nixGL.wrap pkgs.chromium);
  };

  # TODO: move to its own packages
  home.packages = [
    (config.lib.nixGL.wrap pkgs.satty) 
    pkgs.yt-dlp
  ];

  home.modules.firefox = {
    # enable = false;
    enable = true;
    unnixed.enable = false;
    # unnixed.enable = true;
  };

  home.modules.anki = {
    enable = true;
    videoDriver = "software";
  };

  programs.home-manager.enable = true;
  home.stateVersion = "26.05"; # Please read the comment before changing. # TODO move to common
}
