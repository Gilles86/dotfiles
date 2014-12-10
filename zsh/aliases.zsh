# Use colors in coreutils utilities output
# alias ls='ls --color=auto'
# export GREP_OPTIONS="--color"
#
# ls aliases
alias ll='ls -la'
alias la='ls -A'
alias l='ls'
#
# # Aliases to protect against overwriting
alias cp='cp -i'
alias mv='mv -i'

# fasd aliases
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection
