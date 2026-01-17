{ config, lib, pkgs, ... }:

{
  # TODO add if my user is enabled then
  home.username = "fineman"; # TODO read from file or sth
  home.homeDirectory = "/home/fineman";

  home.stateVersion = "25.11"; # Please read the comment before changing. # TODO move to common

  home.packages = with pkgs; [
  ];
}
