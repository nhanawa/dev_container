.PHONY: build run


build_base:
		docker build -t centos8_ssh ./centos8_ssh/

build_ansible:
		docker build -t ansible_dev ./ansible_dev/

run_base:
	        docker run --privileged --name ${CONTAINER_NAME} -d centos8_ssh
run_ansible:
	        cd ansible_dev
	        docker run -d ansible_dev
