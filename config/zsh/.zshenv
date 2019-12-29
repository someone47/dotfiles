# .zshenv

# Tell zsh where to search for configurations files
# The expression will eval to the containing directory of this script.
export ZDOTDIR="${${(%):-%x}:P:h}"
