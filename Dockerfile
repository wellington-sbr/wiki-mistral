FROM mediawiki:latest

# Instalar PostgreSQL client
RUN apt-get update && apt-get install -y postgresql-client && rm -rf /var/lib/apt/lists/*

# Copiar LocalSettings.php
COPY LocalSettings.php /var/www/html/LocalSettings.php
RUN chown www-data:www-data /var/www/html/LocalSettings.php && chmod 644 /var/www/html/LocalSettings.php

EXPOSE 80

CMD ["apache2-foreground"]
