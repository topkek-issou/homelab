export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(zsh-syntax-highlighting zsh-autosuggestions zsh-interactive-cd git docker docker-compose pip poetry python sudo terraform)

zstyle ':completion::complete:make::' tag-order targets variables
zstyle ':completion::complete:make:*:targets' call-command true

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^H" backward-kill-word
bindkey "5~" kill-word

source $ZSH/oh-my-zsh.sh
