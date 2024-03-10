{ pkgs, config, ... }:
{
  programs.tmux = {
    enable = true;
    #extraConfig = ''
    #  set-window-option -g mode-keys vi
    #'';
    keyMode = "vi";
    mouse = true;
  };
}
