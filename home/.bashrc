#export PROMPT_COMMAND=’RETRN_VAL=$?; if [ -f /tmp/lastoutput.tmp ]; then LAST_OUTPUT=$(cat /tmp/lastoutput.tmp); rm /tmp/lastoutput.tmp; fi; logger -S 10000 -p local6.debug “{\"user\": \"$(whoami)\", \"path\": \"$(pwd)\", \"pid\": \"$$\", \"b64_command\": \"$(history 1 | sed “s/^[ ]*[0–9]\+[ ]*//" | base64 -w0 )\", \"status\": \"$RETRN_VAL\", \"b64_output\": \"$LAST_OUTPUT\"}"; unset LAST_OUTPUT;

## History
#Ignore duplicate commands in history
HISTCONTROL=ignoredups
HISTSIZE=2000
HISTFILESIZE=2000
shopt -s histappend


## Colors
BLK='\[\033[01;30m\]'   # Black
RED='\[\033[01;31m\]'   # Red
GRN='\[\033[01;32m\]'   # Green
YLW='\[\033[01;33m\]'   # Yellow
BLU='\[\033[01;34m\]'   # Blue
PUR='\[\033[01;35m\]'   # Purple
CYN='\[\033[01;36m\]'   # Cyan
WHT='\[\033[01;37m\]'   # White
CLR='\[\033[00m\]'      # Reset



## Aliases
# Move to the parent folder.
alias ..='cd ..;pwd'
# Move up two parent folders.
alias ...='cd ../..;pwd'
# Move up three parent folders.
alias ....='cd ../../..;pwd'



### Functions

## Git
function git-push(){
  git add .
  echo "Added files"
  git commit -a -m "$1" && 
  echo "Commited '$1'"
  git push
}

function find_largest_files() {
    du -h -x -s -- * | sort -r -h | head -20;
}

echo "BashRC loaded"
