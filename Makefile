PYTHON_VERSION=3.8.2
VIRTUALENV_NAME=simpleapi-env
DOCKERFILE_PATH?= ./provision/Dockerfile
CONTAINER_NAME?= simpleapi
IMAGE_NAME?= simpleapi-app
USERNAME?= node
DEFAULT_NODE_VOLUME?= nodemodules
PORT?= 5000

all: docker.build docker.start

init:
	./scripts/setup.sh $(PYTHON_VERSION) $(VIRTUALENV_NAME)

docker.shell:
	docker run --rm -it --name $(CONTAINER_NAME) -p $(PORT):$(PORT) \
	-v `pwd`:/usr/src -v $(CONTAINER_NAME)-$(DEFAULT_NODE_VOLUME):/usr/src/node_modules $(IMAGE_NAME) \
	/bin/sh

docker.build:
	docker build $(cache) -t $(IMAGE_NAME) --build-arg USER_ID=$(shell id -u) \
	--build-arg GROUP_ID=$(shell id -g) --build-arg USERNAME=$(USERNAME) \
	-f $(DOCKERFILE_PATH) .

	test -f yarn.lock || docker run --rm -it --name $(CONTAINER_NAME) -p $(PORT):$(PORT) \
		-v `pwd`:/usr/src -v $(CONTAINER_NAME)-$(DEFAULT_NODE_VOLUME):/usr/src/node_modules $(IMAGE_NAME) \
		yarn generate-lock-entry >> yarn.lock


docker.start:
	docker-compose up

docker.down:
	docker-compose down


yarn.add:

	docker run --rm -it --name $(CONTAINER_NAME) -p $(PORT):$(PORT) \
	-v `pwd`:/usr/src -v $(CONTAINER_NAME)-$(DEFAULT_NODE_VOLUME):/usr/src/node_modules $(IMAGE_NAME) \
	yarn add $(package)


apv.init:

	docker run --rm -it --name $(CONTAINER_NAME) -p $(PORT):$(PORT) \
	-v `pwd`:/usr/src -v $(CONTAINER_NAME)-$(DEFAULT_NODE_VOLUME):/usr/src/node_modules $(IMAGE_NAME) \
	yarn apv init 

apv.generatebadge:

	docker run --rm -it --name $(CONTAINER_NAME) -p $(PORT):$(PORT) \
	-v `pwd`:/usr/src -v $(CONTAINER_NAME)-$(DEFAULT_NODE_VOLUME):/usr/src/node_modules $(IMAGE_NAME) \
	yarn apv generate-badge version

apv.generatestatus:
	docker run --rm -it --name $(CONTAINER_NAME) -p $(PORT):$(PORT) \
	-v `pwd`:/usr/src -v $(CONTAINER_NAME)-$(DEFAULT_NODE_VOLUME):/usr/src/node_modules $(IMAGE_NAME) \
	yarn apv generate-badge status

apv.updateversion:
	docker run --rm -it --name $(CONTAINER_NAME) -p $(PORT):$(PORT) \
	-v `pwd`:/usr/src -v $(CONTAINER_NAME)-$(DEFAULT_NODE_VOLUME):/usr/src/node_modules $(IMAGE_NAME) \
	yarn apv update $(version)

apv.setstatus:
	docker run --rm -it --name $(CONTAINER_NAME) -p $(PORT):$(PORT) \
	-v `pwd`:/usr/src -v $(CONTAINER_NAME)-$(DEFAULT_NODE_VOLUME):/usr/src/node_modules $(IMAGE_NAME) \
	yarn apv set-status $(status)
