# settings.zsh


###
###  System settings
###

# Pager
# https://stackoverflow.com/questions/48341920/git-branch-command-behaves-like-less/49862151#49862151
# https://stackoverflow.com/questions/48341920/git-branch-command-behaves-like-less/60498979#60498979
export LESS=-FRX

# Default text editor
export EDITOR="vim"

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

# Change directory by entering the path to a directory without 
# the leading cd
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
###  Completion
###

# Case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# Partial completion suggestions
# e.g. "cd /u/lo/b⇥" goes to "cd /usr/local/bin"
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix

# Enable the default zsh completions
autoload -Uz compinit && compinit -d "$HOME/.cache/zsh/zcompdump_${ZSH_VERSION}"

# Load bashcompinit for some old bash completions
autoload bashcompinit && bashcompinit



###
###  History configuration
###

# Where to save history to disk
HISTFILE=$HOME/.cache/zsh/history

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
