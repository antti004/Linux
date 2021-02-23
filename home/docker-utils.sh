#!/bin/bash
export DOCKER_REPO_PREFIX=anttia


# helpers

dc_test(){
	local green=$(tput setaf 2)
	local yellow=$(tput setaf 3)
	local red=$(tput setaf 1)
  	local reset=$(tput sgr0)
 	echo -e "${green}$@${reset}"
}

demo_ask(){
  local msg=${1}
  local waitingforanswer=true
  while ${waitingforanswer}; do
      read -p "${msg} (hit 'y/Y' to continue, 'n/N' to cancel) " -n 1 ynanswer
      case ${ynanswer} in
	     [Yy] ) waitingforanswer=false; break;;
    	 [Nn] ) echo ""; cmn_die "Operation cancelled as requested!";;
     	  *    ) echo ""; echo "Please answer either yes (y/Y) or no (n/N).";;
		 esac
  done
  echo ""
}


alias docker-prune="docker system prune --all"
alias docker-ps="docker ps --format '{{ .ID }}\t{{.Names}}\t{{ .Ports }}'"
dc-rm-all-img(){
  docker rmi $(docker images -q)
}

dc-rm-all-containers(){
  docker rmi -f$(docker ps -a -q)
}


docker-restart()
{
	sudo systemctl restart docker
}

#
#  Docker containers
#

docker-ubuntu()
{
	docker run -t -i ubuntu /bin/bash
}




docker-cleanup(){ 
 	docker rm -v $(docker ps --filter status=exited -q 2>/dev/null) 2>/dev/null 
 	docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null 
}



dc_del_topped(){
	local name=$1
	local state=$(docker inspect --format "{{.State.Running}}" $name 2>/dev/null)

	if [[ "$state" == "false" ]]; then
		docker rm $name
	fi
}



function docker-names {
  for ID in `docker ps | awk '{print $1}' | grep -v 'CONTAINER'`
  do
      docker inspect $ID | grep Name | head -1 | awk '{print $2}' | sed 's/,//g' | sed 's%/%%g' | sed 's/"//g'
  done
}

function docker-ip {
    echo "IP addresses of all named running containers"

  for DOC in `dnames-fn`
  do
    IP=`docker inspect $DOC | grep -m3 IPAddress | cut -d '"' -f 4 | tr -d "\n"`
    OUT+=$DOC'\t'$IP'\n'
  done
  echo $OUT|column -t
}
