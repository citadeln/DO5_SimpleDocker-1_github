FROM ubuntu/nginx

WORKDIR /home

COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./server.c .
COPY ./run.sh .

USER monroe

RUN adduser --system --no-create-home --disabled-login --group myuser && \
    chown -R myuser /var/ /run/ /var/run/ /var/log/nginx /etc/nginx && \
    usermod -a -G monroe nginx
    
RUN apt-get update \
    && apt-get install -y gcc spawn-fcgi libfcgi-dev \    
    && gcc -o server server.c -lfcgi \
    && rm -rf /var/lib/apt/lists     
ENTRYPOINT [ "./run.sh" ]