<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

echo "=== TEST DE MEDIAWIKI ===\n\n";

// Test 1: Verificar que el archivo existe
echo "1. Verificando LocalSettings.php...\n";
if (file_exists('/var/www/html/LocalSettings.php')) {
    echo "   ✓ LocalSettings.php encontrado\n";
} else {
    echo "   ✗ LocalSettings.php NO encontrado\n";
}

// Test 2: Intentar incluir LocalSettings.php
echo "\n2. Intentando incluir LocalSettings.php...\n";
try {
    include '/var/www/html/LocalSettings.php';
    echo "   ✓ LocalSettings.php incluido sin errores\n";
} catch (Exception $e) {
    echo "   ✗ Error: " . $e->getMessage() . "\n";
}

// Test 3: Verificar variables de DB
echo "\n3. Variables de base de datos:\n";
if (isset($wgDBserver)) {
    echo "   DB Server: " . $wgDBserver . "\n";
    echo "   DB Name: " . $wgDBname . "\n";
    echo "   DB User: " . $wgDBuser . "\n";
} else {
    echo "   ✗ Variables de DB no están definidas\n";
}

// Test 4: Intentar conectar a BD
echo "\n4. Intentando conectar a PostgreSQL...\n";
try {
    $conn = pg_connect(
        "host=" . $wgDBserver . 
        " dbname=" . $wgDBname . 
        " user=" . $wgDBuser . 
        " password=" . $wgDBpassword .
        " sslmode=require"
    );
    if ($conn) {
        echo "   ✓ Conexión exitosa a PostgreSQL\n";
        pg_close($conn);
    } else {
        echo "   ✗ Error de conexión: " . pg_last_error() . "\n";
    }
} catch (Exception $e) {
    echo "   ✗ Excepción: " . $e->getMessage() . "\n";
}

echo "\n=== FIN DEL TEST ===\n";
?>
