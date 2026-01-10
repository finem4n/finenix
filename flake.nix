{
  inputs = {
    # nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, disko }: {
    nixosConfigurations.hp_desktop_pro_g2 = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # TODO: create common modules
        disko.nixosModules.disko
        ./wihajsters/secureboot-lanzaboote
	./hosts/x86_64-linux/hp_desktop_pro_g2
      ];
    };
  };
}
