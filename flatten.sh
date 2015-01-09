#!/bin/bash

docker save siddontang/mysql | docker-squash -verbose -from root -t siddontang/mysql | docker load
docker images --no-trunc | grep none | awk '{print $3}' | xargs docker rmi
