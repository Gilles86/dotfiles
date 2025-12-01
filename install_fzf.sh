#!/usr/bin/env bash

# Install fzf if not already installed
if command -v fzf >/dev/null 2>&1; then
    echo "fzf is already installed"
    exit 0
fi

# Try package managers first
if command -v brew >/dev/null 2>&1; then
    echo "Installing fzf via Homebrew..."
    brew install fzf
elif command -v apt-get >/dev/null 2>&1; then
    echo "Installing fzf via apt-get..."
    sudo apt-get install -y fzf 2>/dev/null || true
elif command -v yum >/dev/null 2>&1; then
    echo "Installing fzf via yum..."
    sudo yum install -y fzf 2>/dev/null || true
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
