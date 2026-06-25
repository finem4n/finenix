{  
  config,
  lib,
  pkgs,
  ... 
}: 

let
  cfg = config.modules.login-manager;
in {
  options.modules.login-manager = {
    enable = lib.mkEnableOption "Enable login manager";
  };

  config = lib.mkIf cfg.enable {
    services.greetd = {
      enable = true;
      settings = {
        terminal = {
          vt = 1;
        };
      # default_session = {
      #   command = "${pkgs.greetd.agreety}/bin/agreety -c sway";
      #   user = "fineman";
      # };
        initial_session = {
          # command = "sway";
          command = "${pkgs.sway}/bin/sway";
          user = "fineman";
        };
      };
    };
    # TODO test 
    # https://github.com/tvrzna/emptty/
    # https://github.com/coastalwhite/lemurs
    # https://codeberg.org/fairyglade/ly
    # https://github.com/javalsai/lidm - this one is probably too new
    # https://github.com/loh-tar/tbsm
  };
}
