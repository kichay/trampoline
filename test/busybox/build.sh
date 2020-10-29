#!/bin/sh

TAG=busybox-static

docker build -t $TAG .
CONTAINER=$(docker create $TAG)
docker cp $CONTAINER:/busybox .
docker rm -f $CONTAINER
docker rmi -f $TAG
