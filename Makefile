.PHONY: build run


#
# Setup docker-compose directory
#

setup_directory:
		USERNAME=`pwd | sed 's/.*wk_\([^/]*\).*/\1/'` &&\
		git checkout -B $$USERNAME &&\
		cp -rf ansible_dev  centos8_ssh  docker-compose.yml  Makefile share ../

clean_directory:
		rm -rf ansible_dev  centos8_ssh  docker-compose.yml  Makefile share

#
# Make commands for centos8_ssh
#
build_base:
	docker build -t centos8_ssh --network host --build-arg HTTP_PROXY=http://[240b:c0e0:101:5476:1c01:2::a]:3128 --build-arg HTTPS_PROXY=http://[240b:c0e0:101:5476:1c01:2::a]:3128 ./centos8_ssh/
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
	docker build -t ansible_dev --network host --build-arg HTTP_PROXY=http://[240b:c0e0:101:5476:1c01:2::a]:3128 --build-arg HTTPS_PROXY=http://[240b:c0e0:101:5476:1c01:2::a]:3128  ./ansible_dev/
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
		$(eval NAME_THISDIR := $(shell pwd | xargs dirname | xargs basename ))
		if !(expr "$(NAME_THISDIR)" : '^wk_' > /dev/null) ; then \
			echo 'Please make sure that you are in the right directory (wk_<username>).'; \
			exit 1; \
		else \
			USERNAME=`pwd | sed 's/.*wk_\([^/]*\).*/\1/'` docker-compose up -d; \
		fi
setup_ssh:
		USERNAME=`pwd | sed 's/.*wk_\([^/]*\).*/\1/'` &&\
		IP=`docker-compose exec ansible_dev ip a | grep -A4 eth0 | grep inet | cut -d' ' -f6 | cut -d'/' -f1  | tr '\n' ' '` &&\
		sed -ie "/$$USERNAME$$/d" /etc/hosts &&\
		echo $$IP $$USERNAME >> /etc/hosts

#
# Prerequisites
#
create_network:
	docker network create --ipv6  --driver=bridge  --subnet=fd5a:ceb9:ed8d:1::/64 network_1.2  -o com.docker.network.bridge.name="network_1.2" -o com.docker.network.bridge.enable_ip_masquerade="true"


