# for things that don't work as aliases and scripts (i.e. need to run in the *current* shell)

function pbr(){
   cd ~/src/piggyback/$1
}

function _pbr(){
    local cur=${COMP_WORDS[COMP_CWORD]};
    COMPREPLY=( $(compgen -W "$(/bin/ls ~/src/piggyback/)" -- $cur));
}

complete -o nospace -F _pbr pbr

new-node() {
  if [[ -z $1 ]]; then
    echo "ERROR: Please provide a project name"
    return 1
  fi
  
  mkdir $1
  cd  $1
  npm init -f
  perl -pi -e '$_ .= qq(  "private": true,\n) if /"description":/' package.json
  npm install --save -E bluebird csv lodash yargs 
  npm install --save-dev @scoop/eslint-config-scoop eslint@3 eslint-plugin-dependencies@2
  echo -e 'node_modules/' > .gitignore
  echo -e '{\n    "extends": "@scoop/eslint-config-scoop"\n}' > .eslintrc.json
  git init
  git add .gitignore package.json .eslintrc.json
  git commit -m "scaffolded project"
}
