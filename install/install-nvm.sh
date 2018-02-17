# install-nvm.sh

if ! is-executable git; then
    echo "Skipped: install-nvm (missing: git)"
    return
fi

# Install nvm - Node Version Manager
# Simple bash script to manage multiple active node.js versions
# https://github.com/creationix/nvm

echo "Installing nvm"
# see https://github.com/creationix/nvm#manual-install

export NVM_DIR="$HOME/.nvm"

# Clone nvm with Git if it is not there yet
if [ ! -d "$NVM_DIR" ] ; then
    git clone https://github.com/creationix/nvm.git "$NVM_DIR"
fi

# Checkout the latest version tag
(
    cd "$NVM_DIR"
    git fetch --tags --all
    git -c advice.detachedHead=false checkout `git describe --abbrev=0 --tags --match "v[0-9]*" origin`
)

# Activate nvm
source "$NVM_DIR/nvm.sh"
