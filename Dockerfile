# Usar imagen base oficial de MediaWiki
FROM mediawiki:latest

# Establecer variable de entorno para no pedir configuración interactiva
ENV MEDIAWIKI_DB_TYPE=postgres
ENV MEDIAWIKI_DB_HOST=${DB_HOST}
ENV MEDIAWIKI_DB_PORT=5432
ENV MEDIAWIKI_DB_NAME=${DB_NAME}
ENV MEDIAWIKI_DB_USER=${DB_USER}
ENV MEDIAWIKI_DB_PASSWORD=${DB_PASSWORD}

# Copiar archivo de configuración local cuando esté disponible
COPY LocalSettings.php /var/www/html/LocalSettings.php 2>/dev/null || true

# Exponer puerto 80 (HTTP)
EXPOSE 80

# El servidor Apache arrancará automáticamente con la imagen base
