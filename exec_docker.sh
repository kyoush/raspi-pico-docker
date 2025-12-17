#!/bin/sh

sdk_name="raspi-pico-sdk"

docker ps -a | grep $sdk_name | awk '{print $1}' | xargs --no-run-if-empty docker rm

docker build ./ -t $sdk_name

docker run --rm \
    -v /home/$USER:/home/$USER:rw \
    -w /home/$USER \
    -u $(id -u $USER):$(id -g $USER) \
    -it $sdk_name
