FROM debian:buster

EXPOSE 443

RUN apt-get update && apt-get install -y \
    nginx \
    openssl

RUN rm -rf /etc/nginx/sites-available/default 
RUN rm -rf /etc/nginx/sites-enabled/default

COPY ./conf /etc/nginx/sites-available/conf
RUN ln -s /etc/nginx/sites-available/conf /etc/nginx/sites-enabled/conf

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/nginx.key -out /etc/ssl/nginx.crt -subj "/C=LV/ST=Riga Region/L=Riga/O=Bobo/OU=IT/CN=agidget"

# CMD ["executable","param1","param2"] (exec form, this is the preferred form - without shell)
# The exec form is parsed as a JSON array, which means that you must use double-quotes (“) around words not single-quotes (‘).
CMD ["nginx", "-g", "daemon off;"]