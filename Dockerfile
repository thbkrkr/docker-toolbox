FROM alpine:3.7
MAINTAINER Thibault Richard <thb@blurb.space>

ENV DOCKER_VERSION=17.11.0-ce \
    DOCKER_COMPOSE_VERSION=1.18.0 \
    DOCKER_MACHINE_VERSION=0.13.0

# Install Docker, Docker Compose and Docker Machine
RUN apk add --no-cache curl && \
        curl -sL https://download.docker.com/linux/static/edge/x86_64/docker-${DOCKER_VERSION}.tgz | tar zx && \
        mv /docker/* /bin/ && chmod +x /bin/docker* \
    && \
        apk add --no-cache py2-pip && \
        pip install --upgrade pip && \
        pip install docker-compose==${DOCKER_COMPOSE_VERSION} \
    && \
        curl -sL https://github.com/docker/machine/releases/download/v${DOCKER_MACHINE_VERSION}/docker-machine-Linux-x86_64 > /usr/local/bin/docker-machine && \
        chmod +x /usr/local/bin/docker-machine

