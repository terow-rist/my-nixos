{
    programs.firefox.enable = true;
    programs.fish = {
        enable = true;
        shellAbbrs = {

            # nixos abbrs
            nrs = "sudo nixos-rebuild switch --flake"; # add directory path in the end 
            nrb = "sudo nixos-rebuild build --flake";
            nrt = "sudo nixos-rebuild test --flake";
            ng = "nixos-rebuild list-generations";
            #  home-manager
            hs = "home-manager switch --flake"; # add directory path in the end 
            he = "home-manager expire-generations"; # add time example: 0s
            hg = "home-manager generations";
            # docker
            dcu = "docker compose up"; # add flag
            dcd = "docker compose down"; # add flag
            
        };
        interactiveShellInit = ''
            if not contains -- $HOME/go/bin $PATH
            set -x PATH $HOME/go/bin $PATH
            end
        '';
    };
  
}