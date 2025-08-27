# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!

# Use mambaforge as the conda directory
export CONDA_DIR="$HOME/mambaforge"
# Always add mambaforge bin to PATH
export PATH="$CONDA_DIR/bin:$PATH"


__conda_setup="$($CONDA_DIR/bin/conda 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
        eval "$__conda_setup"
elif [ -f "$CONDA_DIR/etc/profile.d/conda.sh" ]; then
        . "$CONDA_DIR/etc/profile.d/conda.sh"
fi
unset __conda_setup
# <<< conda initialize <<<
