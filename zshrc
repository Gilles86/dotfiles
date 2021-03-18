source ~/.zsh/antigen.zsh
source ~/.zsh/powerlevel10k.zsh
export TERM="xterm-256color"

# Load the oh-my-zsh's library.
antigen use oh-my-zsh
#
# # Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle autojump
antigen bundle autosuggestions
antigen bundle enhancd
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
antigen bundle zsh-autosuggestions
antigen bundle vi-mode
antigen bundle common-aliases
antigen bundle fasd

##
## # Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
#
# # Load the theme.
antigen theme romkatv/powerlevel10k
#
# # Tell Antigen that you're done.
antigen apply
# Allow local customizations in the ~/.zshrc_local_before file
if [ -f ~/.zshrc_local_before ]; then
    source ~/.zshrc_local_before
fi


# oh-my-zsh
#plugins=(git fasd vi-mode dircycle dirhistory dirpersist history-substring-search common-aliases tmux zsh-apple-touchbar zsh-autosuggestions)
#source $ZSH/oh-my-zsh.sh

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
