{ pkgs, ... } :

{
    environment.systemPackages = with pkgs; [
    vim 
    wireguard-tools
    inetutils
    docker
    home-manager
    fish
    ];

}