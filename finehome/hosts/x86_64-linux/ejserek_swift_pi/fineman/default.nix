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
  nixGL.packages = import nixgl { inherit pkgs; };
  nixGL.defaultWrapper = "mesa";
  nixGL.installScripts = [ "mesa" ];
  # programs.satty.enable = true;

  # TODO: move to its own packages
  home.packages = [
    (config.lib.nixGL.wrap pkgs.satty) 
    pkgs.yt-dlp
  ];

  home.modules.firefox = {
    enable = true;
    unnixed.enable = true;
  };
  home.modules.anki = {
    enable = true;
    videoDriver = "software";
  };




  programs.home-manager.enable = true;
  home.stateVersion = "25.11"; # Please read the comment before changing. # TODO move to common
}
