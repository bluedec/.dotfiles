{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    lanzaboote = {
	    url = "github:nix-community/lanzaboote/v1.1.0";
	    inputs.nixpkgs.follows = "nixpkgs"; # recomendado, evita duplicar el closure
    };
  };

  outputs = { self, nixpkgs, lanzaboote, ... }:
  let
    system = "x86_64-linux";
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;

      modules = [
      	lanzaboote.nixosModules.lanzaboote
        ./configuration.nix
      ];
    };
  };
}

