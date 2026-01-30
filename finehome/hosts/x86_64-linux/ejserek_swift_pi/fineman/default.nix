{ config, lib, pkgs, ... }:

{
  home.username = "fineman"; # TODO read from file or sth
  home.homeDirectory = "/home/fineman";
  imports = [
    ../../../../modules/firefox
  ];

  home.modules.firefox.enable = true;

  home.stateVersion = "25.11"; # Please read the comment before changing. # TODO move to common
}
