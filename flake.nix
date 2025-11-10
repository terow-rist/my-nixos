{
  description = "My dump Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    
    home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
    };
    
    ragenix = {
      url = "github:yaxitech/ragenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ragenix, ... }@inputs:
  let 
    system = "x86_64-linux";
    homeStateVersion = "24.05";
    user = "terow-rist";
    hosts = [
      { hostname = "yoga"; stateVersion = "24.11"; }
      # { hostname = "lion"; stateVersion = "25.05"; }
    ];

    makeSystem = { hostname, stateVersion }:
      nixpkgs.lib.nixosSystem {
        system = system;
        specialArgs = {
          inherit inputs stateVersion hostname user;
        };

        modules = [
          ./hosts/${hostname}/configuration.nix
          ragenix.nixosModules.default
        ];
    };

  in
   {
    nixosConfigurations = nixpkgs.lib.foldl'
        (configs: host:
          configs // {
            "${host.hostname}" = makeSystem {
              inherit (host) hostname stateVersion;
            };
          }) { } hosts;

    homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = {
          inherit inputs homeStateVersion user;
        };
        modules = [ ./home-manager/home.nix ];
    };
  };
}
