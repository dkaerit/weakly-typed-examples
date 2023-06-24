class Animal {
    static contadorInstancias = 0;  // Atributo de clase (estático)

    // Constructor
    constructor(nombre) {
        this.nombre = nombre;  // Atributo nombre (público)
        Animal.contadorInstancias++;
    }

    hacerSonido() { return "Haciendo sonido"; }
    
}

class Perro extends Animal {
    hacerSonido() { return "¡Guau!"; }
}

class Gato extends Animal {
    hacerSonido() { return "¡Miau!"; }
}


// Ejecución del programa
// Instanciación de objetos
const fido = new Perro("Fido");
const pelusa = new Gato("Pelusa");
const animales = [fido, pelusa];

// Polimorfismo: iteración a través de los objetos y llamada al método hacerSonido()
animales.forEach(animal => {
    console.log(`Nombre: ${animal.nombre}, Sonido: ${animal.hacerSonido()}`);
});

console.log(`Contador de instancias: ${Animal.contadorInstancias}`);

// Singleton: Agregar método específico a la instancia de fido
fido.tropezar = function() {
    console.log(`${this.nombre} tropezó`);
};

fido.tropezar();
