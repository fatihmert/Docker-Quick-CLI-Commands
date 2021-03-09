# Author:   Fatih Mert Doğancan
# Github:   github@fatihmert
# WWW:      https://fatihmert.dev
# Repo:     https://github.com/fatihmert/Docker-Quick-CLI-Commands

## Basics
alias d.rm='docker rm -f'
alias d.rmi='docker rmi'

## Lists
alias d.vols='docker volume ls'
alias d.logs='docker logs'
alias d.psa='docker ps --format "table {{.Status}}\t{{.ID}}\t{{.Names}}\t{{.Image}}"'


## Execution
alias d.exec='docker exec -it'

d.bash(){
    d.exec $1 /bin/bash
}

d.sh(){
    # d.sh $(d.id go_api)
    d.exec $1 /bin/sh
}

## Compose
alias dc.up='docker-compose up'
alias dc.upd='docker-compose up -d'
alias dc.upb='docker-compose up --build'
alias dc.s='docker-compose stop'


## Others
d.kill(){
    if [ "$1" = "all" ]; then
        docker container kill $(docker ps -q)
    else
        docker container kill $1
    fi
}

# Find containerId from container image/name
# Ex: d.id go_api
d.id(){
    docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Image}}" | grep $1 | awk '{print $1;}'
}


## Miscellaneous

# d.nginx [restart|reload|stop|start] <id>
d.nginx(){
    if [ "$1" = "restart" ]; then
        d.exec $2 nginx -s restart
    elif [ "$1" = "reload" ]; then
        d.exec $2 nginx -s reload
    elif [ "$1" = "start" ]; then
        d.exec $2 nginx -s start
    elif [ "$1" = "stop" ]; then
        d.exec $2 nginx -s stop
    else
        echo "[UNKOWN] >$1 not found. Allow NGINX commands; restart, reload, start, stop"
    fi
}
