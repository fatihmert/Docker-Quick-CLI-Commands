# Docker Quick CLI Commands

Docker CLI commands very long for me. However bash scripting with `alias` thats very shorting these commands.

**I'm using mostly these commands. If I forgot most commands in the my defined commands, please open issue or request pull**

**_Let's make it easier for our colleagues together by keeping this repo up-to-date._**

> These commands run for Mac and Linux operating system, if you want use for Windows you can use on git bash.
> 
> _I am going to writing PowerShell for Windows user_


## Install

Current user,

```
cat aliases.sh >> /home/${USER}/.bashrc
source /home/${USER}/.bashrc
```

For root,

```
sudo -s
cat aliases.sh >> /etc/bash.bashrc
source /etc/bash.bashrc
```

If you're using Windows, bashrc path is `/etc/bash.bashrc`. Follow then commands for the Git Bash;

```
cat aliases.sh >> /etc/bash.bashrc
source /etc/bash.bashrc
```

## Commands

|  Basics ||
|---|---|
|  **Commands** |  **Coressponding to** |
| d.rm | docker rm -f |
| d.rmi | docker rmi |
| d.vols |  docker volume ls  |
| d.psa | docker ps --format "table {{.Status}}\t{{.ID}}\t{{.Names}}\t{{.Image}}" |
| d.exec | docker exec -it |
| dc.up | docker compose up |
| dc.upd | docker compose up -d |
| dc.upb | docker compose up --build |
| dc.s | docker compose stop |
| dc.d | docker compose down |
| dc.r | docker compose restart |


Basic commands have been if has args, it is.

### Functions

#### Exec bash/sh

```
d.bash <ID>
d.sh <ID>
```
You can use with `d.id`. 

Example;

```
d.bash ${d.id go_api}
d.sh ${d.id go_api}
```

#### Find Container ID

It can be returning containr id from searching `container_name` or `container service name` from `d.psa` with `grep` and `awk` pipe.

```
d.id <SEARCH_TERM>
```

#### Killing

```
d.kill all
d.kill <ID>
```

#### For Service

##### NGINX

**d.nginx** function firs parameter follow than values;

 * restart
 * reload
 * stop
 * start

```
d.nginx [restart|reload|stop|start] <ID>
d.nginx reload 1c4a
```


## TODO

 - [ ] Mostly using service commands
 - [ ] Swarm commands
 - [ ] Kubernates commands
 - [ ] **fill here..**
