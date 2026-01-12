{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modules.desktop.niri-alles;
in {
  options.modules.desktop.niri-alles = {
    enable = lib.mkEnableOption "Install niri and its dependencies";
  };

  config = lib.mkIf cfg.enable {
    programs.niri = {
      enable = true;
      useNautilus = true; # TODO check false
    }; 

    xdg.portal = {
      enable = true;
      xdgOpenUsePortal = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gnome
        xdg-desktop-portal-gtk
      ];
    };

    services.gnome.sushi.enable = true;

    environment.systemPackages = with pkgs; [ 
      kitty # TODO or wezterm or ghostty
      mako # TODO or swaync???
      nautilus
      tofi # TODO or fuzzel or wmenu or wofi or sth else
      wofi # TODO do i really need it?
      xwayland-satellite
    ];
  };
}
