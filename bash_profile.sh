export CLICOLOR=1
DIR=$(dirname $BASH_SOURCE)

source $DIR/bash_prompt.sh
source $DIR/aliases.sh
source $DIR/completion.sh
source $DIR/path.sh

if [ -e $DIR/private.sh ]; then
    source $DIR/private.sh
fi
