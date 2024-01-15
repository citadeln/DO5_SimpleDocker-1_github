#!/bin/bash

CONTAINER=$(sudo docker ps -a | awk '/my_docker/{print $1}')
echo "rm CONTAINER - $CONTAINER"
sudo docker stop $CONTAINER
sudo docker rm $CONTAINER

IMAGE=$(sudo docker images | awk '/my_docker/{print $3}')
echo "rm IMAGE - $IMAGE"
sudo docker image rm $IMAGE

echo -e "\033[32m""\t\tmonrExitedoebu""\033[0m"


IMAGE=$(sudo docker images | awk '/none/{print $3}')
echo "rm IMAGE (none) - $IMAGE"
sudo docker image rm $IMAGE

CONTAINER=$(sudo docker ps -a | awk '/Exited/{print $1}')
echo "rm CONTAINER (Exited) - $CONTAINER"
sudo docker stop $CONTAINER
sudo docker rm $CONTAINER
