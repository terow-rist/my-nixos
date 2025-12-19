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

  outputs = { nixpkgs, home-manager, ragenix, ... }@inputs:
  let 
    system = "x86_64-linux";
  in
   {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {inherit inputs;}; 
        modules = [
            ./hosts/nixos/configuration.nix
            ragenix.nixosModules.default
        ];
    };

    homeConfigurations.terow-rist = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = {
          inherit inputs;
        };
        modules = [ ./home-manager/home.nix ];
    };
  };
}
