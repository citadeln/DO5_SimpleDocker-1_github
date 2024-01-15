FROM nginx

WORKDIR /home

COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./server.c .
COPY ./run.sh .

RUN chown -R nginx:monroe /var/cache/nginx && \
    chown -R nginx:monroe /var/log/nginx && \
    chown -R nginx:monroe /etc/nginx/conf.d && \
    chown -R nginx:monroe /var/lib/dpkg && \
    touch /var/run/nginx.pid && \
    chown -R nginx:monroe /var/run/nginx.pid

USER monroe

RUN apt-get update \
    && apt-get install -y gcc spawn-fcgi libfcgi-dev \    
    && gcc -o server server.c -lfcgi \
    && rm -rf /var/lib/apt/lists 

ENTRYPOINT [ "./run.sh" ]
