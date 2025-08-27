# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# ls aliases
alias ll='ls -alFrth'
alias la='ls -A'
alias l='ls'
#
# # Aliases to protect against overwriting
alias cp='cp -i'
alias mv='mv -i'


alias fslview="fsleyes"

alias rsync_='rsync -aHxv --numeric-ids --progress -e "ssh -T -o Compression=no -x"'
