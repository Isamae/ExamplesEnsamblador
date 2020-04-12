 .data
	arrayA: .space 20  #Arrat A
	arrayB: .word 1, 2, 3, 4, 5 #Array B
 .text
	main:
  		li    $t0, 0  #setea a cero $t0 = i
  		li    $t7,12 #setea  12 a $t1 = C
  		sw    $t0, arrayA($0)   # Setea el primer terminio del Array a 0
  		
	loop:
   		lw    $t1, arrayB($t0)  # sacar el dato de array a multiplicar 
  		mul   $t5 ,$t1, $t7     #Multiplicaion de C por el elemento del arrayB
  		sw    $t5, arrayA($t0)  # ...y el resultado se almacena
  		addi  $t0, $t0, 4         # Mueve hacia el proximo elemento del array
  		blt   $t0, 20, loop      # si no pasa el numero de elemento del array repite 
  		b   loop2             #Salto incondicional
  	loop2:
  		sub   $t0, $t0, 4  	#Mueve hacia el anterior elemento del array
  		lw    $t1, arrayA($t0)  # sacar el dato de array a multiplicar 
  		mulo   $t5 ,$t1, 2     #Multiplicaion de elemento del arrayA por el elemento del arrayA
  		sw    $t5, arrayA($t0)  # ...y el resultado se almacena   
  		bgt   $t0, 0, loop2      # si no pasa el numero de elemento del array repite
  		jr    $ra  		# Salto incondicional 
