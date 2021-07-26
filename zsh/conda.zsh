# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
export CONDA_DIR="$HOME/miniconda3"
__conda_setup="$($CONDA_DIR/bin/conda 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$CONDA_DIR/etc/profile.d/conda.sh" ]; then
        . "$CONDA_DIR/etc/profile.d/conda.sh"
    else
        export PATH="$CONDA_DIR/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
