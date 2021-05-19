#Docker aliases
alias docker-ip='docker inspect -f "{{.Name}} - {{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}" $(docker ps -aq)'
alias docker-ps='docker ps --format="table {{.Names}}\t{{.Status}}\t{{.Ports}}"'
alias docker-ps-all='docker ps -a --format="table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Command}}\t{{.Status}}"'

alias docker-rm-img='docker rmi $(docker images -q)'
alias docker-rm-containers='docker rmi -f$(docker ps -a -q)'

# LOG files aliases
alias log-cron='sudo grep --color -i cron /var/log/syslog' 


alias tmux-end='tmux kill-session'

# Netstat
alias netstat-open='netstat -plnt'

# Common
alias ll='ls -l'
alias la='ls -la'

# GIT
alias git-reset="git fetch && git reset --hard @{u}"

alias lc="ls --color=auto"

alias ip-addr="ip -br -4 -c addr list"

# Node-Red (might need to use sudo)
alias node-red-log="journalctl -f -u nodered -o cat"

