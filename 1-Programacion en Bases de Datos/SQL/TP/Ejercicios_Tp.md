# Programación en Bases de Datos

## Equipo 1


1.	Crear un trigger para ejecutarse cuando se inserte un registros del dataset de muestra, se identifique cada uno de los campos  

2.  Dada una estructura relacional conteniendo transacciones y accciones que contienen, crear el algoritmo en un stored procedure para transformar el formato a una estructura apropiada para realizar un "Market basket analysis" 

** Estructura relacional
    
	Transacciones	Acciones
	-------------	-------
	trans1 			acc1 
    trans2 			acc1
    trans3 			acc2
    trans1 			acc2
    trans3 			acc3

** Estructura para MArket Basket Analysis

  "acc1, acc2", 
  "acc2", 
  "acc2, acc3"
 
