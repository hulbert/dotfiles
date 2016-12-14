
# directory navigation
alias '..'='cd ../'
alias '...'='cd ../../'

# use gnu ls from brew coreutils; see scripts/macos.sh
alias ls='gls --color=auto --group-directories-first -lAp'

# typo correction
alias 'mate.'='mate .'

# jump to docs
alias joi='open https://github.com/hapijs/joi/blob/master/API.md'
alias hapi='open http://hapijs.com/api'
alias labc='open https://github.com/hapijs/code/blob/master/API.md'
alias lab='open https://github.com/hapijs/lab/blob/master/README.md'

# better built-ins
alias guid='uuidgen | tr "[:upper:]" "[:lower:]"'

# git related
alias brs='git brs | tail'
alias gg='git difftool'
alias ggg='git difftool HEAD'

# Switch directories
pbr() {
  if [[ -z $1 ]]; then
    cd ~/src/piggyback && ls
    return
  fi
  
  cd ~/src/piggyback/$1
}
