FROM ubuntu:18.04 AS builder

ENV DOCKER_VERSION=20.10.8 \
COMPOSE_VERSION=1.29.2 \
AWSCLI_VERSION=2.2.28

WORKDIR /build

RUN apt-get update \
    && apt-get install -y curl zip \
    && curl --silent https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz -o docker.tgz \
    && tar xzf docker.tgz \
    && curl --silent https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose \
    && curl --silent https://awscli.amazonaws.com/awscli-exe-linux-x86_64-${AWSCLI_VERSION}.zip -o awscliv2.zip \
    && unzip awscliv2.zip

FROM ubuntu:18.04

COPY --from=builder /build/docker/docker /usr/local/bin
COPY --from=builder /usr/local/bin/docker-compose /usr/local/bin
COPY --from=builder /build/aws /build/aws

RUN ./build/aws/install \
    && rm -rf /var/lib/apt/lists/* /build

CMD ["docker", "version"]