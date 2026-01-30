{ config, lib, pkgs, ... }:

{
  imports = [ 
    # TODO move niri to other folder
    ../../../../programs/niri
    # TODO put sth like gaming alles option
    ../../../../modules/steam
    ../../../../modules/gaming/utils/protonup-qt
    ../../../../modules/localsend
    ../../../../modules/firefox
  ];
  # TODO add if my user is enabled then
  home.username = "fineman"; # TODO read from file or sth
  home.homeDirectory = "/home/fineman";

  home.stateVersion = "25.11"; # Please read the comment before changing. # TODO move to common

  # move to desktop default.nix or sth sth
  home.programs.niri.config.enable = true;

  # Productivity
  home.modules.firefox.enable = true;

  # Gaming - move to its own roles sth sth
  home.modules.steam.enable = true;
  home.modules.gaming.utils.protonup-qt.enable = true;
  home.modules.localsend.enable = true;

  home.packages = with pkgs; [
  ];
}
