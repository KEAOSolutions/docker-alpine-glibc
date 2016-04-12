CURRENT_DIRECTORY := $(shell pwd)
include environment

build:
	sed -i.bak 's|^FROM.*|FROM $(DOCKER_GOSU)|' Dockerfile && \
	docker build --build-arg  ALLOW_UNTRUSTED=$(ALLOW_UNTRUSTED)  -t $(DOCKER_USER)/glibc --rm=true . && \
	mv Dockerfile.bak Dockerfile

run:
	docker run -it --entrypoint=sh $(DOCKER_USER)/glibc

