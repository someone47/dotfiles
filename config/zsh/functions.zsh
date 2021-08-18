# functions.zsh

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
    man -t "$1" | open -f -a /System/Applications/Preview.app/
}

# git-deep-fetch - Fetch all remote branches
function git-deep-fetch() {
    # Loop for all remote branches,
    # create one with the same name locally,
    # track it to the remote
    for branch in $(git branch --all | grep '^\s*remotes' | egrep --invert-match '(:?HEAD|master)$')
    do
        git branch --track "${branch##*/}" "$branch"
    done

    # fetch/pull all of them
    git fetch --all --tags
    git pull --all
}
