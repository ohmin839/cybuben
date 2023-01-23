FROM debian:bullseye-slim

RUN apt-get update && \
    apt-get install -qy man less curl build-essential

ARG USERNAME=user
ARG GROUPNAME=user
ARG UID=1001
ARG GID=1001
ARG HOME=/home/$USERNAME
RUN groupadd -g $GID $GROUPNAME && \
    useradd -m -s /bin/bash -u $UID -g $GID $USERNAME

# peg/leg
ARG PEGLEG_VERSION="0.1.18"
RUN curl -sf -R -O https://www.piumarta.com/software/peg/peg-${PEGLEG_VERSION}.tar.gz && \
    tar zxf peg-${PEGLEG_VERSION}.tar.gz && \
    cd peg-${PEGLEG_VERSION} && \
    make all test && \
    make install

WORKDIR /cybuben
USER $USERNAME
