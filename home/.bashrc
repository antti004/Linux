#export PROMPT_COMMAND=’RETRN_VAL=$?; if [ -f /tmp/lastoutput.tmp ]; then LAST_OUTPUT=$(cat /tmp/lastoutput.tmp); rm /tmp/lastoutput.tmp; fi; logger -S 10000 -p local6.debug “{\"user\": \"$(whoami)\", \"path\": \"$(pwd)\", \"pid\": \"$$\", \"b64_command\": \"$(history 1 | sed “s/^[ ]*[0–9]\+[ ]*//" | base64 -w0 )\", \"status\": \"$RETRN_VAL\", \"b64_output\": \"$LAST_OUTPUT\"}"; unset LAST_OUTPUT;

### Functions

## Git
function git-push(){
  git add . &&
  git commit -a -m "$(1)" && 
  git push
}
