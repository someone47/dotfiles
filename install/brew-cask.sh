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

# AdoptOpenJDK
# https://github.com/AdoptOpenJDK/homebrew-openjdk
brew tap AdoptOpenJDK/openjdk

# Install packages

apps=(
    adoptopenjdk8
    adoptopenjdk11
    atom
    boostnote
    brave-browser
    calibre
    #chromium
    #dbvisualizer
    #disk-drill
    discord
    disk-inventory-x
    #dotnet-sdk
    #dropbox
    #enpass
    firefox
    focuswriter
    font-fira-code
    font-ia-writer-duospace
    google-chrome
    iTerm2
    jdownloader
    #java8
    #java9
    jdownloader
    #keepassx
    keepassxc
    kindle
    macpar-deluxe
    mediathekview
    objektiv
    #opera
    p4merge
    postman
    #rar
    signal
    slack
    #soapui
    sourcetree
    spotify
    sublime-text
    sync
    the-unarchiver
    tor-browser
    #transmission
    #virtualbox
    visual-studio-code
    #vivaldi
    vlc
    whatsapp
)

brew update
brew upgrade

brew cask install "${apps[@]}"

brew cleanup
