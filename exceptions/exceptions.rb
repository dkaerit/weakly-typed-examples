# En ruby la declaracion de la fn debe estar antes de su uso
def dividir(num1, num2)
    raise ZeroDivisionError if num2 == 0
    num1 / num2
end

begin
    # Bloque de código donde puede ocurrir una excepción
    resultado = dividir(10, 0)
    puts "El resultado es: #{resultado}"
rescue ZeroDivisionError
    puts "Error: División por cero"
end

