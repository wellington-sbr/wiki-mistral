#!/bin/bash

# Variables de entorno (pasadas por Render)
DB_HOST=${DB_HOST}
DB_NAME=${DB_NAME}
DB_USER=${DB_USER}
DB_PASSWORD=${DB_PASSWORD}
RENDER_EXTERNAL_URL=${RENDER_EXTERNAL_URL:-localhost}

echo "Iniciando MediaWiki con BD: $DB_HOST"

# Crear LocalSettings.php
cat > /var/www/html/LocalSettings.php <<'EOF'
<?php
if ( !defined( 'MEDIAWIKI' ) ) {
    exit;
}

// Database configuration
$wgDBtype = "postgres";
$wgDBserver = getenv('DB_HOST');
$wgDBport = 5432;
$wgDBname = getenv('DB_NAME');
$wgDBuser = getenv('DB_USER');
$wgDBpassword = getenv('DB_PASSWORD');

// SSL para Neon (IMPORTANTE)
$wgDBssl = true;

// Server
$wgServer = "https://" . getenv('RENDER_EXTERNAL_URL');
$wgScriptPath = "/w";
$wgArticlePath = "/wiki/$1";

// Site name
$wgSitename = "Mi Wiki";
$wgMetaNamespace = "Wiki";

// Language
$wgLanguageCode = "es";

// Load skin
wfLoadSkin( 'Vector' );

// File uploads
$wgEnableUploads = true;
$wgUploadDirectory = "$IP/images";

// Permissions
$wgGroupPermissions['*']['read'] = true;
$wgGroupPermissions['*']['edit'] = false;
$wgGroupPermissions['user']['edit'] = true;

?>
EOF

chmod 644 /var/www/html/LocalSettings.php
chown www-data:www-data /var/www/html/LocalSettings.php

# Start Apache
exec apache2-foreground
