.PHONY: build run

#
# Make commands for centos8_ssh
#
build_base:
	docker build -t centos8_ssh --network host --build-arg HTTP_PROXY=http://[240b:c0e0:101:5476:1c01:2::a]:3128 --build-arg HTTPS_PROXY=http://[240b:c0e0:101:5476:1c01:2::a]:3128 ./centos8_ssh/ --no-cache
run_base:
	        docker run --privileged --name centos8_ssh_${USR} -d centos8_ssh
exec_base:
		docker exec -it centos8_ssh_${USR} /bin/bash
rmi_base:
		docker rmi centos8_ssh
stop_base:
	        docker stop centos8_ssh_${USR}
rm_base:
	        docker rm centos8_ssh_${USR}
destroy_base:
	        docker stop centos8_ssh_${USR} ; docker rm centos8_ssh_${USR}


#
# Make commands for ansible_dev
#
build_ansible_dev:
	docker build -t ansible_dev --network host --build-arg HTTP_PROXY=http://[240b:c0e0:101:5476:1c01:2::a]:3128 --build-arg HTTPS_PROXY=http://[240b:c0e0:101:5476:1c01:2::a]:3128  ./ansible_dev/ --no-cache
rmi_ansible_dev:
		docker rmi ansible_dev
run_ansible_dev:
	        docker run -it --name dev_${USR} --cap-add=SYS_ADMIN -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v /root/workspace/wk_${USR}/:/root/workspace -d  ansible_dev
stop_ansible_dev:
		docker stop dev_${USR}
rm_ansible_dev:
		docker rm dev_${USR}
destroy_ansible_dev:
		docker stop dev_${USR} ; docker rm dev_${USR}

exec_ansible_dev: 
		docker exec -it dev_${USR} /bin/bash
#
# Run container with docker-compose
#
run_docker_compose:
		export USERNAME=`pwd | cut -d'/' -f4 | cut -d'_' -f2` ;  docker-compose up -d
setup_ssh:
		USERNAME=`pwd | cut -d'/' -f4 | cut -d'_' -f2` ; DOCKERID=`docker ps -a | grep $$USERNAME |cut -d' ' -f1`; IP=`docker exec -it  $$DOCKERID ip a | grep -A4 eth0 | grep inet | cut -d' ' -f6 | cut -d'/' -f1` ; echo $$IP $$USERNAME >> /etc/hosts
