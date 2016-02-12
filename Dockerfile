FROM alpine:3.3
MAINTAINER Thibault Richard <thb@blurb.space>

ENV DOCKER_VERSION=1.10.1 \
    DOCKER_COMPOSE_VERSION=1.6.0 \
    DOCKER_MACHINE_VERSION=0.6.0

# Install Docker, Docker Compose and Docker Machine
RUN apk --update \
        add curl && \
        curl https://get.docker.com/builds/Linux/x86_64/docker-${DOCKER_VERSION} > /bin/docker && \
        chmod +x /bin/docker \
    && \
        apk add py-pip && \
        pip install docker-compose==${DOCKER_COMPOSE_VERSION} \
    && \
        curl -sL https://github.com/docker/machine/releases/download/v${DOCKER_MACHINE_VERSION}/docker-machine-Linux-x86_64 > /usr/local/bin/docker-machine && \
        chmod +x /usr/local/bin/docker-machine

