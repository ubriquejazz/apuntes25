-- File: script801
-- Desc: Consultas multitabla: composicion natural,
--       composicion de una tabla consigo misma (INNER)
-- Date: 2023.02.08
-- Tbls: DEPARTAMENTOS, EMPLEADOS, CLIENTES, PRODUCTOS Y PEDIDOS

-- COMPOSICION NATURAL (basada en igualdad) 
-- la condición de selección se establece con el operador =
SELECT emp_no, apellido, dnombre dpto, localidad 
FROM empleados, departamentos
WHERE empleados.dep_no = departamentos.dep_no;

-- departamentos existentes en la tabla de empleados (unicamente)
SELECT DISTINCT d.dep_no, d.dnombre
FROM empleados e, departamentos d
WHERE e.dep_no = d.dep_no;

-- datos relativos a empleados: número, apellido, nombre de departamento y localidad.
SELECT emp_no, apellido, dnombre, localidad
FROM empleados e, departamentos d
WHERE e.dep_no = d.dep_no;

-- COMPOSICION NATURAL (basada en desigualdad) 
-- listar los empleados de los departamentos diferentes al de VENTAS.
SELECT dep_no FROM departamentos WHERE dnombre = 'VENTAS'; -- 30

SELECT emp_no, apellido, e.dep_no
FROM empleados e, departamentos d
WHERE d.dnombre = 'VENTAS' AND e.dep_no != d.dep_no;

-- empleados de dptos con códigos mayores que el código del dpto de contabilidad.
SELECT dep_no FROM departamentos WHERE dnombre = 'CONTABILIDAD'; -- 10

SELECT emp_no, apellido, e.dep_no
FROM empleados e, departamentos d
WHERE d.dnombre = 'CONTABILIDAD' AND e.dep_no > d.dep_no;

-- empleados de departamentos con códigos mayores que el código del dpto de BCN
SELECT dep_no FROM departamentos WHERE localidad = 'BARCELONA'; -- 10

SELECT emp_no, apellido, e.dep_no
FROM empleados e, departamentos d
WHERE d.localidad = 'BARCELONA' AND e.dep_no > d.dep_no;

-- Composicion de una tabla consigo misma 
-----------------------------------------

-- lista de los empleados con los nombres de sus directores.
SELECT e1.emp_no, e1.apellido, e1.director, e2.apellido 
FROM empleados e1, empleados e2 WHERE e1.director = e2.emp_no;

-- jefes de los empleados cuyo oficio sea el de VENDEDOR.
SELECT emp_no FROM empleados WHERE oficio = 'VENDEDOR';

SELECT e1.emp_no, e1.apellido, e1.oficio, e1.director, e2.apellido 
FROM empleados e1, empleados e2
WHERE e1.director = e2.emp_no AND e1.oficio = 'VENDEDOR';

-- empleados que no pertenecen al departamento de CONTABILIDAD
SELECT e.emp_no, e.apellido, d.dnombre 
FROM empleados e, departamentos d 
WHERE d.dnombre != 'CONTABILIDAD' AND e.dep_no = d.dep_no;