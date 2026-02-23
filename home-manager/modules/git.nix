{
  programs.git = {
    enable = true;

    ignores = [
      ".direnv"
      ".envrc"
    ];

    settings = {
      user = {
        name = "Madikozha Issayev";
        email = "m.issayev@7g.team";
      };
      init = {
        defaultBranch = "main";
      };
      push = {
        autoSetupRemote = true;
      };
    };
  };
}
