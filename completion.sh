# only autocomplete directions with `cd`
complete -d cd

if [ -e /usr/local/bin/aws_completer ]; then
    complete -C '/usr/local/bin/aws_completer' aws
fi

source $DIR/vendor/git-completion.bash
source $DIR/vendor/npm-completion.bash
