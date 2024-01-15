#!/bin/bash

apt update
apt install gcc spawn-fcgi libfcgi-dev
cd home
#gcc -o server server.c -lfcgi
#spawn-fcgi -p 8080 ./server
#./server&

gcc -o server.v.2 server.v.2.c -lfcgi
spawn-fcgi -p 8080 ./server.v.2

nginx -s reload
