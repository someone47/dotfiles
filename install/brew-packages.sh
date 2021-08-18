# brew-packages.sh

if ! is-macos -o ! is-executable brew; then
    echo "Skipped: brew-packages (missing: brew)"
    return
fi

echo "Installing Homebrew packages"

apps=(
    antigen

    #asciidoc
    #asciidoctor

    # asdf - Manage multiple runtime versions with a single CLI tool
    # https://asdf-vm.com/
    asdf

    autoconf
    bash
    bash-completion@2
    coreutils
    exa
    fasd
    fish
    ffmpeg
    gettext
    git
    glances
    gnutls
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
    p7zip
    pkg-config
    python
    python3
    readline
    rsync
    sbt
    scala
    #springboot
    ssh-copy-id
    subversion
    thefuck
    tmux
    tree
    unar
    vim
    wget
    wifi-password
    yarn
    youtube-dl
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
