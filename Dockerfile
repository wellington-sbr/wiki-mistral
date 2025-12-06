FROM php:8.1-apache

# Actualiza repositorios e instala dependencias del sistema
RUN apt-get update && apt-get install -y \
    libonig-dev \
    libxml2-dev \
    && rm -rf /var/lib/apt/lists/*

# Instala extensiones PHP
RUN docker-php-ext-install mbstring xml

# Habilita mod_rewrite de Apache
RUN a2enmod rewrite

# Configura el documento root
WORKDIR /var/www/html

# Copia los archivos de DokuWiki
COPY dokuwiki/ .

# CRÍTICO: Primero da permisos correctos ANTES de cambiar propietario
RUN find . -type f -exec chmod 644 {} \; && \
    find . -type d -exec chmod 755 {} \; && \
    chown -R www-data:www-data /var/www/html && \
    chmod -R 775 /var/www/html/data && \
    chmod -R 775 /var/www/html/conf

# Expone el puerto 80
EXPOSE 80

# Inicia Apache como www-data (ya lo hace por defecto)
CMD ["apache2-foreground"]
