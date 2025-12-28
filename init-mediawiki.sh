#!/bin/bash
set -e

echo "Initializing MediaWiki with PostgreSQL (Supabase)..."

sleep 3

# Ejecutar instalador de MediaWiki
cd /var/www/html

php maintenance/install.php \
  --dbtype=postgres \
  --dbserver="${DB_HOST}" \
  --dbport="${DB_PORT}" \
  --dbname="${DB_NAME}" \
  --dbuser="${DB_USER}" \
  --dbpass="${DB_PASSWORD}" \
  --scriptpath="/w" \
  --lang="es" \
  --pass="Programari321" \
  "Mistral Wiki" "wellin"

echo "Installation complete"

if [ -f "/var/www/html/LocalSettings.php" ]; then
    echo "LocalSettings.php created"
    chmod 644 /var/www/html/LocalSettings.php
    chown www-data:www-data /var/www/html/LocalSettings.php
fi

echo "Starting Apache..."
exec apache2-foreground
