#!/bin/bash
set -e

echo "Initializing MediaWiki..."

# Crear LocalSettings.php de cero
cat > /var/www/html/LocalSettings.php <<'EOFPHP'
<?php
# This file was automatically generated, do not edit by hand

if ( !defined( 'MEDIAWIKI' ) ) {
	exit;
}

$wgSitename = "Mistral Wiki";
$wgMetaNamespace = "Wiki";
$wgLanguageCode = "es";

# Uploaded file restrictions
$wgEnableUploads = true;
$wgUploadPath = "$wgScriptPath/images";
$wgUploadDirectory = "$IP/images";

# Database
$wgDBtype = "postgres";
$wgDBserver = "ep-odd-queen-ag68f36e-pooler.c-2.eu-central-1.aws.neon.tech";
$wgDBname = "mediawiki_db";
$wgDBuser = "neondb_owner";
$wgDBpassword = "npg_p75cgGwkZAxo";
$wgDBport = 5432;
$wgDBssl = true;

# Server config
$wgServer = "https://mediawiki-mistral.onrender.com";
$wgScriptPath = "/w";
$wgArticlePath = "/wiki/$1";

# Skin
wfLoadSkin( 'Vector' );

# Security keys
$wgSecretKey = "d41d8cd98f00b204e9800998ecf8427e";
$wgUpgradeKey = "d41d8cd98f00b204e9800998ecf8427e";

# Disable most things
$wgMainCacheType = CACHE_NONE;

$wgGroupPermissions['*']['read'] = true;
$wgGroupPermissions['*']['edit'] = false;
$wgGroupPermissions['user']['edit'] = true;

?>
EOFPHP

echo "LocalSettings.php created"
chmod 644 /var/www/html/LocalSettings.php
chown www-data:www-data /var/www/html/LocalSettings.php

echo "Starting Apache..."
exec apache2-foreground
