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

# fsl:
source ~/.zsh/fsl.zsh

# Allow local customizations in the ~/.zshrc_local_after file
if [ -f ~/.zshrc_local_after ]; then
    source ~/.zshrc_local_after
fi
alias blender=/Applications/Blender/blender.app/Contents/MacOS/blender

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/gilles/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/gilles/miniconda3/etc/profile.d/conda.sh" ]; then
# . "/Users/gilles/miniconda3/etc/profile.d/conda.sh"  # commented out by conda initialize
    else
# export PATH="/Users/gilles/miniconda3/bin:$PATH"  # commented out by conda initialize
    fi
fi
unset __conda_setup

if [ -z "$TMUX" ]; then
    tmux attach -t default || tmux new -s default
fi
