<?php
class Animal {
    public $nombre; // Atributo nombre (privado)
    private static $contador_instancias = 0; // Atributo de clase (estático)

    # Constructor
    public function __construct($nombre) {
        $this->nombre = $nombre;
        self::$contador_instancias++;
    }

    public function hacerSonido() {
        return "Haciendo sonido";
    }

    public static function getContadorInstancias() {
        return self::$contador_instancias;
    }
}

# Clases derivadas Perro y Gato
class Perro extends Animal {
    public function hacerSonido() {
        return "¡Guau!";
    }
}

class Gato extends Animal {
    public function hacerSonido() {
        return "¡Miau!";
    }
}

# Ejecución del programa
$animales = [new Perro("Fido"), new Gato("Pelusa")];

# Polimorfismo: iteración a través de los objetos y llamada al método hacerSonido()
foreach ($animales as $animal) 
    echo "Nombre: " . $animal->nombre . ", Sonido: " . $animal->hacerSonido() . "\n";

echo "Contador de instancias: " . Animal::getContadorInstancias() . "\n";

# No se puede agregar un método específico a una instancia en Python sin un enfoque adicional
