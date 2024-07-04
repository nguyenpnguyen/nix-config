{ config, pkgs, ... }:

let
  aliases = {
    ll = "ls -l";
    ".." = "cd ..";
  }; 
  zshProfile = ''
    if [ -d "$HOME/bin" ] ; then
      PATH="$HOME/bin:$PATH"
    fi

    if [ -d "$HOME/.local/bin" ] ; then
      PATH="$HOME/.local/bin:$PATH"
    fi 

    bindkey -s ^F "tmux-sessionizer\n"

    export PATH
    export MOZ_ENABLE_WAYLAND=1 
  '';
in {
  programs = {
    zsh = {
      enable = true;
      autosuggestion.enable = true;
      enableCompletion = true;
      autocd = true;
      shellAliases = aliases; 
      profileExtra = zshProfile;
      initExtra = ''
	source $HOME/.zprofile
	'';
      oh-my-zsh = {
	enable = true;
	theme = "candy";
      };
    };

    bash = {
      enable = true;
      shellAliases = aliases;
    };
  };
}
