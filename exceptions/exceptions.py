# En python la declaracion de la fn debe estar antes de su uso
def dividir(num1, num2):
    if num2 == 0:
        raise ZeroDivisionError
    return num1 / num2

try:
    # Bloque de código donde puede ocurrir una excepción
    resultado = dividir(10, 0)
    print("El resultado es:", resultado)
except ZeroDivisionError:
    print("Error: División por cero")

