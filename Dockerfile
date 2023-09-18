FROM ubuntu:latest

RUN apt update
RUN apt upgrade -y
RUN apt install -y wget sudo python3 pkg-config neovim

ARG USERNAME=develop
ARG GROUPNAME=wheel
ARG UID=1000
ARG GID=1000

RUN groupadd -g $GID $GROUPNAME && \
    useradd -m -s /bin/bash -u $UID -g $GID $USERNAME
RUN echo '%wheel ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
USER $USERNAME
ENV SKIP_VSCODE=1
ENV SKIP_UART=1

WORKDIR /home/$USERNAME
RUN wget https://raw.githubusercontent.com/raspberrypi/pico-setup/master/pico_setup.sh
RUN chmod +x pico_setup.sh
RUN ./pico_setup.sh
