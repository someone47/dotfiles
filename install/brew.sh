# brew.sh

if ! is-macos -o ! is-executable ruby -o ! is-executable curl -o ! is-executable git; then
    echo "Skipped: Homebrew (missing: ruby, curl and/or git)"
    return
fi


# Install Homebrew

echo "Installing Homebrew"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew tap Goles/battery

# Spring from Pivotal
#brew tap pivotal/tap

# Fira Font
brew tap homebrew/cask-fonts

brew update
brew upgrade
