FROM nginx

WORKDIR /home

COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./server.c .
COPY ./run.sh .

RUN apt-get update \
    && apt-get install -y gcc spawn-fcgi libfcgi-dev \    
    && gcc -o server server.c -lfcgi \
    && rm -rf /var/lib/apt/lists \
    && chown -R nginx:nginx /var/cache/nginx \
    && chown -R nginx:nginx /var/log/nginx \
    && touch /var/run/nginx.pid \
    && chown -R nginx:nginx /var/run/nginx.pid  

USER nginx

ENTRYPOINT [ "./run.sh" ]

HEALTHCHECK --interval=30s --timeout=3s CMD curl http://localhost/ || exit 1
