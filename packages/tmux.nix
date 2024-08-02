{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    escapeTime = 0;
    shortcut = "Space";
    extraConfig = ''
      bind \\ split-window -h
      bind - split-window -v
      unbind %
      unbind '"'

      bind c new-window -c "#{pane_current_path}"

      bind-key X confirm-before kill-window

      bind -n M-h resize-pane -L 5
      bind -n M-j resize-pane -D 5
      bind -n M-k resize-pane -U 5
      bind -n M-l resize-pane -R 5

      # catppuccin
      set -g @catppuccin_flavour 'macchiato'
    '';
    plugins = [
      pkgs.tmuxPlugins.catppuccin
      pkgs.tmuxPlugins.vim-tmux-navigator
    ];

  };
}
