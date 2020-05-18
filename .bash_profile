# cd
alias ..='cd ..'
alias ...='cd ../..'

# open
alias o='open .'

# list
alias l='ls -lLahp'

# editors
alias c='code .'

# browser
alias b='open -a "Google Chrome"'

# clipboard
alias copy='pbcopy'
alias paste='pbpaste'

# change bash profile
alias chbp='code ~/dev/dotfiles/.bash_profile'

# eslint
alias lint='eslint --ignore-path .gitignore .'

# ssh into school server
alias s='ssh pcoursey@lovecraft.cs.nmt.edu'

# delete a remote branch
alias drbranch='git push origin --delete'

# alias homebrew python
alias python='python3'

# git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias go='git checkout'
alias gp='git pull'
alias gu='git push'
alias gb='git branch'
alias gm='git merge'
alias gl='git log'
alias gr='git pull --rebase'
alias gd='git branch -d'
alias grs='git remote set-url origin'

#
# Functions
#

# Make a folder and navigate to it
md() {
  mkdir -p -- "$1"
  cd -P -- "$1"
}

# Go to a <repo> in ~/dev
dev() {
  cd "$HOME/dev/$1"
}

# Go to a <repo> in ~/fork
fork() {
  cd "$HOME/fork/$1"
}

# Upload a file to 0x0.st
0x0() {
  curl -F "file=@$1" https://0x0.st
}

# Add a blank tile to the dock
tile() {
  defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'
  killall Dock
}

# Convert .png to .icns
ptoi() {
  sips -s format icns $1 --out $1.icns
}

mknext() {
  yarn init -y
  yarn add next@latest react@latest react-dom@latest
  mkdir pages
  touch pages/index.js
  echo "import React from 'react';
const Index = () => (
  <div>
    <h1>Hello!</h1>
  </div>
);
export default Index;" >> pages/index.js
  yarn next
}

mkstatic() {
  name=${PWD##*/}
  touch index.html
  touch style.css
  touch main.js
  touch now.json
  echo "{
    \"version\": 2,
    \"name\": \"$name\",
    \"alias\": \"$name.now.sh\"
  }" >> now.json
  echo "<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title></title>
    <!-- Stylesheets -->
    <link rel="stylesheet" href="./style.css">
  </head>
  <body>
  <!-- Scripts -->
  <script type="text/javascript" src="./main.js"></script>
  </body>
</html>" >> index.html
  echo "* {
  box-sizing: border-box
}
html,
body {
  padding: 0;
  margin: 0;
}
body {
  min-height: 100vh;
}" >> style.css
}

# Print the terminal colors
colors() {
  T='Xi'
  echo -e "\n               40m    41m    42m    43m\
      44m    45m    46m    47m";
  for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' \
           '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' \
           '  36m' '1;36m' '  37m' '1;37m';
  do FG=${FGs// /}
  echo -en " $FGs \033[$FG  $T  "
  for BG in 40m 41m 42m 43m 44m 45m 46m 47m;
    do echo -en "$EINS \033[$FG\033[$BG  $T  \033[0m";
  done
  echo;
  done
  echo
}

