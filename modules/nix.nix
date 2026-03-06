{
    nix.nixPath = [
        "nixpkgs=flake:nixpkgs"
        "nixos-config=/home/terow-rist/my-nixos/flake.nix"
    ];

    nix.settings = {
        experimental-features = [ "nix-command" "flakes" ]; 
        
        substituters = [
          "https://cache.nixos.kz"
          "https://cache.nixos.org"
        ];  
        
        trusted-public-keys = [
          "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        ];
    };
}