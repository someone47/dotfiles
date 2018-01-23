#!/usr/bin/env bash


# Detect the path to the .dotfiles folder

export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


# Install some symlinks

ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/git/.gitignore_global" ~
ln -sfv "$DOTFILES_DIR/macos/keyboard/U.S-daniel.keylayout" ~/Library/Keyboard\ Layouts
ln -sfv "$DOTFILES_DIR/macos/keyboard/U.S-daniel.icns" ~/Library/Keyboard\ Layouts
