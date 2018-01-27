
# .bash_profile

# --- Interactivity check

# If not running interactively, don't do anything
[ -z "$PS1" ] && return


# --- Resolve DOTFILES_DIR

DOTFILES_DIR=$(dirname "$(dirname "$(readlink "$BASH_SOURCE")")")

if [ ! -d "$DOTFILES_DIR" ] ; then
    echo "Expect .dotfiles to be here: " $DOTFILES_DIR
    echo "Unable to find dotfiles, exiting."
    return
fi


# --- Make utilities available

PATH="$DOTFILES_DIR/bin:$PATH"


# --- Source the dotfiles

for DOTFILE in "$DOTFILES_DIR"/system/.{function,function_*,path,env,alias,completion,grep,prompt,nvm,jenv,iterm2}; do
    [ -r "$DOTFILE" ] && [ -f "$DOTFILE" ]  &&  source "$DOTFILE"
done

if is-macos; then
    for DOTFILE in "$DOTFILES_DIR"/system/.{env,alias,function}.macos; do
        [ -r "$DOTFILE" ] && [ -f "$DOTFILE" ]  &&  source "$DOTFILE"
    done
fi
unset DOTFILE;

[ -r "$HOME/.custom" ] && [ -f "$HOME/.custom" ]  &&  source "$HOME/.custom"


# --- Export environment variables

export DOTFILES_DIR
