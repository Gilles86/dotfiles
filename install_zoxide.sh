#!/usr/bin/env bash

# Install zoxide if not already installed
if command -v zoxide >/dev/null 2>&1; then
    echo "zoxide is already installed"
    exit 0
fi

# Try package managers first
if command -v brew >/dev/null 2>&1; then
    echo "Installing zoxide via Homebrew..."
    brew install zoxide
elif sudo -n true 2>/dev/null; then
    # Only try sudo package managers if we have passwordless sudo
    if command -v apt-get >/dev/null 2>&1; then
        echo "Installing zoxide via apt-get..."
        sudo apt-get install -y zoxide 2>/dev/null || true
    elif command -v yum >/dev/null 2>&1; then
        echo "Installing zoxide via yum..."
        sudo yum install -y zoxide 2>/dev/null || true
    fi
fi

# If still not installed, install from binary (no sudo needed)
if ! command -v zoxide >/dev/null 2>&1; then
    echo "Installing zoxide binary to ~/.local/bin..."
    mkdir -p ~/.local/bin
    curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
    echo "zoxide installed to ~/.local/bin/zoxide"
fi
