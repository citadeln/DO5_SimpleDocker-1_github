#!/bin/bash

CONTAINER=$(sudo docker ps -a | awk '/my_docker/{print $1}')
echo "rm CONTAINER - $CONTAINER"
sudo docker stop $CONTAINER
sudo docker rm $CONTAINER

IMAGE=$(sudo docker images | awk '/my_docker/{print $3}')
echo "rm IMAGE - $IMAGE"
sudo docker image rm $IMAGE