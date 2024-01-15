#!/bin/bash

sudo docker build -t my_proba .

#sudo docker run -d -p 80:81 --name mymy my_docker

sudo docker run -d --name my_cont_01  my_proba

echo -e "\033[32m""\t\tmonroebu""\033[0m"