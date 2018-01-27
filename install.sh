#!/usr/bin/env bash


# Detect the path to the .dotfiles folder

export DOTFILES_DIR
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"


# Make utilities available

PATH="$DOTFILES_DIR/bin:$PATH"


# Install some symlinks

ln -sfv "$DOTFILES_DIR/system/.bash_profile" ~
ln -sfv "$DOTFILES_DIR/system/.inputrc" ~
ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/git/.gitignore_global" ~
