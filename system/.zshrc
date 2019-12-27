# .zshrc


###
###  dotfiles
###

export DOTFILES_DIR=$HOME/.dotfiles



###
###  System settings
###

# Default text editor
export EDITOR="code"

# Prefer US English and use UTF-8
export LANG=en_US.UTF-8

# Encoding for Subversion Repository of Textmate bundels
# http://manual.macromates.com/en/bundles#getting_more_bundles
export LC_CTYPE=en_US.UTF-8

# Enable colors
# see http://osxdaily.com/2013/02/05/improve-terminal-appearance-mac-os-x/
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad



###
###  ZSH settings
###

# Case Insensitive Globbing (expansion of wildcard characters,
# such as * and ? into full file paths and names)
setopt NO_CASE_GLOB

# Change directory by entering the path to a directory without the leading cd
setopt AUTO_CD

# Corrections
# % Dekstop
# zsh: correct 'Dekstop' to 'Desktop' [nyae]?
# n: execute as typed
# y: accept and execute the suggested correction
# a: abort and do nothing
# e: return to the prompt to continue editing
setopt CORRECT



###
###  History configuration
###

# Where to save history to disk
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history

# How many lines of history to keep in memory
HISTSIZE=2000

# Number of history entries to save to disk
SAVEHIST=5000

# Adds commands as they are typed, not at shell exit
setopt INC_APPEND_HISTORY

# Share history across multiple zsh sessions
setopt SHARE_HISTORY

# Append to history
setopt APPEND_HISTORY

# Do not store duplications
setopt HIST_IGNORE_DUPS

# Delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt HIST_EXPIRE_DUPS_FIRST

# Removes blank lines from history
setopt HIST_REDUCE_BLANKS

# Record more data (timestamp in unix epoch time, elapsed time of the command)
setopt EXTENDED_HISTORY

# Show command with history expansion to user before running it (e.g. using !!)
setopt HIST_VERIFY

# Ignore commands that start with space
setopt HIST_IGNORE_SPACE



###
###  Aliases
###

# Shortcuts

alias reload="source ~/.zshrc"
alias g=git                             # g: git
alias e=$EDITOR                         # e: start text editor
alias k=kubectl                         # k: kubectl

alias vim=nvim                          # Use Neovim instead of Vim
alias vi=nvim                           # Use Neovim instead of Vi


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

# hub wraps git and adds features for working with GitHub
is-executable hub  &&  eval "$(hub alias -s)"

# Copy public key to clipboard:
alias pubkey="cat ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

# Show local ip:
alias localip="ipconfig getifaddr en0"

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



###
###  Suffix Aliases
###

alias -s txt="open -t"



###
###  Functions
###

# mcd - Makes new dir and jumps inside
# $1: a directory
# e.g. > mcd abc/def/ghi
function mcd() {
    mkdir -p "$1"  &&  cd "$1";
}

# prepend-path - Puts the given directory at the start of the PATH
# $1: a directory
# e.g. > prepend-path "/sbin"
function prepend-path() {
    [ -d $1 ]  &&  PATH="$1:$PATH"
}

# fs - Determine size of a file or total size of a directory
# $1: a file or a directory
# e.g.
# > fs temp
# 17G  temp
function fs() {
    if du -b /dev/null > /dev/null 2>&1; then
        local arg=-sbh;
    else
        local arg=-sh;
    fi
    if [[ -n "$@" ]]; then
        du $arg -- "$@";
    else
        du $arg .[^.]* ./*;
    fi;
}

# cdf - cd into whatever is the forefront Finder window.
function cdf() {
    local path=$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')
    echo "$path"
    cd "$path"
}

# manpdf - Open man page as PDF
# $1: a command
# e.g.
# > manpdf ls
function manpdf() {
    man -t "$1" | open -f -a /Applications/Preview.app/
}



###
###  Prompt
###

# %m       - first element of the hostname
# %#       - "#" when super user, otherwise "%"
# %~       - current working directory, shortening home to ~
# %2~      - like %~, but show only last 2 elements
# %F{blue} - switch to color blue (black, red, green, yellow, blue, magenta, cyan and white)
# %F{114}  - 0..255, 256 color pallet
# %f       - switch to default color
# %B...%b  - bold font
# %?       - previous command’s exit code
# %(?.<success>.<failure>) - expression success when last command returned
#                            with exit code 0, otherwise failure expression

PROMPT='%(?..%F{red}?%? )%f%B%F{magenta}%~%f%b %# '



###
###  Path part 1
###

path+="$HOME/bin"
path+="$HOME/.local/bin"
path+="$DOTFILES_DIR/bin"



###
###  Key Bindings
###

bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search



###
###  Completion
###

# Case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# Partial completion suggestions
# e.g. "cd /u/lo/b⇥" goes to "cd /usr/local/bin"
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix

# Enable the default zsh completions
autoload -Uz compinit && compinit

# Load bashcompinit for some old bash completions
autoload bashcompinit && bashcompinit



###
###  jEnv
###

# jEnv is a command line tool to help you forget how to set the JAVA_HOME
# environment variable (http://www.jenv.be/).
# jenv must be appear in PATH before Maven otherwise the jenv shims will
# not work.

eval "$(jenv init -)"



###
###  NVM - Node Version Manager
###

# Simple bash script to manage multiple active node.js versions
# https://github.com/creationix/nvm

if [ -f "$HOME/.nvm/nvm.sh" ]; then

    # Improve startup time of bash shell by delaying initialisation of nvm
    # https://gist.github.com/fl0w/07ce79bd44788f647deab307c94d6922
    # https://www.growingwiththeweb.com/2018/01/slow-nvm-init.html
    # http://broken-by.me/lazy-load-nvm/

    # Lazy-loading nvm + npm on node globals call
    load_nvm () {
        export NVM_DIR="$HOME/.nvm"
        # Activate nvm
        source "$NVM_DIR/nvm.sh"
    }

    # Add every binary that requires nvm, npm or node to run to an array of node globals
    NODE_GLOBALS=(`find $HOME/.nvm/versions/node -maxdepth 3 -type l -wholename '*/bin/*' | xargs -n1 basename | sort | uniq`)
    NODE_GLOBALS+=("node")
    NODE_GLOBALS+=("nvm")

    # Making node global trigger the lazy loading
    for cmd in "${NODE_GLOBALS[@]}"; do
        eval "${cmd}(){ unset -f ${NODE_GLOBALS}; load_nvm; ${cmd} \$@ }"
    done
fi



###
###  Miscellaneous
###

# -- Vim

export VIMCONFIG=$HOME/.config/nvim         # folder with configuration files for Neovim
export VIMDATA=$HOME/.local/share/nvim      # folder where Neovim stores data

# -- iTerm

# Enable iTerm integration only when running in iTerm
if [[ $TERM_PROGRAM == *"iTerm"* ]]; then
    [ -r ".iterm2" ] && [ -f ".iterm2" ]  &&  source ".iterm2"
fi

# -- Python

path+="$HOME/Library/Python/3.7/bin"

# -- Go

export GOPATH=$HOME/dev/go-workspace
path+="$GOPATH/bin"

# -- Homebrew

# disables statistics that brew collects
export HOMEBREW_NO_ANALYTICS=1

# -- Java

# Maven settings
export MAVEN_OPTS="-Xms512m -Xmx1024m"

# -- .NET Core

# Do not send any telemetry data to Microsoft
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# Set language of .NET Core commandline tool dotnet to English
export DOTNET_CLI_UI_LANGUAGE=en



###
### Path part 2
###

# path_helper (macOS Tool) build up the path of /etc/paths, paths.d
# and the current path environment variable.
# (see https://scriptingosx.com/2017/05/where-paths-come-from/)
eval $(/usr/libexec/path_helper -s)

# Remove duplicates (preserving prepended items)
# Source: http://unix.stackexchange.com/a/40755
PATH=`echo -n $PATH | awk -v RS=: '{ if (!arr[$0]++) {printf("%s%s",!ln++?"":":",$0)}}'`

export PATH



###
###  Custom extension
###

[ -r "$HOME/.custom.zsh" ] && [ -f "$HOME/.custom.zsh" ]  &&  source "$HOME/.custom.zsh"

# If .custom.zsh does not exist this config scrit would exit with a falsy error code.
# To avoid this, we return a truthy value.
true
