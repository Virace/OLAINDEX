FROM php:7-cli-alpine

ENV LANG=C.UTF-8

ADD entrypoint.sh /entrypoint.sh

WORKDIR /OLAINDEX

RUN apk add --no-cache tzdata git composer && \
    echo "Asia/Shanghai" > /etc/timezone && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    apk del tzdata && \
    docker-php-ext-install bcmath && \
    git clone --depth 1 https://github.com/Virace/OLAINDEX.git . && \
    composer install -vvv && \
    composer run install-app && \
    addgroup -g 900 -S olaindex && \
    adduser -h /OLAINDEX -s /bin/sh -G olaindex -u 900 -S olaindex && \
    chown -R olaindex:olaindex /OLAINDEX && \
    chmod 755 /OLAINDEX/storage

ENTRYPOINT ["sh", "/entrypoint.sh"]
