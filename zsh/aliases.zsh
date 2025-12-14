# Quick directory up aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# ls aliases - override system defaults with custom options
unalias ls 2>/dev/null  # Clear any system aliases
alias ls='ls -Fh'       # Add file type indicators and human-readable sizes
alias ll='ls -AlFhtr'   # Long format, all files, time-sorted (newest last)
alias la='ls -A'        # All files except . and ..
alias l='ls -CF'        # Compact columnar format

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    # Add color to our ls aliases
    alias ls='ls -Fh --color=auto'
    alias ll='ls -AlFhtr --color=auto'
    alias la='ls -A --color=auto'
    alias l='ls -CF --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# ls aliases (cross‑platform)
# Show long list, almost-all, classify, human sizes, sort by time, reverse (latest last)
alias ll='ls -AlFhtr'
alias la='ls -A'
alias l='ls'
#
# # Aliases to protect against overwriting
alias cp='cp -i'
alias mv='mv -i'


alias fslview="fsleyes"

alias rsync_='rsync -aHxv --numeric-ids --progress -e "ssh -T -o Compression=no -x"'

# SLURM job monitoring
alias qme='squeue -u $USER --array -j --format="%.25i %.9P %.50j %.10u %.2t %.10M %.6D"'
