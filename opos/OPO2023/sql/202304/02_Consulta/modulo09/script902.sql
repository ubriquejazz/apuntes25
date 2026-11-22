-- File: script902
-- Desc: Consultas dentro de otras instrucciones
-- Date: 2023.03.06
-- Tbls: DEPARTAMENTOS, EMPLEADOS, CLIENTES, PRODUCTOS Y PEDIDOS

-- Crear una tabla VENTAS_EMPLEADO que nos muestre, para todos los empleados 
-- pertenecientes al departamento de VENTAS todos los datos del empleado más 
-- los pedidos que tiene, en una nueva columna de nombre VENTAS_ACUM.

CREATE TABLE VENTAS_EMPLEADO

2.- Actualizar el campo LIMITE_CREDITO de la tabla CLIENTES con el resultado de restar a 3000 euros la suma de los importes de los diferentes pedidos que tiene el cliente en cuestión, calculados multiplicando las UNIDADES por el PRECIO_ACTUAL de cada producto.
 

3.- Crear una vista STOCK_REAL que nos muestre, para cada producto el stock que nos queda si restamos al STOCK_DISPONIBLE las unidades que tenemos consignadas en los diferentes pedidos.
 

4.- Modificar el OFICIO de los empleados que dependen del PRESIDENTE para que tenga el nuevo valor de GERENTE.
 

5.- Crear una vista PEDIDOS_CLI con los campos de la tabla PEDIDOS más dos campos más de la tabla CLIENTES, NOM_CLI con el nombre del cliente y otro LIMITE_CREDITO. Incluir un nuevo campo con el importe de cada pedido. Listar la vista ordenando por clientes.
 

6.- Crear una tabla con todos los clientes y sus pedidos, incluyendo aquellos clientes que no hayan realizado ningún pedido.
 
