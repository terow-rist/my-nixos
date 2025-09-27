{
    nix.nixPath = [
        "nixpkgs=flake:nixpkgs"
        "nixos-config=/home/terow-rist/my-nixos/flake.nix"
    ];

    nix.settings.experimental-features = [ "nix-command" "flakes" ];  
}