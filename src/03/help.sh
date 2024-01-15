#!/bin/bash

#sudo docker pull nginx
#sudo apt-get install spawn-fcgi
sudo docker ps -a

sudo lsof -i :8080
sudo lsof -i :80
sudo lsof -i :81

#sudo docker run -d -p 81:81 nginx
#sudo docker start silly_napier

#sudo docker exec -it silly_napier bash

echo -e "\033[32m""\t\tmonroebu""\033[0m"

sudo docker cp ./run_03.sh silly_napier:/home/
sudo docker cp ../03/nginx/nginx.conf silly_napier:/etc/nginx/

sudo docker cp ../03/server.c silly_napier:/home/
sudo docker cp ../03/server.v.2.c silly_napier:/home/

