#!/bin/sh

docker ps -a | grep raspi-pico-sdk | awk '{print $1}' | xargs --no-run-if-empty docker rm

docker build ./ -t raspi-pico-sdk

docker run --rm \
    -v /home/kyoshi/workspace:/home/develop/workspace \
    -w /home/develop \
    -u $(id -u $USER):$(id -g $USER) \
    -it raspi-pico-sdk