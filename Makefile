.PHONY: build run


build:
		docker build -t ${IMG_NAME} ./${IMG_NAME}/

run:
	        docker run --privileged --name ${CONTAINER_NAME} -d ${IMG_NAME}

