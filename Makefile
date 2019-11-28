all: image

.PHONY: image push

image:  ## Build the images
    docker build --build-arg CUDA_VERSION=9.2 -t eliiza/nvidia-device-plugin:430.14-cuda9.2 -f image/Dockerfile image/
    docker build --build-arg CUDA_VERSION=10.0 -t eliiza/nvidia-device-plugin:430.14-cuda10.0 -f image/Dockerfile image/

push:   ## Push the images
    docker push qntfy/nvidia-device-plugin:430.14-cuda9.2
    docker push qntfy/nvidia-device-plugin:430.14-cuda10.0
