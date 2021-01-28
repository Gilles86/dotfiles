# Allow local customizations in the ~/.zshrc_local_before file
if [ -f ~/.zshrc_local_before ]; then
    source ~/.zshrc_local_before
fi

export TERM="xterm-256color"

# oh-my-zsh
#ZSH_THEME="agnoster"
ZSH_THEME="powerlevel9k/powerlevel9k"
export ZSH=$HOME/.oh-my-zsh
plugins=(git fasd vi-mode dircycle dirhistory dirpersist history-substring-search common-aliases tmux zsh-apple-touchbar)
source $ZSH/oh-my-zsh.sh

## UTF encoding
export LC_ALL=en_US.utf-8 
export LANG="$LC_ALL" 

# Aliases
source ~/.zsh/aliases.zsh

# Environment variables
source ~/.zsh/zshenv.zsh

# Key bindings
source ~/.zsh/key_bindings.zsh

# Allow local customizations in the ~/.zshrc_local_after file
if [ -f ~/.zsh/local_after.zsh ]; then
    source ~/.zsh/local_after.zsh
fi
