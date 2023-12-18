FROM php:7-cli-alpine

ENV LANG=C.UTF-8

ADD entrypoint.sh /entrypoint.sh

WORKDIR /OLAINDEX

RUN apk add --no-cache tzdata git composer && \
    echo "Asia/Shanghai" > /etc/timezone && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    apk del tzdata && \
    docker-php-ext-install bcmath


ENTRYPOINT ["sh", "entrypoint.sh"]
