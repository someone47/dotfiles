# brew-cask.sh

if ! is-macos -o ! is-executable brew; then
    echo "Skipped: Homebrew-Cask"
    return
fi

echo "Installing Homebrew Cask packages"

# brew-cask-upgrade is a command-line tool for upgrading every
# outdated app installed by Homebrew Cask.
# https://github.com/buo/homebrew-cask-upgrade
#brew tap buo/cask-upgrade

# "Error: caskroom/cask was moved. Tap homebrew/cask-cask instead."
#brew tap caskroom/cask

# AdoptOpenJDK
# https://github.com/AdoptOpenJDK/homebrew-openjdk
#brew tap AdoptOpenJDK/openjdk

# Alternate versions of Casks
# https://github.com/Homebrew/homebrew-cask-versions
# Needed for specific JDK versions (e.g. temurin8)
brew tap homebrew/cask-versions

# Install packages

apps=(
    atom
    boostnote
    #brave-browser
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
    jdownloader
    keepassxc
    kindle
    macpar-deluxe
    mediathekview
    objektiv
    p4merge
    postman
    signal
    slack
    sourcetree
    spotify
    sublime-text

    # Do not install sync via Homebrew because macOS demands
    # confirmation before starting a program downloaded from
    # the internet.
    #sync

    temurin
    temurin8
    temurin11
    temurin17
    the-unarchiver
    tor-browser
    #transmission
    #virtualbox
    visual-studio-code
    vlc
    whatsapp
)

brew update
brew upgrade

brew install --cask "${apps[@]}"

brew cleanup
