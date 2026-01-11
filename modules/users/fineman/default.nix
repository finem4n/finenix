{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modules.users.fineman;
in {
  options.modules.users.fineman = {
    enable = lib.mkEnableOption "Enable user fineman";
  };

  config = lib.mkIf cfg.enable {

    users.users.fineman = {
      isNormalUser = true;
      createHome = true;
      # pamMount = { }; # NOTE: allows to mount filesystems on user logon
			# How's that different from fstab?
			# See: https://pam-mount.sourceforge.net/pam_mount.conf.5.html
      home = "/home/fineman";
      description = "Ten Kakakura";
      extraGroups = [
        "wheel"
      ];
      shell = pkgs.zsh;
    };

    # Dependencies
    # programs.zsh.enable = true;
    environment.systemPackages = with pkgs; [ 
      zsh 
    ];
  };
}
