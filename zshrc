source ~/.zsh/powerlevel10k.zsh
source ~/.zsh/antigen.zsh

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
antigen bundle common-aliases
antigen bundle fasd
antigen bundle jeffreytse/zsh-vi-mode

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

# Environment variables
source ~/.zsh/zshenv.zsh

# oh-my-zsh
#plugins=(git fasd vi-mode dircycle dirhistory dirpersist history-substring-search common-aliases tmux zsh-apple-touchbar zsh-autosuggestions)
#source $ZSH/oh-my-zsh.sh

## UTF encoding
export LC_ALL=en_US.utf-8 
export LANG="$LC_ALL" 


# Aliases
source ~/.zsh/aliases.zsh

#
# FSL
source ~/.zsh/fsl.zsh

# Conda
source ~/.zsh/conda.zsh

# Key bindings
source ~/.zsh/key_bindings.zsh
#
# Functions
source ~/.zsh/functions.zsh

# Allow local customizations in the ~/.zshrc_local_after file
if [ -f ~/.zsh/local_after.zsh ]; then
    source ~/.zsh/local_after.zsh
fi


# auto-inserted by @update.afni.binaries :
export PATH=$PATH:/Users/gdehol/abin

# auto-inserted by @update.afni.binaries :
export DYLD_LIBRARY_PATH=${DYLD_LIBRARY_PATH}:/opt/X11/lib/flat_namespace

# auto-inserted by @update.afni.binaries :
#    set up tab completion for AFNI programs
if [ -f $HOME/.afni/help/all_progs.COMP.zsh ]
then
   autoload -U +X bashcompinit && bashcompinit
   autoload -U +X compinit && compinit \
      && source $HOME/.afni/help/all_progs.COMP.zsh
fi


