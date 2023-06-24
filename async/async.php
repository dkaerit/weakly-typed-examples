<?php
// !!! DEBE EJECUTARSE EN PHP 8

$shared_variable = 'task1&2: ';

// Tarea 1: Utilizando mutex y condición de variable compartida
function task1() {
    sleep(2);
    global $shared_variable;
    $shared_variable .= 'Hola ';
}

// Tarea 2: Utilizando mutex y condición de variable compartida
function task2() {
    sleep(0);
    global $shared_variable;
    $shared_variable .= 'mundo!';
}

// Tarea 3: Utilizando hilos en segundo plano
function task3() {
    sleep(5);
    echo 'task3  : ¡Esto es asincrónico en PHP!', PHP_EOL;
}

// Tarea 4: Utilizando hilos en segundo plano
function task4() {
    sleep(1);
    echo 'task4  : ¡Esto es un hilo en segundo plano en PHP!', PHP_EOL;
}

// Crear las tareas 1, 2, 3 y 4 como Fibers
$fiber1 = new Fiber('task1');
$fiber2 = new Fiber('task2');
$fiber3 = new Fiber('task3');
$fiber4 = new Fiber('task4');

// Ejecutar las tareas 1, 2, 3 y 4 como Fibers en paralelo
$fiber1->start();
$fiber2->start();
$fiber3->start();
$fiber4->start();

$fiber1->join(); // Esperar a que la tarea 1 termine
$fiber2->join(); // Esperar a que la tarea 2 termine

// Esperar a que las tareas 1 y 2 finalicen mediante la variable compartida
while ($shared_variable == 'task1&2: ');

echo $shared_variable, PHP_EOL;

$fiber3->join(); // Esperar a que la tarea 3 termine
$fiber4->join(); // Esperar a que la tarea 4 termine

# 1º) task4 (1s)
# 2º) task2 0s (pero espera por los 2s de task1 )
# 3º) task1 (2s)
# 4º) task3 (5s)

?>
