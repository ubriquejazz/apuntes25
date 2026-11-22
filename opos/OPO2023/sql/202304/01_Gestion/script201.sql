-- File: script201
-- Desc: Elementos del lenguaje
-- Date: 2023.02.15
-- Tbls: DEPARTAMENTOS, EMPLEADOS, CLIENTES, PRODUCTOS Y PEDIDOS

-- 1)Reglas que debemos atender para la construcción de identificadores en SQL.
-- hasta 64 caracateres sin espacios, no esta permitido '/', '\' ni '.'

-- 2)Enumerar los tipos de datos que nos permiten almacenar valores de tipo fecha y hora.
--   DATE, TIME, DATETIME

-- 3)Atendiendo a los datos contenidos en la tabla EMPLEADOS, recuperar el APELLIDO del 
-- empleado que recuperamos cuando especificamos: 
select EMP_NO, APELLIDO from EMPLEADOS where DIRECTOR=7839 AND DEP_NO=10; -- MARTINEZ (7782)

-- 4)Analizando ahora la tabla PEDIDOS, indicar qué pedidos recuperaremos si indicamos :
select * from PEDIDOS WHERE UNIDADES=8 OR FECHA_PEDIDO='2000-01-07'; -- 1004, 1014

-- 5)Con la sentencia: SELECT ROUND(5.89875,2), ¿qué resultado obtendremos?
SELECT round(5.89875,2); -- 5.90

-- 6)¿Qué obtenemos con select upper('En un lugar de La Mancha...');?
select upper('En un lugar...'); -- 'EN UN LUGAR...'

-- 7)¿Cómo hallamos la longitud de la cadena 'Pepito Pérez'?
select length('Pepito Perez'); -- 27

-- 8) Número de días transcurridos entre el 1 de enero de 2000 y el 5 de enero de 2007?
select datediff ('2021-12-31', '2021-01-01');

-- 9)Explica las diferencias entre las funciones IFNULL y ISNULL.
-- ISNULL(exp)
select emp_no, salario from empleados where isnull(comision);    
-- IFNULL(exp1, exp2)
select emp_no, salario + ifnull(comision, 0) as total from empleados;   
