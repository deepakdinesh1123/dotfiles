{ pkgs, ... }:
let 
 bashrc = builtins.readFile ./.bashrc;
 profile = builtins.readFile ./.profile;
in 
{
 programs.bash = {
    enable = true;
    bashrcExtra = ''
      set -o emacs
      if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
          exec tmux
      fi
    '' + bashrc ;
    profileExtra = ''
      export XDG_DATA_DIRS="/home/deepak/.nix-profile/share:$XDG_DATA_DIRS"
     '' +  profile;
 };
}
