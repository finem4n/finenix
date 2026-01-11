{
  inputs = {
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
  };

  outputs = { self, nixpkgs, disko, lanzaboote }: {
    nixosConfigurations = {
      hp_desktop_pro_g2 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          # TODO: create common modules
          disko.nixosModules.disko
          lanzaboote.nixosModules.lanzaboote
          ./wihajsters/secureboot-lanzaboote
          ./modules/users/fineman
          ./hosts/x86_64-linux/hp_desktop_pro_g2
        ];
      };
    };
  };
}
