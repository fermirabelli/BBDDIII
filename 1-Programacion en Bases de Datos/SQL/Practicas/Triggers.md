# BBDDII

## Triggers 

1. Crear un trigger que solo permita actualizar el campo Department_id solo para un registro por inserte

2. Crear un trigger que solo permita que la actualizacion del campo salario de cada registro de la tabla employees este entre un 10% y un 80% del salario actualizacion

3. Crear un trigger que no permita borrar registros de la tabla employees, excepto que el usuario logueado que ejecuta el delete tenga por nombre "admin" ( ver funciones T-SQL de sistema para obtener este valor)

4. Crear un trigger que en caso de insertar un registro en la tabla employees que tenga el campo Department_id en NULL, utilizar para este campo el valor de Department_id de empleados con el mismo cargo que alfabeticamente este primero, en caso de que le campo de cargo ( JOB_ID ) sea tambien Null, asignar el valor de department_id mas frecuente entre todos los empleados.  

