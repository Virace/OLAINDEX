#!/bin/sh
cd /OLAINDEX
git clone --depth 1 https://github.com/Virace/OLAINDEX.git .
composer install -vvv
composer run install-app
addgroup -g 900 -S olaindex
adduser -h /OLAINDEX -s /bin/sh -G olaindex -u 900 -S olaindex
chown -R olaindex:olaindex /OLAINDEX
chmod 755 /OLAINDEX/storage

#exec "$@" &
#tail -f /dev/null
su olaindex -c "php artisan serve --host=0.0.0.0 --port=8000 --tries=0 --no-interaction"
