

{ pkgs, config, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "thefuck" "vi-mode" ];
      theme = "half-life";
    };
    initExtra = ''

        bindkey ^R history-incremental-search-backward 
        bindkey ^S history-incremental-search-forward
        INSERT_MODE_INDICATOR="%F{yellow}+%f" 
        bindkey -M viins 'jj' vi-cmd-mode


        if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
          exec tmux
        fi
    '';
  };
}
