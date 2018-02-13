# node-packages.sh

if ! is-executable npm ; then
  echo "Skipped: node-packages (missing: npm)"
  return
fi

# Globally install node packages with npm

packages=(
    get-port-cli    # Get an available port
    gtop            # Graphic top
    historie        # A searchable history cli
    npm             # A package manager for JavaScript
)

npm install -g "${packages[@]}"
