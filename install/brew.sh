# brew.sh

if ! is-macos -o ! is-executable ruby -o ! is-executable curl -o ! is-executable git; then
    echo "Skipped: Homebrew (missing: ruby, curl and/or git)"
    return
fi


# Install Homebrew

echo "Installing Homebrew"

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap Goles/battery

# Spring from Pivotal
brew tap pivotal/tap

brew update
brew upgrade
