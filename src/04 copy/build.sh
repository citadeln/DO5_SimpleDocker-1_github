#!/bin/bash

sudo docker build -t my_docker .

sudo docker run -d -p 80:81 --name mymy my_docker