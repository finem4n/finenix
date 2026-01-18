{ config, lib, pkgs, ... }:

{
  imports = [ 
    ../../../../programs/niri
    ../../../../modules/flatpaks
  ];
  # TODO add if my user is enabled then
  home.username = "fineman"; # TODO read from file or sth
  home.homeDirectory = "/home/fineman";

  home.stateVersion = "25.11"; # Please read the comment before changing. # TODO move to common

  home.programs.niri.config.enable = true;
  home.modules.flatpaks.config.enable = true;
  home.packages = with pkgs; [
  ];
}
