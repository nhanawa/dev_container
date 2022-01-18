# Dev Container
## Docker image information
### Contained Packages
- pyenv
- pipenv
- python 3.6.8
- ansible 2.10.3
- ansibl-lint 5.0.12
- yamllint 1.26.0

## Usage : 
### Clone This repository
```
$ git clone http://gitlab-docker-reg.local:8080/cloud/automation/dev_container.git wk_<your name>
```

### Check docker image exists
Please check if following image exists.
Current latest image tag is v1.0.4.
If there is no image found, please refer "How to build image".
```
$ docker images
REPOSITORY                                                           TAG       IMAGE ID       CREATED        SIZE
gitlab-docker-reg.local/cloud/automation/dev_container/ansible_dev   1.0.4     40da907cb8b7   2 months ago   2.41GB
..(snip)..
```

### Check network exists
Please check if network is created with name "network_1.2"
```
$ docker network ls
NETWORK ID     NAME          DRIVER    SCOPE
..(snip)..
b7807876c28f   network_1.2   bridge    local
..(snip)..
```

### Run dev_container
```
$ cd wk_<your name>
$ make run_docker_compose
```

### Set up ssh to /etc/hosts and access container.
```
$ make setup_ssh
$ ssh <your name>
```


### Optional: If you want to stop dev_container
```
$ cd wk_<your name>
$ docker-compose down
```


### Optional: when you want to 



## Maintenance Procedure : How to build image
### centos8 ssh image(Mandatory)
```
$ make build_base
```
### ansible dev image(Mandatory)
```
$ make build_ansible_dev
```
## How to remove images
### remove centos8 ssh image(Optional)
```
make rmi_base
```
### remove centos8 ssh image(Optional)
```
make rmi_ansible_dev
```

## How to run container
### run centos8 ssh container(Optional)
```
$ make run_base USR=<your user name>
```

### run python3.6.8 & ansible2.10.3 container(Mandatory)
```
$ make run_ansible_dev USR=<your user name>
```

## How to attach container
### attach centos8 ssh image(Optional)
```
make exec_base USR=<your user name>
```

### attach centos8 ssh image(Optional)
```
make exec_ansible_dev USR=<your user name>
```

## How to stop / remove / destroy container
### stop / remove / destroy centos8 ssh image(Optional)
```
make stop_base USR=<your user name>
make rm_base USR=<your user name>
make destroy_base USR=<your user name>
```

## How to stop / remove / destroy container
### stop / remove / destroy centos8 ssh image(Optional)
```
make stop_ansible_dev USR=<your user name>
make rm_ansible_dev USR=<your user name>
make destroy_ansible_dev USR=<your user name>
```
