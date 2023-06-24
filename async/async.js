let shared_variable = 'task1&2: ';

// Función sleep auxiliar
function sleep(s) {
  return new Promise(resolve => setTimeout(resolve, s*1000));
}

// Tarea 1: Utilizando mutex y condición de variable compartida
async function task1() {
  await sleep(2);
  shared_variable += 'Hola ';
}

// Tarea 2: Utilizando mutex y condición de variable compartida
async function task2() {
  await sleep(0);
  shared_variable += 'mundo!';
}

// Tarea 3: Utilizando hilos en segundo plano
async function task3() {
  await sleep(4);
  console.log('task3  : ¡Esto es asincrónico en JavaScript!');
}

// Tarea 4: Utilizando hilos en segundo plano
async function task4() {
  await sleep(1);
  console.log('task4  : ¡Esto es un hilo en segundo plano en JavaScript!');
}

// Ejecutar la tarea 1, 2, 3 y 4 en segundo plano
const promise1 = task1();
const promise2 = task2();
const promise3 = task3();
const promise4 = task4();

Promise.all([promise1, promise2]).then(() => {
  console.log(shared_variable);
});

Promise.all([promise3, promise4]).then(() => {});
