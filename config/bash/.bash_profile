
# .bash_profile


# --- Interactivity check

# If not running interactively, don't do anything
[ -z "$PS1" ] && return


# --- Resolve DOTFILES_DIR


# ~/.dotfiles/config/bash
BASH_CONFIG_DIR="$(dirname "$(readlink "$BASH_SOURCE")")"

# ~/.dotfiles
export DOTFILES_DIR=$(dirname "$(dirname "$BASH_CONFIG_DIR")")

if [ ! -d "$DOTFILES_DIR" ] ; then
    echo "Expect .dotfiles to be here: " $DOTFILES_DIR
    echo "Unable to find dotfiles, exiting."
    return
fi


# --- Make utilities available

PATH="$DOTFILES_DIR/bin:$PATH"


# --- Read environment variable from cache

DOTFILES_CACHE="$DOTFILES_DIR/.cache.sh"
[ -f "$DOTFILES_CACHE" ]  &&  source "$DOTFILES_CACHE"


# --- Source the dotfiles

# bash prompt is suboptimal: error hint even when eror code is 0
for DOTFILE in "$BASH_CONFIG_DIR"/.{function,function_*,path,env,alias,completion,prompt,nvm,jenv,kubernetes,fasd,misc,iterm2}; do
    #start_ms=$(ruby -e 'puts (Time.now.to_f * 1000).to_i')
    [ -r "$DOTFILE" ] && [ -f "$DOTFILE" ]  &&  source "$DOTFILE"
    #end_ms=$(ruby -e 'puts (Time.now.to_f * 1000).to_i')
    #elapsed_ms=$((end_ms - start_ms))
    #echo "$elapsed_ms ms $DOTFILE"
done

if is-macos; then
    for DOTFILE in "$BASH_CONFIG_DIR"/.{env,alias,function}.macos; do
        [ -r "$DOTFILE" ] && [ -f "$DOTFILE" ]  &&  source "$DOTFILE"
    done
fi
unset DOTFILE;


# --- Execute custom commands

[ -r "$HOME/.custom.bash" ] && [ -f "$HOME/.custom.bash" ]  &&  source "$HOME/.custom.bash"


# --- Final path cleanup

# path_helper (macOS Tool) build up the path of /etc/paths, paths.d
# and the current path environment variable.
# (see https://scriptingosx.com/2017/05/where-paths-come-from/)
eval $(/usr/libexec/path_helper -s)

# Remove duplicates (preserving prepended items)
# Source: http://unix.stackexchange.com/a/40755
export PATH=`echo -n $PATH | awk -v RS=: '{ if (!arr[$0]++) {printf("%s%s",!ln++?"":":",$0)}}'`
