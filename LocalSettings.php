<?php
if ( !defined( 'MEDIAWIKI' ) ) {
    exit;
}

// =====================================================
// CONFIGURACIÓN DE BASE DE DATOS NEON + POSTGRESQL
// =====================================================

$wgDBtype = "postgres";
$wgDBserver = getenv( 'DB_HOST' ) ?: "localhost";
$wgDBport = 5432;
$wgDBname = getenv( 'DB_NAME' ) ?: "mediawiki_db";
$wgDBuser = getenv( 'DB_USER' ) ?: "neondb_owner";
$wgDBpassword = getenv( 'DB_PASSWORD' ) ?: "";

// SSL PARA NEON (OBLIGATORIO)
$wgDBssl = true;
$wgDBsslmode = 'require';

// =====================================================
// CONFIGURACIÓN DE SERVIDOR
// =====================================================

$wgServer = "https://" . ( getenv( 'RENDER_EXTERNAL_URL' ) ?: "localhost" );
$wgScriptPath = "/w";
$wgArticlePath = "/wiki/$1";
$wgUsePathInfo = true;

// =====================================================
// NOMBRE DEL WIKI Y CONFIGURACIÓN BÁSICA
// =====================================================

$wgSitename = "Mistral Wiki";
$wgMetaNamespace = "Wiki";
$wgLanguageCode = "es";
$wgLogo = "$wgResourceBasePath/resources/assets/wiki.png";

// =====================================================
// SKIN (INTERFAZ)
// =====================================================

wfLoadSkin( 'Vector' );

// =====================================================
// ARCHIVOS Y SUBIDAS
// =====================================================

$wgEnableUploads = true;
$wgMaxUploadSize = 4294967296;
$wgUploadDirectory = "$IP/images";
$wgUploadPath = "$wgScriptPath/images";

// =====================================================
// PERMISOS
// =====================================================

$wgGroupPermissions['*']['read'] = true;
$wgGroupPermissions['*']['edit'] = false;
$wgGroupPermissions['user']['edit'] = true;
$wgGroupPermissions['user']['upload'] = true;

// =====================================================
// CLAVES DE SEGURIDAD
// =====================================================

$wgSecretKey = "abcdef1234567890abcdef1234567890abcdef12";
$wgUpgradeKey = "abcdef1234567890abcdef1234567890abcdef12";

// =====================================================
// CACHÉ
// =====================================================

$wgMainCacheType = CACHE_NONE;

// =====================================================
// CONTACTO
// =====================================================

$wgEmergencyContact = "admin@example.com";
$wgPasswordSender = "admin@example.com";

?>
