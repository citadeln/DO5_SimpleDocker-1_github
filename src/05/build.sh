#!/bin/bash

sudo docker build -t my_docker:01 .

#sudo docker run -d -p 80:81 --name my_container my_docker

sudo docker run -d -p 80:81 --name my_container -v /home/monroebu/github/DO5_SimpleDocker-1_github/src/05/nginx/nginx.conf:/etc/nginx/nginx.conf -d my_docker:01

echo -e "\033[32m""\t\tmonroebu""\033[0m"