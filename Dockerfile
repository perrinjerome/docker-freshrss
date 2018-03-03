FROM php:7-apache
MAINTAINER Marien Fressinaud <dev@marienfressinaud.fr>

RUN apt-get update && \
    apt-get install -y libcurl4-openssl-dev libjpeg62-turbo-dev \
    libmcrypt-dev libpng-dev libicu-dev libgmp-dev libsqlite3-dev && \
    ln -s /usr/include/x86_64-linux-gnu/gmp.h /usr/include/gmp.h && \
    docker-php-ext-install curl mbstring gd intl json zip gmp \
        pdo pdo_sqlite

