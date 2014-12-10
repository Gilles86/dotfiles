# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh


## UTF encoding
export LC_ALL=en_US.utf-8 
export LANG="$LC_ALL" 


# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

plugins=(git fasd vi-mode dircycle dirhistory dirpersist history-substring-search common-aliases tmux)

source $ZSH/oh-my-zsh.sh

# Aliases
source ~/.zsh/aliases.zsh

# UTF
