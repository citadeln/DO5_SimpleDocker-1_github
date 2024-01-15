FROM ubuntu/nginx

WORKDIR /home

COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./server.c .
COPY ./run.sh .

USER $USERNAME
ARG USERNAME=nginx

RUN usermod -aG adm,root,nginx $USERNAME; \
    chown -R $USERNAME:$USERNAME /var/ ; 
RUN apt-get update \
    && apt-get install -y gcc spawn-fcgi libfcgi-dev \    
    && gcc -o server server.c -lfcgi \
    && rm -rf /var/lib/apt/lists     
ENTRYPOINT [ "./run.sh" ]