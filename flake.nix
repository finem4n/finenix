{
  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-25.11;
  outputs = { self, nixpkgs }: {
    nixosConfigurations.hp-desktop-pro-g2-desktop = nixpkgs.lib.nixosSystem {
      modules = [ ./configuration.nix ];
    };
  };
}
