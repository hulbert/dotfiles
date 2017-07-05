DIR=$(dirname $BASH_SOURCE)

# set up NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# add our dotfiles bin to path
DOTFILES_BIN="$DIR/bin"
export PATH="$DOTFILES_BIN:$PATH"

# add Postgres.app so we can use psql
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

if [ -e "$HOME/Library/Python/2.7/bin" ]; then
    export PATH="$PATH:$HOME/Library/Python/2.7/bin"
fi

if [ -e "$HOME/go/bin" ]; then
    export PATH="$PATH:$HOME/go/bin"
fi
