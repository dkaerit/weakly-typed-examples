require 'thread'

$shared_variable = 'task1&2: '
$mutex = Mutex.new
$cv = ConditionVariable.new

# Tarea 1: Utilizando mutex y condición de variable compartida
def task1
  sleep(2)
  $mutex.synchronize do
    $shared_variable += 'Hola '
    $cv.signal
  end
end

# Tarea 2: Utilizando mutex y condición de variable compartida
def task2
  sleep(0)
  $mutex.synchronize do
    $shared_variable += 'mundo!'
    $cv.signal
  end
end

# Tarea 3: Utilizando fibers
def task3
  Thread.new do
    sleep(4)
    puts 'task3  : ¡Esto es asincrónico en Ruby!'
  end
end

# Tarea 4: Utilizando hilos en segundo plano
def task4
  Thread.new do
    sleep(1)
    puts 'task4  : ¡Esto es un hilo en segundo plano en Ruby!'
  end
end

# Ejecutar la tarea 1, 2, 3 y 4 en segundo plano
thread1 = Thread.new { task1 }
thread2 = Thread.new { task2 }
thread3 = task3
thread4 = task4

thread1.join # Esperar a que el hilo 1 termine
thread2.join # Esperar a que el hilo 2 termine

# Esperar a que los hilos 1 y 2 finalicen mediante la condición de variable compartida
$mutex.synchronize do
  $cv.wait(mutex) while $shared_variable.empty?
end

# Imprimir el resultado de las tareas 1 y 2
puts $shared_variable

thread3.join # Esperar a que el hilo 3 termine
thread4.join # Esperar a que el hilo 4 termine

# 1º) task4 (1s)
# 2º) task2 0s (pero espera por los 2s de task1 )
# 3º) task1 (2s)
# 4º) task3 (5s)
    
