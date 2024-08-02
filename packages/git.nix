{
  programs.git = {
    enable = true;
    userEmail = "mwyerman@gmail.com";
    userName = "Max Wyerman";
    lfs.enable = true;
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
