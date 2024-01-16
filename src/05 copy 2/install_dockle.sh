#!/bin/bash

VERSION=$(
 curl --silent "https://api.github.com/repos/goodwithtech/dockle/releases/latest" | \
 grep '"tag_name":' | \
 sed -E 's/.*"v([^"]+)".*/\1/' \
) && curl -L -o dockle.deb https://github.com/goodwithtech/dockle/releases/download/v${VERSION}/dockle_${VERSION}_Linux-64bit.deb
sudo dpkg -i dockle.deb && rm dockle.deb

echo -e "\033[32m""\t\tmonroebu""\033[0m"FROM ubuntu/nginx

WORKDIR /home

COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./server.c .
COPY ./run.sh .
    
RUN apt-get update \
    && apt-get install -y gcc spawn-fcgi libfcgi-dev \    
    && gcc -o server server.c -lfcgi \
    && rm -rf /var/lib/apt/lists \
    && adduser --system --no-create-home --disabled-login --group myuser \
    && chown -R myuser /var/ /run/ /var/run/ /var/log/nginx /etc/nginx \
    && usermod -a -G myuser nginx
USER nginx

ENTRYPOINT [ "./run.sh" ]



----------------------


FROM ubuntu/nginx

WORKDIR /home

COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./server.c .
COPY ./run.sh .
    
RUN apt-get update \
    && apt-get install -y gcc spawn-fcgi libfcgi-dev \    
    && gcc -o server server.c -lfcgi \
    && rm -rf /var/lib/apt/lists \
    && adduser --system --no-create-home --disabled-login --group myuser \
    && chown -R myuser /var/ /run/ /var/run/ /var/log/nginx /etc/nginx \
    && usermod -a -G myuser nginx
USER nginx

ENTRYPOINT [ "./run.sh" ]

