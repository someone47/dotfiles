# aliases.zsh


alias cddf="cd ~/.dotfiles"             # Goto dotfiles directory
alias edf="code ~/.dotfiles"            # Open dotfiles in editor
alias reload="source $DOTFILES_DIR/config/zsh/.zshrc"   # Reload shell config


# Shortcuts

alias q=exit                            # q: exit
alias g=git                             # g: git
alias e=$EDITOR                         # e: start text editor
alias k=kubectl                         # k: kubectl

alias mux=tmuxinator                    # mux: tmuxinator
alias vim=nvim                          # Use Neovim instead of Vim
alias vi=nvim                           # Use Neovim instead of Vi
alias unjar=unar                        # Extract jar


# List declared aliases, functions, paths

alias aliases="alias | sed 's/=.*//'"
alias functions="declare -f | grep '^[a-z].* ()' | sed 's/{$//'"
alias paths='echo -e ${PATH//:/\\n}'    # Print each PATH entry on a separate line


# Directory listing/traversal

# a - all, h - human readable, l - long
# F: / = directory, * = executable, @ = symlink, = = socket,
# % = whiteout, | = FIFO, G = Color

alias dir='ls -FGlah'
alias l='ls -FGlah'
alias ll="ls -l"
alias la="ls -a"

# exa
# https://github.com/ogham/exa
alias lx="exa -abghl --git --color=automatic"

alias ~="cd ~"       # ~: go to home directory
alias -- -="cd -"    # -: go to last directory (cd -)

# Trees
# -a           - show hidden files (beginning with a dot)
# -C           - use colors
# -I <pattern> - do not show files conforming to this pattern
# --dirsfirst  - show folders before files
alias tri="tree -a -F -I '.git|node_modules|bower_components' --dirsfirst"
alias trid="tri -d"
alias trid2="tri -d -L 2"
alias trid3="tri -d -L 3"

# gitg: aktuellen Branch als Graph
alias gitg='git log --graph --decorate --oneline'

# uuid: generate a uuid with all uppercase letters
alias uuid='uuidgen'

# guid: generate a uuid with all lowercase letters
alias guid='uuidgen | tr "[:upper:]" "[:lower:]"'

# Copy public key to clipboard:
alias pubkey="cat ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

# Show local ip:
alias localip="ipconfig getifaddr en0"
alias localips="ifconfig | grep "inet " | grep -Fv 127.0.0.1 | awk '{print $2}'"

# Recursively remove .DS_Store files
alias cleanupds="find . -type f -name '*.DS_Store' -ls -delete"

# Homebrew
alias cask="brew cask"
alias brewup='brew update; brew upgrade; brew cleanup'
alias caskup='brew cu'

# f: open current folder in Finder
alias f='open -a Finder ./'

# n: Neues Terminal im gleichem Verzeichnis oeffen (new/openhere)
alias n='open -a /Applications/Utilities/Terminal.app .'

# Copy pwd to clipboard
alias cpwd="pwd|tr -d '\n'|pbcopy"

# Exclude macOS specific files in ZIP archives
alias zip="zip -x *.DS_Store -x *__MACOSX* -x *.AppleDouble*"

# Start screen saver
alias afk="/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine"

# Quick-Look preview files from the command line
alias ql="qlmanage -p &>/dev/null"

# Recursively remove Apple meta files
alias cleanupds="find . -type f -name '*.DS_Store' -ls -exec /bin/rm {} \;"
alias cleanupad="find . -type d -name '.AppleD*' -ls -exec /bin/rm -r {} \;"

# PlantUML
alias plantuml-server="docker run -d -p 40000:8080 --name plantuml-server plantuml/plantuml-server:jetty && sleep 3; open http://localhost:40000/"


###
###  Suffix Aliases
###

alias -s txt="open -t"
