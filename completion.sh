# only autocomplete directions with `cd`
complete -d cd

if [ -e /usr/local/bin/aws_completer ]; then
    complete -C '/usr/local/bin/aws_completer' aws
fi

source $DIR/vendor/git-completion.bash
source $DIR/vendor/npm-completion.bash

if [ -f '/usr/local/lib/google-cloud-sdk/completion.bash.inc' ]; then
    source '/usr/local/lib/google-cloud-sdk/completion.bash.inc';
fi
