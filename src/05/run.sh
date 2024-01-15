#!/bin/bash

spawn-fcgi -p 8080 ./server 

nginx -g 'daemon off;'