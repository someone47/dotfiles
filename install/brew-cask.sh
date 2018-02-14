# brew-cask.sh

if ! is-macos -o ! is-executable brew; then
    echo "Skipped: Homebrew-Cask"
    return
fi

echo "Installing Homebrew Cask packages"

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
    disk-inventory-x
    dropbox
    enpass
    firefox
    focuswriter
    font-fira-code
    google-chrome
    iTerm2
    java
    java8
    keepassx
    opera
    p4merge
    postman
    sourcetree
    spotify
    sublime-text
    transmission
    virtualbox
    visual-studio-code
    vivaldi
    vlc
    whatsapp
)

brew update
brew upgrade

brew cask install "${apps[@]}"

brew cask cleanup