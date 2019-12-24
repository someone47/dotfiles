#!/usr/bin/env bash


# Detect the path to the .dotfiles folder

export DOTFILES_DIR
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_CACHE="$DOTFILES_DIR/.cache.sh"


# Make utilities available

PATH="$DOTFILES_DIR/bin:$PATH"


# Install some symlinks

# create .config folder and do not complain when is already exists (-p)
mkdir -p $HOME/.config
ln -sfv "$DOTFILES_DIR/config/nvim" ~/.config

# ln options
# -s  create a symbolic link
# -f  if the target file already exists, then unlink it so that the link may occur
# -v  verbose, showing files as they are processed
ln -sfv "$DOTFILES_DIR/system/.bash_profile" ~
ln -sfv "$DOTFILES_DIR/system/.inputrc" ~
ln -sfv "$DOTFILES_DIR/system/.zshrc" ~
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
