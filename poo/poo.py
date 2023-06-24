class Animal:
    # Constructor
    def __init__(self, nombre):
        self._nombre = nombre  # Atributo nombre (protegido)
        Animal.contador_instancias += 1

    def hacer_sonido(self):
        return "Haciendo sonido"

    contador_instancias = 0  # Atributo de clase (estático)

# Clases derivadas Perro y Gato
class Perro(Animal):
    def hacer_sonido(self):
        return "¡Guau!"

class Gato(Animal):
    def hacer_sonido(self):
        return "¡Miau!"

animales = [Perro("Fido"), Gato("Pelusa")]

# Polimorfismo: iteración a través de los objetos y llamada al método hacer_sonido()
for animal in animales:
    print(f"Nombre: {animal._nombre}, Sonido: {animal.hacer_sonido()}")

print(f"Contador de instancias: {Animal.contador_instancias}")

# No se puede agregar un método específico a una instancia en Python sin un enfoque adicional
