# install-node.sh

if [ ! -d "$NVM_DIR" ] ; then
    echo "Skipped: install-node (missing: nvm)"
    return
fi


# Install Node with nvm

echo "Installing Node"

nvm install stable
nvm alias default stable
