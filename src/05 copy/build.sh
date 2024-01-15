#!/bin/bash

sudo docker build -t my_docker .

#sudo docker run -d -p 80:81 --name my_container my_docker

sudo docker run -d -p 80:81 --name my_container -v /home/monroebu/DO5_SimpleDocker-1/src/04/nginx/nginx.conf:/etc/nginx/nginx.conf -d my_docker

echo -e "\033[32m""\t\tmonroebu""\033[0m"