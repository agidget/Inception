#!/bin/sh

if [ ! -e wp-config.php ]; then
	wp core download --force --allow-root
	sleep 10
	wp config create --allow-root \
		--dbname=${DB_NAME} \
		--dbuser=${DB_USER} \
		--dbpass=${DB_PSW} \
		--dbhost=${DB_HOST}
	wp core install --allow-root \
		--url=${DOMAIN_NAME} \
		--title=${WP_TITLE} \
		--admin_user=${WP_ADMIN} \
		--admin_password=${WP_ADMIN_PASSWORD} \
		--admin_email=${WP_ADMIN_EMAIL}
	wp user create --allow-root \
		${WP_USER} \
		${WP_USER_EMAIL} \
		--role=subscriber \
		--user_pass=${WP_USER_PASSWORD}
fi
php-fpm7.3 --nodaemonize