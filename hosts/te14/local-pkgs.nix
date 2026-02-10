{ pkgs, ... } :

{
    environment.systemPackages = with pkgs; [
    vim 
    wireguard-tools
    tailscale
    inetutils
    docker
    home-manager
    fish
    ];

}