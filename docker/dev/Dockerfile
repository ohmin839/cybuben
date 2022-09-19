
FROM ubuntu:focal

RUN yes | unminimize && \
    apt-get update && \
    apt-get install -qy man less curl build-essential

ARG USERNAME=user
ARG GROUPNAME=user
ARG UID=1000
ARG GID=1000
ARG HOME=/home/$USERNAME
RUN groupadd -g $GID $GROUPNAME && \
    useradd -m -s /bin/bash -u $UID -g $GID $USERNAME

WORKDIR /cybuben
# peg v0.1.18
RUN curl -sf -R -O https://www.piumarta.com/software/peg/peg-0.1.18.tar.gz && \
    tar zxf peg-0.1.18.tar.gz && \
    cd peg-0.1.18 && \
    make all test && \
    make install

USER $USERNAME
