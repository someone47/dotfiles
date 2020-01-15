#!/usr/bin/env bash

# install.sh


# Detect the path to the .dotfiles folder
export DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_CACHE="$DOTFILES_DIR/.cache.sh"

# Make utilities available
PATH="$DOTFILES_DIR/bin:$PATH"

# Create XDG Base Directories
# and do not complain when is already exists (-p)
CACHE_DIR=$HOME/.cache
CONFIG_DIR=$HOME/.config
DATA_DIR=$HOME/.local/share
mkdir -p $CACHE_DIR
mkdir -p $CONFIG_DIR
mkdir -p $DATA_DIR

# ln options
# -s  create a symbolic link
# -f  if the target file already exists, then unlink it so that the link may occur
# -v  verbose, showing files as they are processed

# System config files
# .inputrc - GNU Readline library
ln -sfv "$DOTFILES_DIR/config/_system/.inputrc" ~

# bash
ln -sfv "$DOTFILES_DIR/config/bash/.bash_profile" ~

# zsh
ln -sfv "$DOTFILES_DIR/config/zsh/.zshenv" ~
mkdir -p "$CACHE_DIR/zsh"

# git
ln -sfv "$DOTFILES_DIR/config/git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/config/git/.gitignore_global" ~
[ -f "$HOME/.gitconfig.custom" ]  ||  cp "$DOTFILES_DIR/config/git/.gitconfig.custom" ~

# nvim
ln -sfv "$DOTFILES_DIR/config/nvim" $CONFIG_DIR

# tmux
ln -sfv "$DOTFILES_DIR/config/tmux/.tmux.conf" ~


# Package managers & packages
source "$DOTFILES_DIR/install/brew.sh"
source "$DOTFILES_DIR/install/brew-packages.sh"
source "$DOTFILES_DIR/install/brew-cask.sh"
source "$DOTFILES_DIR/install/install-nvm.sh"
source "$DOTFILES_DIR/install/install-node.sh"
source "$DOTFILES_DIR/install/install-node-packages.sh"
