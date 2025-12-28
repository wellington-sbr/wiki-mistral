<?php
if ( !defined( 'MEDIAWIKI' ) ) {
    exit;
}

$wgDBtype = "postgres";
$wgDBserver = "ep-odd-queen-ag68f36e-pooler.c-2.eu-central-1.aws.neon.tech";
$wgDBport = 5432;
$wgDBname = "neondb";
$wgDBuser = "neondb_owner";
$wgDBpassword = "npg_p75cgGwkZAxo";  

$wgDBssl = true;
$wgDBsslmode = 'require';

$wgServer = "mediawiki-mistral.onrender.com";
$wgScriptPath = "/w";

$wgSitename = "Mistral Wiki";
$wgLanguageCode = "es";

wfLoadSkin( 'Vector' );

$wgEnableUploads = true;
$wgUploadDirectory = "$IP/images";

$wgGroupPermissions['*']['read'] = true;
$wgGroupPermissions['*']['edit'] = false;
$wgGroupPermissions['user']['edit'] = true;

$wgSecretKey = "abc123xyz";
$wgUpgradeKey = "abc123xyz";

?>
