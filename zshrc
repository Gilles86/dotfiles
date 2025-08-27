# Enable Powerlevel10k instant prompt as early as possible
source ~/.zsh/powerlevel10k.zsh


# Source conda.zsh at the end for typical conda init placement
source ~/.zsh/conda.zsh


# --- Zinit Plugin Manager ---
# Install zinit if not present
if [[ ! -f ${ZDOTDIR:-$HOME}/.zinit/bin/zinit.zsh ]]; then
    mkdir -p ~/.zinit
    git clone https://github.com/zdharma-continuum/zinit.git ~/.zinit/bin
fi
source ~/.zinit/bin/zinit.zsh

export TERM="xterm-256color"

# Load the oh-my-zsh's library.
# --- Plugins (converted from Antigen, fixed for zinit) ---
# Oh My Zsh plugins: use zinit snippet to source plugin scripts directly
zinit snippet https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/git/git.plugin.zsh
zinit snippet https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/common-aliases/common-aliases.plugin.zsh
# Other plugins
zinit light zsh-users/zsh-autosuggestions
zinit light b4b4r07/enhancd
zinit light technomancy/leiningen
# command-not-found is not a standalone repo; skip or use system package if needed
zinit light jeffreytse/zsh-vi-mode
# Place zsh-syntax-highlighting LAST for best performance
zinit light zsh-users/zsh-syntax-highlighting
# Powerlevel10k theme
zinit light romkatv/powerlevel10k


## Allow local customizations in ~/.zshrc_local
if [ -f ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi

# Environment variables
source ~/.zsh/zshenv.zsh


## UTF encoding
export LC_ALL=en_US.utf-8 
export LANG="$LC_ALL" 


# Aliases
source ~/.zsh/aliases.zsh

# Key bindings
source ~/.zsh/key_bindings.zsh

#




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




# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$HOME/.gem/ruby/3.0.0/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
