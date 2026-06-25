{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modules.desktop.sway-alles;
in {
  options.modules.desktop.sway-alles = {
    enable = lib.mkEnableOption "Install sway and its dependencies";
  };

  config = lib.mkIf cfg.enable {
    programs.sway= {
      enable = true;
      xwayland.enable = true;
      extraPackages = with pkgs; [
      	# TODO zrob z tym porzadek; dlaczego pulseaudio i pozamieniaj te tegesy raczej na programs.dfs.enable
        brightnessctl foot grim pulseaudio swayidle swaylock wmenu 

        kitty # TODO or wezterm or ghostty
        mako # TODO or swaync???
        nautilus
        tofi # TODO or fuzzel or wmenu or wofi or sth else
        wofi # TODO do i really need it?
      ];
    }; 

    xdg.portal = {
      enable = true;
      xdgOpenUsePortal = true;
      wlr.enable = true;
      configPackages = with pkgs; [
        xdg-desktop-portal-gtk
      ];
    };

    services.gnome.sushi.enable = true;

    programs.waybar.enable = true;
    modules.login-manager.enable = true;
  };
}
