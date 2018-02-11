# brew.sh

if ! is-macos -o ! is-executable ruby -o ! is-executable curl -o ! is-executable git; then
    echo "Skipped: Homebrew (missing: ruby, curl and/or git)"
    return
fi


# Install Homebrew

echo "Installing Homebrew"

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap Goles/battery

brew update
brew upgrade


# Install packages

echo "Installing Homebrew packages"

apps=(
    autoconf
    bash-completion
    cmake
    coreutils
    exa
    ffmpeg
    gettext
    git
    glances
    gnutls
    gradle
    hub
    httpie
    jenv
    kotlin
    lame
    leiningen
    neovim
    openconnect
    openssl
    pkg-config
    python
    python3
    readline
    rsync
    sbt
    scala
    ssh-copy-id
    subversion
    tree
    unar
    unrar
    wget
    wifi-password
    yarn
)

brew install "${apps[@]}"
