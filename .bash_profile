### .bash_profile is loaded for logn shells
### .bashrc is loaded for non-login shells

export DOTNET_ROOT=~/.dotnet
export PATH=$PATH:$DOTNET_ROOT

# Reload bash
alias reload='source ~/.bashrc'

#### Docker aliases
alias dc-ip='docker inspect -f "{{.Name}} - {{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}" $(docker ps -aq)'
alias dc-ps='docker ps --format="table {{.Names}}\t{{.Status}}\t{{.Ports}}"'
alias dc-psall='docker ps -a --format="table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Command}}\t{{.Status}}"'

alias dc-rm-img='docker rmi $(docker images -q)'
alias dc-rm-containers='docker rmi -f$(docker ps -a -q)'
# Docker images size
alias dc-size="docker images --format 'table {{.Repository}}\t{{.Tag}}\t{{.ID}}\t{{.CreatedAt}}\t{{.Size}}'"


# LOG files aliases
alias log-cron='sudo grep --color -i cron /var/log/syslog' 
alias log-sys='tail -f /var/log/syslog'

alias tmux-end='tmux kill-session'

# Netstat
alias netstat-open='netstat -plnt'

# Common
alias ll='ls -l'
alias la='ls -la'
alias dir='exa -lTF'
alias ls-size='du -cksh * | sort -hr | head -n 15'


# GIT
alias git-reset="git fetch && git reset --hard @{u}"
alias git-log='git log -n -5 --oneline --date=short'

alias lc="ls --color=auto"

alias ip-addr="ip -br -4 -c addr list"

# Node-Red (might need to use sudo)
alias log-nodered="journalctl -f -u nodered -o cat"


# Networking
alias ssh-tunnels='ss -nltp4 | grep :20'

<<<<<<< HEAD:home/.bash_profile
echo "Bash profile v1.2"


if [ -f $HOME/.bashrc ]; then
        source $HOME/.bashrc
fi

=======
source ./.bashrc
>>>>>>> d851f99e75f58d5e0a4d6dc73f0083fbd984d1b3:.bash_profile
