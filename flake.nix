{ 
  description = "Fineman's fine NixOS and Home Manager configurations";
  inputs = {
    self.submodules = true;
    # nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;
    # TODO: create overlay for nixpkgs-unstable
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v1.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11"; # TODO let in version
      inputs.nixpkgs.follows = "nixpkgs";
    };

    declarative-flatpak.url = "github:in-a-dil-emma/declarative-flatpak/latest";
  };

  outputs = { self, nixpkgs, disko, lanzaboote, home-manager, declarative-flatpak, ... }: {
    nixosConfigurations = {
      hp_desktop_pro_g2 = 
        let 
          system = "x86_64-linux";
          username = "fineman";
          host = "hp_desktop_pro_g2";
        in
          nixpkgs.lib.nixosSystem {
            inherit system;
            modules = [
              # TODO: create common modules
              disko.nixosModules.disko
              lanzaboote.nixosModules.lanzaboote
              ./wihajsters/secureboot-lanzaboote
              ./modules/users/${username}
              ./modules/desktop/niri-alles
              ./hosts/${system}/${host}
              # ./finehome/programs/niri
              home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true; # TODO whats that
                home-manager.useUserPackages = true; # TODO whats that
                home-manager.users.${username} = ./finehome/hosts/${system}/${host}/${username} ;
              }
            ];
          };
    };

    homeConfigurations."ejserek_swift_pi" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      modules = [ ./finehome/hosts/x86_64-linux/ejserek_swift_pi/fineman ];
    };
  };
}
