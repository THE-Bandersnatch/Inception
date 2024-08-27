#!/bin/bash
cd /var/www/wordpress

sleep 10
WP_ADMIN_PWD=$(grep "WP_ADMIN_PWD=" /run/secrets/credentials | cut -d'=' -f2)
WP_PWD=$(grep "WP_PWD=" /run/secrets/credentials | cut -d'=' -f2)
SQL_PASSWORD=$(grep "SQL_PASSWORD=" /run/secrets/db_password | cut -d'=' -f2)

echo "Starting PHP-FPM-----------1" $SQL_PASSWORD $WP_ADMIN_PWD $WP_PWD

echo "############# checking if wp-config.php exists ###############"

if [ -f /var/www/wordpress/wp-config.php ]; then
	echo "File exists"
else
	echo "File does not exist"
	wp core download --allow-root

	echo "wp core install and create config file -----"
	wp config create --dbname="$SQL_DATABASE" --dbuser="$SQL_USER" --dbpass="$SQL_PASSWORD" --dbhost="$WP_DBHOST" --allow-root

fi
echo "############# wp-config.php created ###############"
wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root
echo "############# user created ###############"

mkdir -p /var/www/wordpress/wp-content/uploads
chown -R www-data:www-data /var/www/wordpress/wp-content/uploads
chmod -R 755 /var/www/wordpress/wp-content/uploads

sed -i 's/listen = \/run\/php\/php8.2-fpm.sock/listen = 9000/g' /etc/php/8.2/fpm/pool.d/www.conf

mkdir -p /run/php

chmod +x /var/www/wordpress/*

echo "########### set up completed ###########"

exec "$@"