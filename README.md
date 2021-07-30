# Dev Container
## Docker image information
### Contained Packages
- pyenv
- pipenv
- python 3.6.8
- ansible 2.10.3
- ansibl-lint 5.0.12
- yamllint 1.26.0
## How to build image
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
