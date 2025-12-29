FROM php:8.2-apache

# Instalar extensiones PHP necesarias
RUN apt-get update && apt-get install -y \
    libpq-dev \
    imagemagick \
    libmagickwand-dev \
    git \
    wget \
    curl \
    && docker-php-ext-install pgsql pdo_pgsql

# Habilitar módulos Apache
RUN a2enmod rewrite

# Descargar MediaWiki
WORKDIR /var/www/html
RUN wget https://releases.wikimedia.org/mediawiki/1.43/mediawiki-1.43.0.tar.gz && \
    tar -xzf mediawiki-1.43.0.tar.gz && \
    mv mediawiki-1.43.0/* . && \
    rm -rf mediawiki-1.43.0 mediawiki-1.43.0.tar.gz

# Permisos correctos
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80
