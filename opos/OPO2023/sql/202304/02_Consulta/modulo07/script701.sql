-- File: script701
-- Desc: Subconsultas
-- Date: 2023.02.08
-- Tbls: DEPARTAMENTOS, EMPLEADOS, CLIENTES, PRODUCTOS Y PEDIDOS

-- Recuperar los empleados que tengan algún cliente a su cargo.
SELECT vendedor_no, count(*) FROM clientes GROUP BY 1;

SELECT emp_no, apellido, oficio FROM empleados
WHERE emp_no IN (SELECT vendedor_no FROM clientes GROUP BY vendedor_no);

-- Obtener los clientes que son atendidos por el empleado que lleva más tiempo contratado en la empresa.
SELECT emp_no FROM empleados ORDER BY fecha_alta LIMIT 1; -- 7499

SELECT nombre FROM clientes 
WHERE vendedor_no = (SELECT emp_no FROM empleados ORDER BY fecha_alta LIMIT 1);

-- Recuperar los clientes que tengan algún pedido de 3 unidades.
select cliente_no, count(*) from pedidos where unidades = 3 group by cliente_no;

SELECT nombre, cliente_no FROM clientes 
WHERE cliente_no IN (SELECT cliente_no FROM pedidos WHERE unidades = 3);

-- Info de los productos cuya media de unidades pedidas sea superior a
-- la media de unidades pedidas en todos los pedidos.
SELECT AVG(unidades) FROM pedidos; -- 3.53

SELECT * FROM productos WHERE producto_no IN
(SELECT DISTINCT(producto_no) FROM pedidos WHERE unidades > (SELECT AVG(unidades) FROM pedidos));

SELECT * FROM productos WHERE producto_no IN
(select producto_no from pedidos
 group by producto_no
 having avg(unidades) > (select avg(unidades) from pedidos));

-- Obtener los empleados cuyo sueldo(SALARIO+COMISION) sea superior a la media de su oficio.
SELECT oficio, AVG(salario + ifnull(comision,0)) total FROM empleados GROUP BY oficio;

SELECT dep_no, apellido, oficio, salario FROM empleados e
WHERE salario >= (SELECT AVG(salario + ifnull(comision,0)) 
FROM empleados i WHERE i.oficio = e.oficio);

-- Obtener los datos de los clientes que tienen como vendedor a ALONSO 
(SELECT emp_no FROM empleados WHERE apellido = 'ALONSO' LIMIT 1);

SELECT nombre, localidad FROM clientes WHERE vendedor_no IN
(SELECT emp_no FROM empleados WHERE apellido = 'ALONSO');