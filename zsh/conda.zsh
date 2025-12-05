# >>> conda initialize >>>
# Minimal conda setup - avoid conda hook which has hardcoded old paths

# Auto-detect conda installation location
if [ -n "$CONDA_PREFIX" ]; then
  CONDA_DIR="$CONDA_PREFIX"
elif [ -d "$HOME/miniforge3" ]; then
  CONDA_DIR="$HOME/miniforge3"
elif [ -d "$HOME/mambaforge" ]; then
  CONDA_DIR="$HOME/mambaforge"
elif [ -d "$HOME/miniconda3" ]; then
  CONDA_DIR="$HOME/miniconda3"
elif [ -d "$HOME/anaconda3" ]; then
  CONDA_DIR="$HOME/anaconda3"
elif [ -d "/opt/conda" ]; then
  CONDA_DIR="/opt/conda"
fi

# Only initialize if conda binary exists
if [ -f "$CONDA_DIR/bin/conda" ]; then
  export PATH="$CONDA_DIR/bin:$PATH"
  # Source conda profile directly instead of using 'conda shell hook' which has stale paths
  if [ -f "$CONDA_DIR/etc/profile.d/conda.sh" ]; then
    . "$CONDA_DIR/etc/profile.d/conda.sh"
  fi
fi
# <<< conda initialize <<<
