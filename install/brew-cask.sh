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

# "Error: caskroom/cask was moved. Tap homebrew/cask-cask instead."
#brew tap caskroom/cask


# Install packages

apps=(
    atom
    boostnote
    chromium
    dbvisualizer
    disk-drill
    disk-inventory-x
    dotnet-sdk
    dropbox
    enpass
    firefox
    focuswriter
    font-fira-code
    google-chrome
    iTerm2
    java8
    java9
    keepassx
    keepassxc
    opera
    p4merge
    postman
    rar
    soapui
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

brew cleanup
