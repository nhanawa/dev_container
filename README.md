# Dev Container
## Docker image information
###Contained Packages
- pyenv
- pipenv
- python 3.6.8
- ansible 2.10.3
- ansibl-lint 5.0.12
- yamllint 1.26.0
## How to build image
### centos8 ssh image
```
$ make build_base
```
### ansible dev image
```
$ make build_ansible
```

## How to run container
### run centos8 ssh container
```
$ make run_base
```

### run ansible8 container
```
$ make run_ansible
```
