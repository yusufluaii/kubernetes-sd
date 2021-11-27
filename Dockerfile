FROM keopx/apache-php


WORKDIR /var/www/html

RUN rm index.html

EXPOSE 80

COPY ./src .


