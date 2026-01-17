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
    
    # TODO test 
    # https://github.com/coastalwhite/lemurs
    # https://codeberg.org/fairyglade/ly
    # https://github.com/javalsai/lidm - this one is probably too new
    # https://github.com/loh-tar/tbsm
  };
}
