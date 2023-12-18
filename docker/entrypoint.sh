#!/bin/sh

cd /config || ! echo "Cannot cd to /config"

cp -pn /config/.env /OLAINDEX/.env
cp -pn /config/database.sqlite /OLAINDEX/storage/install/data/database.sqlite


cd /OLAINDEX

#exec "$@" &
#tail -f /dev/null
su olaindex -c "php artisan serve --host=0.0.0.0 --port=8000 --tries=0 --no-interaction"
