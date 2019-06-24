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

# fasd aliases
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection
alias c='fasd_cd -d'

# Mount Aeneas
alias re=' umount ~/aeneas/data &
sshfs -p 22 aeneas:/home/hollander/data ~/aeneas/data/ -oauto_cache,reconnect,defer_permissions,noappledouble,negative_vncache,volname=home &
umount ~/aeneas/fs_subjects &
sshfs -p 22 aeneas:/home/fs_subjects ~/aeneas/fs_subjects/ -oauto_cache,reconnect,defer_permissions,noappledouble,negative_vncache,volname=fs_subjects &
umount ~/aeneas/raw_data &
sshfs -p 22 aeneas:/home/raw_data ~/aeneas/raw_data/ -oauto_cache,reconnect,defer_permissions,noappledouble,negative_vncache,volname=raw_data &
umount ~/aeneas/shared &
sshfs -p 22 aeneas:/home/shared ~/aeneas/shared/ -oauto_cache,reconnect,defer_permissions,noappledouble,negative_vncache,volname=shared &
umount ~/aeneas/workflow_folders &
sshfs -p 22 aeneas:/tmp/workflow_folders ~/aeneas/workflow_folders/ -oauto_cache,reconnect,defer_permissions,noappledouble,negative_vncache,volname=workflow_folders &'

alias fslview="/Applications/FSLeyes.app/Contents/MacOS/fsleyes"


alias fsl5.0-bet='bet'


# Dockers
alias 7t_hires="docker run -p 8888:8888 -it \
	 	-d \
        	-v /Users/Gilles/data/hires:/data \
		-v /Users/gilles/Dropbox/Science/7t_binocular/hires_ODC_7T/src:/home/neuro/src \
		-v /Users/gilles/Dropbox/Science/7t_binocular/hires_ODC_7T/notebooks:/home/neuro/notebooks \
		knapenlab/hiresbinocularrivalry"
