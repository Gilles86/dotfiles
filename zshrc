# Allow local customizations in the ~/.zshrc_local_before file
if [ -f ~/.zshrc_local_before ]; then
    source ~/.zshrc_local_before
fi

# oh-my-zsh
ZSH_THEME="robbyrussell"
export ZSH=$HOME/.oh-my-zsh
plugins=(git fasd vi-mode dircycle dirhistory dirpersist history-substring-search common-aliases tmux)
source $ZSH/oh-my-zsh.sh

## UTF encoding
export LC_ALL=en_US.utf-8 
export LANG="$LC_ALL" 

# Aliases
source ~/.zsh/aliases.zsh

# Environment variables
source ~/.zsh/zshenv.zsh

# Allow local customizations in the ~/.zshrc_local_after file
if [ -f ~/.zshrc_local_after ]; then
    source ~/.zshrc_local_after
fi
