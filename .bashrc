#export PROMPT_COMMAND=’RETRN_VAL=$?; if [ -f /tmp/lastoutput.tmp ]; then LAST_OUTPUT=$(cat /tmp/lastoutput.tmp); rm /tmp/lastoutput.tmp; fi; logger -S 10000 -p local6.debug “{\"user\": \"$(whoami)\", \"path\": \"$(pwd)\", \"pid\": \"$$\", \"b64_command\": \"$(history 1 | sed “s/^[ ]*[0–9]\+[ ]*//" | base64 -w0 )\", \"status\": \"$RETRN_VAL\", \"b64_output\": \"$LAST_OUTPUT\"}"; unset LAST_OUTPUT;

## History
#Ignore duplicate commands in history
HISTCONTROL=ignoredups
HISTSIZE=2000
HISTFILESIZE=2000
shopt -s histappend


## Colors
blk='\[\033[01;30m\]'   # Black
red='\[\033[01;31m\]'   # Red
grn='\[\033[01;32m\]'   # Green
ylw='\[\033[01;33m\]'   # Yellow
blu='\[\033[01;34m\]'   # Blue
pur='\[\033[01;35m\]'   # Purple
cyn='\[\033[01;36m\]'   # Cyan
wht='\[\033[01;37m\]'   # White
clr='\[\033[00m\]'      # Reset



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
  git commit -a -m "$1" && 
  git push
}

function big-files() {
    du -h -x -s -- * | sort -r -h | head -20;
}

function git_branch() {
    if [ -d .git ] ; then
        printf "%s" "($(git branch 2> /dev/null | awk '/\*/{print $2}'))";
    fi
}
function prompt_1(){
    PS1='${debian_chroot:+($debian_chroot)}'${blu}'$(git_branch)'${pur}' \W'${grn}' \$ '${clr}
}

prompt_1

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
