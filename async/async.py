import time
from threading import Thread

shared_variable = 'task1&2: '

# Tarea 1: Utilizando mutex y condición de variable compartida
def task1():
    time.sleep(2)
    global shared_variable
    shared_variable += 'Hola '

# Tarea 2: Utilizando mutex y condición de variable compartida
def task2():
    time.sleep(0)
    global shared_variable
    shared_variable += 'mundo!'

# Tarea 3: Utilizando hilos en segundo plano
def task3():
    time.sleep(4)
    print('task3  : ¡Esto es asincrónico en Python!')

# Tarea 4: Utilizando hilos en segundo plano
def task4():
    time.sleep(1)
    print('task4  : ¡Esto es un hilo en segundo plano en Python!')

# Crear la tarea 1, 2, y 4
thread1 = Thread(target=task1)
thread2 = Thread(target=task2)
thread3 = Thread(target=task3)
thread4 = Thread(target=task4)

# Ejecutar la tarea 1, 2, 3 y 4 en segundo plano
thread1.start()
thread2.start()
thread3.start()
thread4.start()

thread1.join() # Esperar a que el hilo 1 termine
thread2.join() # Esperar a que el hilo 2 termine

# Esperar a que los hilos 1 y 2 finalicen mediante la condición de variable compartida
while shared_variable == 'task1&2: ':
    pass

print(shared_variable)

thread3.join() # Esperar a que el hilo 3 termine
thread4.join() # Esperar a que el hilo 4 termine

# 1º) task4 (1s)
# 2º) task2 0s (pero espera por los 2s de task1 )
# 3º) task1 (2s)
# 4º) task3 (5s)
