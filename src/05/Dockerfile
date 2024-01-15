FROM ubuntu/nginx

WORKDIR /home

COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./server.c .
COPY ./run.sh .

RUN apt-get update \
    && apt-get install -y gcc spawn-fcgi libfcgi-dev \    
    && gcc -o server server.c -lfcgi \
    && rm -rf /var/lib/apt/lists \
    && chmod +x /var/ /run/ /var/run/ /var/log/nginx /etc/nginx

USER nginx

ENTRYPOINT [ "./run.sh" ]

