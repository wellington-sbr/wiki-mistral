#!/bin/bash
set -e

echo "Initializing MediaWiki..."

# Esperar a que la BD esté lista
sleep 2

# Ejecutar MediaWiki install
cd /var/www/html
php maintenance/install.php \
  --dbtype=postgres \
  --dbserver="ep-odd-queen-ag68f36e-pooler.c-2.eu-central-1.aws.neon.tech" \
  --dbname="mediawiki_db" \
  --dbuser="neondb_owner" \
  --dbpass="npg_p75cgGwkZAxo" \
  --dbport=5432 \
  --installdbuser="neondb_owner" \
  --installdbpass="npg_p75cgGwkZAxo" \
  --scriptpath="/w" \
  --lang="es" \
  --pass="admin123" \
  "Mistral Wiki" "admin"

echo "MediaWiki installation complete"

# Copiar el LocalSettings.php generado
if [ -f "/var/www/html/LocalSettings.php" ]; then
    echo "LocalSettings.php found"
    chmod 644 /var/www/html/LocalSettings.php
    chown www-data:www-data /var/www/html/LocalSettings.php
fi

echo "Starting Apache..."
exec apache2-foreground
