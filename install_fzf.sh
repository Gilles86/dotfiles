#!/usr/bin/env bash

# Install fzf if not already installed
if command -v fzf >/dev/null 2>&1; then
    echo "fzf is already installed"
    exit 0
fi

# Try package managers first (only if we have sudo access)
if command -v brew >/dev/null 2>&1; then
    echo "Installing fzf via Homebrew..."
    brew install fzf
elif sudo -n true 2>/dev/null; then
    # Only try sudo package managers if we have passwordless sudo
    if command -v apt-get >/dev/null 2>&1; then
        echo "Installing fzf via apt-get..."
        sudo apt-get install -y fzf 2>/dev/null || true
    elif command -v yum >/dev/null 2>&1; then
        echo "Installing fzf via yum..."
        sudo yum install -y fzf 2>/dev/null || true
    fi
fi

# If still not installed, build from source
if ! command -v fzf >/dev/null 2>&1; then
    echo "Installing fzf from source to ~/.local/bin..."
    mkdir -p ~/.local/bin
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --bin
    ln -sf ~/.fzf/bin/fzf ~/.local/bin/fzf
    echo "fzf installed to ~/.local/bin/fzf"
fi
