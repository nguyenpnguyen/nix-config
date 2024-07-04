{ config, pkgs, ... }:

{
  home = {
    file = {
      "bin/tmux-sessionizer" = {
	source = ./tmux-sessionizer;
	executable = true;
      };
    };
  };
  programs.tmux = {
    enable = true;
    plugins = with pkgs; [
      tmuxPlugins.sensible
      tmuxPlugins.yank
      tmuxPlugins.vim-tmux-navigator
      {
	plugin = tmuxPlugins.catppuccin;
	extraConfig = ''
	  set -g @catppuccin_flavour 'macchiato'
	'';
      }
    ];
    extraConfig = ''
      set -ga terminal-overrides ",xterm-256color:Tc"
      set -g mouse on

      unbind C-b
      set -g prefix C-a
      bind C-a send-prefix

      set-option -g default-terminal "xterm-256color"

      # Vim style pane selection
      bind h select-pane -L
      bind j select-pane -D 
      bind k select-pane -U
      bind l select-pane -R

      # Start windows and panes at 1, not 0
      set -g base-index 1
      set -g pane-base-index 1
      set-window-option -g pane-base-index 1
      set-option -g renumber-windows on

      # Shift arrow to switch windows
      bind -n S-Left  previous-window
      bind -n S-Right next-window

      # Shift Alt vim keys to switch windows
      bind -n M-H previous-window
      bind -n M-L next-window

      # Tmux-sessionizer
      bind-key -r f run-shell "tmux neww ~/bin/tmux-sessionizer"

      # set vi-mode
      set-window-option -g mode-keys vi

      # keybindings
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

      bind - split-window -v -c "#{pane_current_path}"
      bind | split-window -h -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}" 
    '';
  };
}
