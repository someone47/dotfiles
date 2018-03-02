
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


# --- Read environment variable from cache

DOTFILES_CACHE="$DOTFILES_DIR/.cache.sh"
[ -f "$DOTFILES_CACHE" ]  &&  source "$DOTFILES_CACHE"


# --- Source the dotfiles

for DOTFILE in "$DOTFILES_DIR"/system/.{function,function_*,path,env,alias,completion,prompt,nvm,jenv,iterm2,fasd,misc}; do
    #start_ms=$(ruby -e 'puts (Time.now.to_f * 1000).to_i')
    [ -r "$DOTFILE" ] && [ -f "$DOTFILE" ]  &&  source "$DOTFILE"
    #end_ms=$(ruby -e 'puts (Time.now.to_f * 1000).to_i')
    #elapsed_ms=$((end_ms - start_ms))
    #echo "$elapsed_ms ms $DOTFILE"
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
