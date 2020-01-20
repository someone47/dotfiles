# brew-packages.sh

if ! is-macos -o ! is-executable brew; then
    echo "Skipped: brew-packages (missing: brew)"
    return
fi

echo "Installing Homebrew packages"

apps=(
    antigen
    autoconf
    bash
    bash-completion@2
    cmake
    coreutils
    exa
    fasd
    fish
    ffmpeg
    gettext
    git
    glances
    gnutls
    golang
    gradle
    hub
    htop
    httpie
    jenv
    kotlin
    lame
    leiningen
    maven
    maven-completion
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
    springboot
    ssh-copy-id
    subversion
    thefuck
    tmux
    tree
    unar
    unrar
    vim
    wget
    wifi-password
    yarn
    z
    zsh
    zsh-completions
)

brew update
brew upgrade

brew install "${apps[@]}"

brew cleanup

export DOTFILES_BREW_PREFIX_COREUTILS=`brew --prefix coreutils`
setconfig "DOTFILES_BREW_PREFIX_COREUTILS" "$DOTFILES_BREW_PREFIX_COREUTILS" "$DOTFILES_CACHE"
