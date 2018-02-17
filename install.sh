#!/usr/bin/env bash


# Detect the path to the .dotfiles folder

export DOTFILES_DIR
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_CACHE="$DOTFILES_DIR/.cache.sh"


# Make utilities available

PATH="$DOTFILES_DIR/bin:$PATH"


# Install some symlinks

ln -sfv "$DOTFILES_DIR/system/.bash_profile" ~
ln -sfv "$DOTFILES_DIR/system/.inputrc" ~
ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/git/.gitignore_global" ~


# Copy file templates

[ -f "$HOME/.gitconfig.local" ]  ||  cp "$DOTFILES_DIR/git/.gitconfig.local" ~


# Package managers & packages

source "$DOTFILES_DIR/install/brew.sh"
source "$DOTFILES_DIR/install/brew-packages.sh"
source "$DOTFILES_DIR/install/brew-cask.sh"
source "$DOTFILES_DIR/install/install-nvm.sh"
source "$DOTFILES_DIR/install/install-node.sh"
source "$DOTFILES_DIR/install/install-node-packages.sh"
