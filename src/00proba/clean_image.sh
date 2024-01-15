#!/bin/bash

CONTAINER=$(sudo docker ps -a | awk '/my_proba/{print $1}')
echo "rm CONTAINER - $CONTAINER"
sudo docker stop $CONTAINER
sudo docker rm $CONTAINER

IMAGE=$(sudo docker images | awk '/my_proba/{print $3}')
echo "rm IMAGE - $IMAGE"
sudo docker image rm $IMAGE

echo -e "\033[32m""\t\tmonroebu""\033[0m"
