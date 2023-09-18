FROM ubuntu:latest

RUN apt update
RUN apt upgrade -y
RUN apt install -y wget

WORKDIR /root
RUN wget https://raw.githubusercontent.com/raspberrypi/pico-setup/master/pico_setup.sh
RUN chmod +x pico_setup.sh
RUN ./pico_setup.sh
