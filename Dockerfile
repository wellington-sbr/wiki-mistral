FROM php:8.2-apache

# Instalar dependencias del sistema
RUN apt-get update && apt-get install -y \
    libpq-dev \
    libicu-dev \
    imagemagick \
    libmagickwand-dev \
    git \
    wget \
    curl \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

# Instalar extensiones PHP REQUERIDAS por MediaWiki 1.43
RUN docker-php-ext-install \
    pgsql \
    pdo_pgsql \
    intl \
    xml \
    mbstring \
    json \
    fileinfo \
    gd \
    && docker-php-ext-configure intl

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

CMD ["apache2-foreground"]
