{
  programs.starship.enable = true;

  # programs.fish.enable = true;
  programs.fish = {
    enable = true;
    # on interactive shell, run tmux if it's not already running
    shellInit = ''
      if not set -q TMUX
        exec tmux
      end
    '';
  };

  home.file = {
    ".config/fish" = {
      source = ../dotfiles/fish;
      recursive = true;
    };
  };
}
