# Makefile for only building Docker images

pre-req:
	if [ -z "$$IMG_VERSION" ]; then \
		echo "Enter image version:"; \
		read IMG_VERSION; \
	fi; \
	echo "export IMG_VERSION=$$IMG_VERSION" > /tmp/IMG_VERSION;

docker-login:
	echo "$$DOCKER_PASSWORD" | docker login -u krrc --password-stdin 

build-all: build-webapp build-backend

build-webapp: pre-req docker-login
	. /tmp/IMG_VERSION && cd web-app && docker build --build-arg PIWIGO_VERSION=$${PIWIGO_VERSION} --tag piwigo-webapp:$${IMG_VERSION} . && \
	docker tag piwigo-webapp:$${IMG_VERSION} krrc/piwigo-webapp:$${IMG_VERSION} && \
	docker push krrc/piwigo-webapp:$${IMG_VERSION}

build-backend: pre-req docker-login
	. /tmp/IMG_VERSION && cd back-end && docker build --tag piwigo-backend:$${IMG_VERSION} . && \
	docker tag piwigo-backend:$${IMG_VERSION} krrc/piwigo-backend:$${IMG_VERSION} && \
	docker push krrc/piwigo-backend:$${IMG_VERSION}

clean: clean-webapp clean-backend

clean-webapp: pre-req
	. /tmp/IMG_VERSION && docker rmi piwigo-webapp:$${IMG_VERSION}

clean-backend: pre-req
	. /tmp/IMG_VERSION && docker rmi piwigo-backend:$${IMG_VERSION}