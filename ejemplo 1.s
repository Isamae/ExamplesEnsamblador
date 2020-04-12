.data
	titulo: .asciiz "Programa mayor que \n"  #Alcena una cadena en el segemento de datos
	mensaje: .asciiz "Ingrese el primer número \n" #Alcena una cadena en el segemento de datos
	mensaje2: .asciiz "Ingrese el segundo numero \n" #Alcena una cadena en el segemento de datos
	resul: .asciiz  " es mayor numero \n"  #Alcena una cadena en el segemento de datos
.text
	.globl main  #llamada a la  funcion main
main:
	li $v0,4 # SubIntrucción para imprimir
	la $a0,titulo  # la, carga dirección en $a0 de Cadena, es para imprimir el mensaje
	syscall # hacemos la, llamada al sistema
	
	li $v0,4  # SubIntrucción para imprimir
	la $a0,mensaje  # la, carga dirección en $a0 de Cadena, es para imprimir el mensaje
	syscall # hacemos la llamada al sistema
	
	li $v0,5  # SubIntrucción ingresar un numero por el teclado 
	syscall # hacemos la llamada al sistema
	
	move $t0,$v0 #Movemos lo que se ingreso en con la intrucion anterior a $t0
	
	li $v0,4  # SubIntrucción para imprimir
	la $a0,mensaje2  # la, carga dirección en $a0 de Cadena, es para imprimir el mensaje
	syscall # hacemos la llamada al sistema
	
	li $v0,5  # SubIntrucción ingresar un numero por el teclado 
	syscall # hacemos la llamada al sistema
	
	move $t1,$v0 #Movemos lo que se ingreso en con la intrucion anterior a $t0
	
	bgt $t0,$t1,funcion  #Si $t0 es mayor que $t1 se salta a funcion 	
	b finalizar
funcion:
	move $t1, $t0 #Movemos lo que esta en $t1 a $a0
finalizar:
	move $a0, $t1 # movemos el numero de $t1 para $a0.
	li $v0, 1 # llamda al sistemas para imprimir un entero dentro de $v0.
	syscall # hacemos la llamada al sistema
	
	li $v0,4  # SubIntrucción para imprimir  una cadena
	la $a0,resul  # la carga dirección en $a0 de Cadena, es para imprimir el mensaje
	syscall
	
	## Salida del programa
	li $v0, 10 # llamada el sistemas con el codigo 10 para salir
	syscall # hacemos la llamada al sistema
