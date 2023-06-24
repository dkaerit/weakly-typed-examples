try {
    // Bloque de código donde puede ocurrir una excepción
    const resultado = dividir(10, 0);
    console.log("El resultado es:", resultado);
} catch (error) {
    console.log("Error: División por cero");
}

// En js no importa si la función está después de su uso
function dividir(num1, num2) {
    if (num2 === 0) throw new Error("Zero division error");
    return num1 / num2;
}
