FROM alpine:3.13.6
RUN    apk update \
    && apk add --no-cache nginx php7-fpm \
    && mkdir /www \
    && adduser -D -g 'www' www \
    && chown -R www:www /var/lib/nginx \
    && chown -R www:www /www 
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.php /www/index.php
COPY entrypoint.sh /tmp/
EXPOSE 80
ENTRYPOINT ["/bin/sh" , "/tmp/entrypoint.sh"]