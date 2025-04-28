{
  description = "Flake for my configuration.nix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:
  let 
    system = "x86_64-linux";
  in
   {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {inherit inputs;}; 
        modules = [
            ./configuration.nix
            home-manager.nixosModules.home-manager 
            {
                home-manager.useUserPackages = true;
                home-manager.users.terow-rist = import ./modules/home.nix;
            }
            ];
    };

    homeConfigurations = {
      "terow-rist" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = {inherit inputs; }; 
        modules = [ ./modules/home.nix ];
      };
    };
  };
}
