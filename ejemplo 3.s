.data
	titulo: .asciiz "Programa mayor que \n"  #Alcena una cadena en el segemento de datos
	mensaje: .asciiz "Ingrese un número mayor cero\n" #Alcena una cadena en el segemento de datos
	coma: .asciiz "," #Alcena una cadena en el segemento de datos
.text
main:
  	li $v0,4 # SubIntrucción para imprimir
	la $a0,titulo  # la, carga dirección en $a0 de Cadena, es para imprimir el mensaje
	syscall # hacemos ls llamada al sistema
	
	li $v0,4  # SubIntrucción para imprimir
	la $a0,mensaje  # la, carga dirección en $a0 de Cadena, es para imprimir el mensaje
	syscall # hacemos la, llamada al sistema
	
	li $v0,5  # SubIntrucción ingresar un numero por el teclado 
	syscall # hacemos la, llamada al sistema
	
	move $t0,$v0 #Movemos lo que se ingreso en $v0 con la intrucion anterior a $t0
	
  	li    $t1, 1 # Seteamos $t1 to 1
  	move $a0, $t1 # movemos el numero de $t1 para $a0.
  	li $v0, 1 # llamda al sistemas para imprimir un entero dentro de $v0.
  	syscall # hacemos la llamada al sistema
  	
  	li $v0,4  # SubIntrucción para imprimir  una cadena
  	la $a0,coma  # la carga dirección en $a0 de Cadena, es para imprimir el mensaje
  	syscall
  	
  	li    $t2, 1 # Seteamos $t2 to 1
  	sub  $t0, $t0, 1 # Restamos 1 por que ya lo imprimimos
  	bgt $t0, 0, fib
fib:
  
  move $a0, $t2 # movemos el numero de $t2 para $a0.
  li $v0, 1 # llamada al sistemas para imprimir un entero dentro de $v0.
  syscall # hacemos la llamada al sistema
  
  li $v0,4  # SubIntrucción para imprimir  una cadena
  la $a0,coma  # la carga dirección en $a0 de Cadena, es para imprimir el mensaje
  syscall
  
  move    $t3, $t2 # Seteamos $t3 a $t2
  add   $t2,$t2,$t1 
  move    $t1, $t3 # Seteamos $t3 a $t2
  
  sub  $t0, $t0, 1         # # Restamos 1 por que ya lo imprimimos
  bgtz $t0, fib        # repite hasta finalizar.
  jr $ra		# salto incondicional