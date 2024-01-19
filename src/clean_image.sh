#!/bin/bash

CONTAINER1=$(sudo docker ps -a | awk '/my_docker/{print $1}')
CONTAINER2=$(sudo docker ps -a | awk '/Exited/{print $1}')
CONTAINER3=$(sudo docker ps -a | awk '/buildx_buildkit_default/{print $1}')

echo "rm CONTAINER - $CONTAINER1 $CONTAINER2 $CONTAINER3"
sudo docker stop $CONTAINER $CONTAINER2 $CONTAINER3
sudo docker rm $CONTAINER $CONTAINER2 $CONTAINER3

IMAGE=$(sudo docker images | awk '/my_docker/{print $3}')
echo "rm IMAGE - $IMAGE"
sudo docker image rm $IMAGE

echo -e "\033[32m""\t\tmonredoebu""\033[0m"

IMAGE=$(sudo docker images | awk '/none/{print $3}')
echo "rm IMAGE (none) - $IMAGE"
sudo docker image rm $IMAGE
