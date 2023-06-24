# Clase base
class Animal
  attr_reader :nombre  # Atributo nombre solo lectura (privado)
  @@contador_instancias = 0  # Atributo de clase (estático)

  # Constructor
  def initialize(nombre)
    @nombre = nombre  # Atributo nombre
    @@contador_instancias += 1
  end

  # Método de instancia
  def hacer_sonido
    "Haciendo sonido"
  end

  # Método de clase (estático)
  def self.contador_instancias
    @@contador_instancias
  end
end

# Clases derivadas Perro y Gato
class Perro < Animal
  def hacer_sonido
    "¡Guau!"
  end
end

class Gato < Animal
  def hacer_sonido
    "¡Miau!"
  end
end

# Ejecución del programa
# Instanciación de objetos
fido = Perro.new("Fido")
pelusa = Gato.new("Pelusa")
animales = [fido, pelusa]

# Polimorfismo: iteración a través de los objetos y llamada al método hacer_sonido()
animales.each do |animal|
  puts "Nombre: #{animal.nombre}, Sonido: #{animal.hacer_sonido}"
end

# Acceso al contador de instancias
puts "Contador de instancias: #{Animal.contador_instancias}"

# Singleton: Agregar método específico a la instancia de fido
def fido.tropezar
  puts "#{@nombre} tropezó"
end

fido.tropezar