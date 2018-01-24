

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


# --- Source the dotfiles

for DOTFILE in "$DOTFILES_DIR"/system/.{function,function_*,path,env,alias,completion,grep,prompt,nvm,rvm,custom}; do
    [ -r "$DOTFILE" ] && [ -f "$DOTFILE" ]  &&  source "$DOTFILE"
done
unset DOTFILE;


# --- Export environment variables

export DOTFILES_DIR
