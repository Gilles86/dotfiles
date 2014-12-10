# oh-my-zsh
ZSH_THEME="robbyrussell"
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
plugins=(git fasd vi-mode dircycle dirhistory dirpersist history-substring-search common-aliases tmux)

## UTF encoding
export LC_ALL=en_US.utf-8 
export LANG="$LC_ALL" 

# Aliases
source ~/.zsh/aliases.zsh

# Environment variables
source ~/.zsh/zshenv.zsh
