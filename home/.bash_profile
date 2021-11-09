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
alias git-push='git add . && git commit -a -m "Fast update" && git push'

alias lc="ls --color=auto"

alias ip-addr="ip -br -4 -c addr list"

# Node-Red (might need to use sudo)
alias log-nodered="journalctl -f -u nodered -o cat"


# Networking
alias ssh-tunnels='ss -nltp4 | grep :20'

