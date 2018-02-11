# brew-cask.sh

if ! is-macos -o ! is-executable brew; then
    echo "Skipped: Homebrew-Cask"
    return
fi

echo "Installing Homebrew packages"

# brew-cask-upgrade is a command-line tool for upgrading every
# outdated app installed by Homebrew Cask.
# https://github.com/buo/homebrew-cask-upgrade
brew tap buo/cask-upgrade

brew tap caskroom/cask
brew tap caskroom/fonts
brew tap caskroom/versions


# Install packages

apps=(
    atom
    chromium
    dropbox
    firefox
    font-fira-code
    google-chrome
    java
    java8
    opera
    p4merge
    postman
    sourcetree
    spotify
    sublime-text
    transmission
    virtualbox
    visual-studio-code
    vlc
    whatsapp
)

brew update
brew upgrade

brew cask install "${apps[@]}"

brew cask cleanup
