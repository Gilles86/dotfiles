# Zsh history configuration (robust)
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt append_history
setopt inc_append_history
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks

# Enable Powerlevel10k instant prompt as early as possible
source ~/.zsh/powerlevel10k.zsh

# --- Zinit Plugin Manager ---
# Install zinit if not present
if [[ ! -f ${ZDOTDIR:-$HOME}/.zinit/bin/zinit.zsh ]]; then
    mkdir -p ~/.zinit
    git clone https://github.com/zdharma-continuum/zinit.git ~/.zinit/bin
fi
source ~/.zinit/bin/zinit.zsh

export TERM="xterm-256color"

# Initialize completion system early (must be before zinit plugins)
autoload -Uz compinit
compinit

# Load the oh-my-zsh's library.
# --- Plugins (converted from Antigen, fixed for zinit) ---
# Use turbo mode (wait'0') to defer plugin loading for faster startup
# Oh My Zsh plugins: use zinit snippet to source plugin scripts directly
zinit wait lucid for \
  OMZP::git \
  OMZP::common-aliases

# Other plugins with turbo mode
# To disable enhancd on slow systems, add to ~/.zshrc_local: export DISABLE_ENHANCD=1
zinit wait lucid light-mode for \
  zsh-users/zsh-autosuggestions \
  zsh-users/zsh-history-substring-search

# Load enhancd only if not disabled
if [[ -z "$DISABLE_ENHANCD" ]]; then
  zinit wait lucid light-mode for b4b4r07/enhancd
fi

# Configure vi-mode before loading to preserve Tab completion
zvm_after_init_commands+=('bindkey "^I" expand-or-complete')

zinit wait lucid light-mode for \
  jeffreytse/zsh-vi-mode

# Place zsh-syntax-highlighting LAST for best performance
zinit wait lucid light-mode for \
  zsh-users/zsh-syntax-highlighting

# Powerlevel10k theme (load immediately, not in turbo mode)
zinit light romkatv/powerlevel10k




# Environment variables
source ~/.zsh/zshenv.zsh

## UTF encoding
export LC_ALL=en_US.utf-8 
export LANG="$LC_ALL" 


# Aliases
source ~/.zsh/aliases.zsh

# Key bindings
source ~/.zsh/key_bindings.zsh

# Bind up/down arrows for history substring search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

#




# auto-inserted by @update.afni.binaries :
export PATH=$PATH:/Users/gdehol/abin

# auto-inserted by @update.afni.binaries :
export DYLD_LIBRARY_PATH=${DYLD_LIBRARY_PATH}:/opt/X11/lib/flat_namespace

# auto-inserted by @update.afni.binaries :
#    set up tab completion for AFNI programs (deferred for faster startup)
if [ -f $HOME/.afni/help/all_progs.COMP.zsh ]; then
   # Defer completion loading
   zinit wait lucid atload'autoload -U +X bashcompinit && bashcompinit' for \
     $HOME/.afni/help/all_progs.COMP.zsh
fi




# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$HOME/.gem/ruby/3.0.0/bin:$PATH"
# Lazy-load rbenv only when ruby/rbenv commands are used
if which rbenv > /dev/null 2>&1; then
  rbenv() {
    unfunction rbenv
    eval "$(command rbenv init -)"
    rbenv "$@"
  }
fi

# Prepend ~/.local/bin to PATH for highest priority
export PATH="$HOME/.local/bin:$PATH"

# Source conda.zsh for conda initialization
source ~/.zsh/conda.zsh

# Allow local customizations in ~/.zshrc_local (must be last for cluster env)
if [ -f ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi

# >>> conda initialize >>>
# Conda is now initialized via ~/.zsh/conda.zsh
# <<< conda initialize <<<

