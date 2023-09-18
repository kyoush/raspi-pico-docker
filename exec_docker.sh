#!/bin/sh

docker build ./ -t raspi-pico-sdk

docker run \
    -v /home/kyoshi/workspace:/root/workspace \
    -w /root \
    -it raspi-pico-sdk