# brew-packages.sh

if ! is-macos -o ! is-executable brew; then
    echo "Skipped: brew-packages (missing: brew)"
    return
fi

echo "Installing Homebrew packages"

apps=(
    autoconf
    bash
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
    thefuck
    tree
    unar
    unrar
    wget
    wifi-password
    yarn
    z
)

brew update
brew upgrade

brew install "${apps[@]}"

brew cleanup

export DOTFILES_BREW_PREFIX_COREUTILS=`brew --prefix coreutils`
set-config "DOTFILES_BREW_PREFIX_COREUTILS" "$DOTFILES_BREW_PREFIX_COREUTILS" "$DOTFILES_CACHE"
