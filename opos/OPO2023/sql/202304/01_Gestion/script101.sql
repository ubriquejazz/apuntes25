-- File: script101
-- Desc: El lenguaje de gestión de bases de datos
-- Date: 2023.02.08
-- Tbls: DEPARTAMENTOS, EMPLEADOS, CLIENTES, PRODUCTOS Y PEDIDOS

-- 1) Encontrar el nombre y la localidad del departamento cuyo número de departamento es 30.
select dnombre, localidad from departamentos where dep_no = 30;

-- 2) Indicar el salario correspondiente al empleado con apellido ALONSO
select salario from empleados where apellido = 'ALONSO'; -- 1400

-- 3) Hallar el oficio del empleado con EMP_NO igual a 7521
select oficio from empleados where emp_no = 7521; -- EMPLEADO

-- 4) Recuperar el apellido del DIRECTOR del empleado GIL
select director from empleados where apellido = 'GIL'; -- 7782
select apellido from empleados where emp_no = 7782; -- MARTINEZ

-- 5) ¿Qué empleados encontramos en el departamento de CONTABILIDAD?
select dep_no from departamentos where dnombre = CONTABILIDAD; -- 10
select emp_no, apellido, oficio from empleados where dep_no = 10;

-- 6) El límite del crédito (LIMITE_CREDITO) para la empresa LOGITRONICA S.L. 
select LIMITE_CREDITO from clientes where NOMBRE = "LOGITRONICA S.L"; -- 5000

-- 7) Averiguar qué producto y qué cantidad del mismo se solicitó en el pedido con número 1015.
select producto_no, unidades from pedidos where pedido_no = 1015; -- 70
select descripcion from productos where producto_no = 70;

-- 8) Contar cuántos pedidos se han realizado del producto cuyo PRODUCTO_NO es 20
select count(*) from pedidos where producto_no = 20;