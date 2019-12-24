# .zshrc

#
#  Shell options
#

# Case Insensitive Globbing (expansion of wildcard characters,
# such as * and ? into full file paths and names)
setopt NO_CASE_GLOB

# Change directory by entering the path to a directory without the leading cd
setopt AUTO_CD

# Correction
# % Dekstop
# zsh: correct 'Dekstop' to 'Desktop' [nyae]?
# n: execute as typed
# y: accept and execute the suggested correction
# a: abort and do nothing
# e: return to the prompt to continue editing
unsetopt CORRECT


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


