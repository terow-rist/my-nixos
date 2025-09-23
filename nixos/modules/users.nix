{ pkgs, ... }:
{
    users.users.terow-rist = {
        isNormalUser = true;
        description = "Madikozha Issayev";
        extraGroups = [ "networkmanager" "wheel" "docker" ];
        shell = pkgs.fish;
    };
}