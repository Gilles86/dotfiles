# >>> conda initialize >>>
# Minimal conda setup - avoid conda hook which has hardcoded old paths

# Auto-detect conda installation location - check which one actually has a binary
CONDA_DIR=""
for candidate in "$CONDA_PREFIX" "$HOME/mambaforge" "$HOME/miniforge3" "$HOME/miniconda3" "$HOME/anaconda3" "/opt/conda"; do
  if [ -f "$candidate/bin/conda" ]; then
    CONDA_DIR="$candidate"
    break
  fi
done

# Only initialize if conda binary exists
if [ -f "$CONDA_DIR/bin/conda" ]; then
  export PATH="$CONDA_DIR/bin:$PATH"
  # Source conda profile directly instead of using 'conda shell hook' which has stale paths
  if [ -f "$CONDA_DIR/etc/profile.d/conda.sh" ]; then
    . "$CONDA_DIR/etc/profile.d/conda.sh"
  fi
fi
# <<< conda initialize <<<
