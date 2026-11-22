-- File: script501
-- Desc: Las consultas sencillas en SQL (DML-II)
-- Date: 2023.02.10
-- Tbls: DEPARTAMENTOS, EMPLEADOS, CLIENTES, PRODUCTOS Y PEDIDOS

--1) Obtener, para aquellos clientes cuyo longitud del campo NOMBRE sea superior a 10 caracteres, 
--   una cadena de caracteres con el siguiente formato: <<LOCALIDAD>>-<<NOMBRE>>, ordenado por LOCALIDAD.
select concat(localidad, ' - ', nombre) as formato 
    from clientes where length(nombre) > 10 
    order by localidad;

--2) Escribir los apellidos de los empleados junto con sus fechas de alta en formato <<numero del día>> 
--   de <<nombre del mes >> de <<año con 4 dígitos>>. 
SELECT apellido, 
CONCAT(DAYOFMONTH(fecha_alta),' de ', MONTHNAME(fecha_alta),' de ', YEAR(fecha_alta)) "ALTA" 
FROM empleados;

--3) Calcular cuál será el SUELDO de cada empleado sumando su SALARIO, su COMISION 
-- y el resultado de multiplicar los trienios que lleva en la empresa por 50 euros cada uno.
select apellido,
    salario+IFNULL(comision,0) mensual,
    TRUNCATE((DATEDIFF(CURDATE(),fecha_alta)/365/3),0)*50 trienios,
    salario+IFNULL(comision,0) +
    TRUNCATE((DATEDIFF(CURDATE(),fecha_alta)/365/3),0)*50 total
from empleados;

--4) Recuperar los datos del pedido más reciente.
select * from pedidos order by fecha_pedido desc limit 1;

--5) Calcular cuáles serían los nuevos PRECIOS de los productos cuyo STOCK_EXISTENTE es mayor o igual a 25 si 
--   aplicásemos una rebaja del 10% para estimular las ventas.
select descripcion, 0.9*precio_actual nuevo
from productos where stock_disponible > 25;
