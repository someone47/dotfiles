# node.sh

if ! is-executable brew -o ! is-executable git; then
    echo "Skipped: npm (missing: brew and/or git)"
    return
fi

# Install npm - Node Version Manager
# Simple bash script to manage multiple active node.js versions
# https://github.com/creationix/nvm

# Install npm with homebrew
echo "Installing nvm"
brew install nvm

# Store the npm folder as environment variable
DOTFILES_CACHE="$DOTFILES_DIR/.cache.sh"
export DOTFILES_BREW_PREFIX_NVM=`brew --prefix nvm`
set-config "DOTFILES_BREW_PREFIX_NVM" "$DOTFILES_BREW_PREFIX_NVM" "$DOTFILES_CACHE"

# Install Node with nvm
echo "Installing Node"
source "${DOTFILES_DIR}/system/.nvm"
nvm install 8
nvm alias default 8
