FROM debian:buster

EXPOSE 9000

RUN apt-get update && apt-get install -y \
    wget \
    mariadb-client \
    php7.3 \
    php-fpm \
    php-mysql

RUN rm -rf /etc/php/7.3/fpm/pool.d/www.conf
COPY ./www.conf /etc/php/7.3/fpm/pool.d

COPY ./wp.sh /etc/php/7.3
RUN chmod +x /etc/php/7.3/wp.sh
RUN mkdir /run/php/

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod a+x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /var/www/wordpress
RUN chown -R www-data:www-data /var/www/wordpress
RUN chmod -R 755 /var/www/wordpress

WORKDIR /var/www/wordpress
CMD ["/bin/sh", "/etc/php/7.3/wp.sh"]