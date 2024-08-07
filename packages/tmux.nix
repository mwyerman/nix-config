{ pkgs, ... }:
let
  tmux-which-key = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "tmux-which-key";
    version = "2024-08-07";
    src = pkgs.fetchFromGitHub {
      owner = "alexwforsythe";
      repo = "tmux-which-key";
      rev = "1f41977";
      sha256 = "sha256-X7FunHrAexDgAlZfN+JOUJvXFZeyVj9yu6WRnxMEA8E=";
    };
    rtpFilepath = "plugin.sh.tmux";
  };
in
{
  programs.tmux = {
    enable = true;
    escapeTime = 0;
    shortcut = "Space";
    baseIndex = 1;
    extraConfig = ''
      set-option -sa terminal-overrides ",*-256color:Tc"

      # clear screen
      bind-key C-l send-keys C-l

      # enable mouse mode
      set-option -g mouse on

      bind \\ split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"
      unbind %
      unbind '"'

      # capital X to kill window
      bind-key X confirm-before kill-window

      # alt shift hjkl
      bind -n M-H resize-pane -L 5
      bind -n M-J resize-pane -D 5
      bind -n M-K resize-pane -U 5
      bind -n M-L resize-pane -R 5
    '';
    plugins = [
      {
        plugin = pkgs.tmuxPlugins.catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavour 'macchiato'
        '';
      }
      pkgs.tmuxPlugins.vim-tmux-navigator
      {
        plugin = tmux-which-key;
        extraConfig = ''
          set -g @tmux-which-key-xdg-enable 1;
        '';
      }
    ];

  };
}
