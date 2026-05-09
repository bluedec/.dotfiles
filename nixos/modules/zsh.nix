{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    enableCompletion = true;

    shellInit = ''
      # History settings
      HISTSIZE=10000
      SAVEHIST=10000
      setopt SHARE_HISTORY
      setopt HIST_IGNORE_DUPS
      setopt HIST_REDUCE_BLANKS

      # Better word navigation
      bindkey '^[[1;5C' forward-word
      bindkey '^[[1;5D' backward-word

      # fzf keybindings
      source ${pkgs.fzf}/share/fzf/key-bindings.zsh
      source ${pkgs.fzf}/share/fzf/completion.zsh

      # zoxide
      eval "$(${pkgs.zoxide}/bin/zoxide init zsh)"
    '';
  };

  environment.systemPackages = with pkgs; [
    fzf
    zoxide
  ];

  # Make zsh the default shell
  users.defaultUserShell = pkgs.zsh;
}
