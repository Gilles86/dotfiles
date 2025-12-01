# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!

# Auto-detect conda installation location
# Check common locations and environment variables
if [ -n "$CONDA_PREFIX" ]; then
  CONDA_DIR="$CONDA_PREFIX"
elif [ -d "$HOME/mambaforge" ]; then
  CONDA_DIR="$HOME/mambaforge"
elif [ -d "$HOME/miniforge3" ]; then
  CONDA_DIR="$HOME/miniforge3"
elif [ -d "$HOME/miniconda3" ]; then
  CONDA_DIR="$HOME/miniconda3"
elif [ -d "$HOME/anaconda3" ]; then
  CONDA_DIR="$HOME/anaconda3"
elif [ -d "/opt/conda" ]; then
  CONDA_DIR="/opt/conda"
fi

# Only initialize if conda directory is found
if [ -n "$CONDA_DIR" ] && [ -d "$CONDA_DIR/bin" ]; then
  export PATH="$CONDA_DIR/bin:$PATH"
  
  # Run conda setup
  __conda_setup="$($CONDA_DIR/bin/conda 'shell.zsh' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
    eval "$__conda_setup"
  elif [ -f "$CONDA_DIR/etc/profile.d/conda.sh" ]; then
    . "$CONDA_DIR/etc/profile.d/conda.sh"
  fi
  unset __conda_setup
fi
# <<< conda initialize <<<
