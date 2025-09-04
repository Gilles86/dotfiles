# Start with system default PATH, then prepend only needed user directories
export PATH="$HOME/ants/bin:$HOME/.local/bin:$HOME/.autojump/bin:$HOME/afni:/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"
export ANTSPATH="$HOME/ants/bin"


export FREESURFER_HOME="$HOME/freesurfer"
export FS_LICENSE="$FREESURFER_HOME/license.txt"
if [ -f "$FREESURFER_HOME/SetUpFreeSurfer.sh" ]; then
	source "$FREESURFER_HOME/SetUpFreeSurfer.sh" >/dev/null
fi

export DATA_DIR="/data"


# Add ~/.local/lib to LD_LIBRARY_PATH for dynamic libraries
export LD_LIBRARY_PATH=$HOME/.local/lib:$LD_LIBRARY_PATH

# Add ~/.local/lib to DYLD_LIBRARY_PATH for macOS dynamic libraries
export DYLD_LIBRARY_PATH=$HOME/.local/lib:$DYLD_LIBRARY_PATH

# Add ~/.local/include to C_INCLUDE_PATH for header files
export C_INCLUDE_PATH=$HOME/.local/include:$C_INCLUDE_PATH

# Add ~/.local/lib to LDFLAGS for linker flags
export LDFLAGS="-L$HOME/.local/lib $LDFLAGS"

# Add ~/.local/include to CPPFLAGS for preprocessor flags
export CPPFLAGS="-I$HOME/.local/include $CPPFLAGS"
