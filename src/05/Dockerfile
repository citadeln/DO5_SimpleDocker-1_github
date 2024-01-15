FROM nginx:latest

COPY server.c .
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf

RUN apt update \
    && apt upgrade -y \
    && apt install -y gcc spawn-fcgi libfcgi-dev

# Собираем исходники мини-сервера
RUN gcc server.c -o mini-server -lfcgi

# Создаем нового пользователя и переключаемся на него
RUN adduser --system --no-create-home --disabled-login --group monroe && chown -R monroe /var/ /run/ /var/run/ /var/log/nginx /etc/nginx && usermod -a -G monroe nginx

USER monroe

CMD [ "./run.sh" ]
