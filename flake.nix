{
  description = "My dump Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ragenix = {
      url = "github:yaxitech/ragenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, stylix, ragenix, ... }@inputs:
  let
    system = "x86_64-linux";

    mkHost = { host, stateVersion }: {
      nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs host stateVersion;
        };
        modules = [
          ./hosts/${host}/configuration.nix
          ragenix.nixosModules.default
        ];
      };

      home = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = {
          inherit inputs host stateVersion;
        };
        modules = [
          ./home-manager/home.nix
        ];
      };
    };

    te14 = mkHost {
      host = "te14";
      stateVersion = "25.11";
    };

    nixosHost = mkHost {
      host = "nixos";
      stateVersion = "24.11";
    };

  in {
    nixosConfigurations = {
      te14 = te14.nixos;
      nixos = nixosHost.nixos;
    };

    homeConfigurations = {
      te14 = te14.home;
      nixos = nixosHost.home;
    };
  };
}
