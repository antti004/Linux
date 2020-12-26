alias docker-ip='docker inspect -f "{{.Name}} - {{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}" $(docker ps -aq)'
alias docker-ps='docker ps --format="table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"'
alias docker-ps-all='docker ps -a --format="table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Command}}\t{{.Status}}"'

alias docker-rm-img='docker rmi $(docker images -q)'
alias docker-rm-containers='docker rmi -f$(docker ps -a -q)'


alias log-cron='sudo grep --color -i cron /var/log/syslog' 

tmux-end='tmux kill-session'
