{ pkgs, ... }:
{   
    programs.fish.enable = true;
    users.users.terow-rist = {
        isNormalUser = true;
        description = "Madikozha Issayev";
        extraGroups = [ "networkmanager" "wheel" "docker" "wireshark" ];
        shell = pkgs.fish;
    };
}
