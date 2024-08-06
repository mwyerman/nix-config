{
  programs.git = {
    enable = true;
    userEmail = "mwyerman@gmail.com";
    userName = "Max Wyerman";
    lfs.enable = true;
    extraConfig = {
      init.defaultBranch = "main";
      url."git@github.com:".insteadOf = "gh:";
      url."git@github.com:mwyerman/".insteadOf = "gh-mw:";
    };
  };
}
