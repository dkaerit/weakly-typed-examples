<?php
try {
    // Bloque de código donde puede ocurrir una excepción
    $resultado = dividir(10, 0);
    echo "El resultado es: " . $resultado;
} catch (Exception $e) {
    echo "Error: División por cero". PHP_EOL;
}

// En php no importa si la función está después de su uso
function dividir($num1, $num2) {
    if ($num2 === 0) throw new Exception("Error de división por cero");
    return $num1 / $num2;
}

