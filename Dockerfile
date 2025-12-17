FROM ubuntu:latest

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
    build-essential cmake sudo git curl wget python3 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ARG USERNAME=developer
RUN useradd -m -s /bin/bash "$USERNAME" && \
    printf "%s ALL=(ALL) NOPASSWD:ALL\n" "$USERNAME" > /etc/sudoers.d/"$USERNAME" && \
    chmod 0440 /etc/sudoers.d/"$USERNAME"

ENV SKIP_VSCODE=1
ENV SKIP_UART=1

WORKDIR /home/$USERNAME
RUN curl -L -O https://raw.githubusercontent.com/raspberrypi/pico-setup/master/pico_setup.sh
RUN chmod +x pico_setup.sh
RUN ./pico_setup.sh

RUN chown -R $USERNAME:$USERNAME /home/$USERNAME
USER $USERNAME
