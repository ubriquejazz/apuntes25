-- File: script701
-- Desc: Subconsultas que devuelven una sola expresión
-- Date: 2023.02.28
-- Tbls: DEPARTAMENTOS, EMPLEADOS, CLIENTES, PRODUCTOS Y PEDIDOS

-- Empleados que cobran por encima de la media
(SELECT AVG(salario) FROM empleados);

SELECT dep_no, apellido, salario FROM empleados
WHERE salario > (SELECT AVG(salario) FROM empleados);

-- solo una expresion
SELECT dep_no FROM empleados WHERE apellido = 'GARRIDO';

SELECT dnombre FROM departamentos
WHERE dep_no = (SELECT dep_no FROM empleados WHERE apellido = 'GARRIDO');

-- mas de una una expresion
(SELECT dep_no, oficio FROM empleados WHERE apellido='ALONSO');

SELECT emp_no, apellido, oficio, dep_no FROM empleados
WHERE (dep_no, oficio) = (SELECT dep_no, oficio FROM empleados WHERE apellido='ALONSO');

-- Con operadores de comparación
-- -----------------------------

-- todos los empleados que tienen el mismo oficio que GARRIDO
(SELECT oficio FROM empleados WHERE apellido='GARRIDO'); -- 'DIRECTOR';

SELECT emp_no, apellido, oficio FROM empleados WHERE oficio = 'DIRECTOR';

-- info de los empleados que ganan más que cualquier empleado del departamento 30.
(SELECT MAX(salario) FROM empleados WHERE dep_no=30); -- 3850

SELECT emp_no, apellido, salario, dep_no 
FROM empleados WHERE salario > 3850.12;

-- número de VENDEDORES del departamento VENTAS.
SELECT COUNT(*) "Total" FROM empleados
WHERE oficio = 'VENDEDOR' AND dep_no = 30;
-- GROUP BY oficio;

-- suma de salarios para cada oficio de los empleados del departamento VENTAS.
(SELECT dep_no FROM departamentos WHERE dnombre='VENTAS'); -- 30

SELECT oficio, sum(salario) FROM empleados
WHERE dep_no = 30 GROUP BY oficio;

-- Con operador IN
-- ---------------

-- Listar empleados que no trabajen ni en Madrid ni en Barcelona.
(SELECT dep_no FROM departamentos
WHERE localidad NOT LIKE 'MADRID' AND localidad NOT LIKE 'BARCELONA');

SELECT * FROM empleados WHERE dep_no IN (20, 40);

(SELECT dep_no FROM departamentos
WHERE localidad LIKE 'MADRID' OR localidad LIKE 'BARCELONA');

SELECT * FROM empleados WHERE dep_no NOT IN (10, 30);

-- Listar nombre dptos que tengan algún empleado con fecha de alta anterior a 1982.
(SELECT DISTINCT(dep_no) FROM empleados WHERE fecha_alta < '1982-01-01');

SELECT dep_no "NºDepartamento", dnombre "Departamento"
FROM departamentos WHERE dep_no IN (10, 30);

-- Listar nombre dptos siempre que haya más de 2 empleados trabajando en ellos.
SELECT dep_no, count(*) FROM empleados GROUP BY dep_no;
SELECT dep_no, count(*) total FROM empleados GROUP BY dep_no HAVING total>2;
( SELECT dep_no FROM empleados GROUP BY dep_no HAVING count(*)>2 );

SELECT dep_no, dnombre "Departamento" 
FROM departamentos WHERE dep_no IN (10, 30);

-- Con operador ANY/ALL
-- --------------------

-- nombres de los departamentos que tengan empleados trabajando en ellos
(SELECT dep_no FROM empleados);

SELECT dep_no, dnombre FROM departamentos
WHERE dep_no = ANY (SELECT dep_no FROM empleados);

-- Listar dptos en los que al menos exista un empleado con comisión nula.
(SELECT DISTINCT dep_no FROM empleados WHERE comision IS NULL);

SELECT dep_no, dnombre Departamento FROM departamentos
WHERE dep_no = ANY (SELECT DISTINCT dep_no FROM empleados WHERE comision IS NULL);

-- Listar los empleados con mayor salario que todos los del departamento 20
(SELECT salario FROM empleados WHERE dep_no = 20);

SELECT dep_no, apellido, salario FROM empleados
WHERE salario > ALL (SELECT salario FROM empleados WHERE dep_no = 20);

-- Listar los departamentos que no tienen empleados
(SELECT DISTINCT(dep_no) FROM empleados);

SELECT dep_no, dnombre "Departamento" FROM departamentos
WHERE dep_no != ALL (SELECT DISTINCT(dep_no) FROM empleados);

-- Con operador EXISTS
-- -------------------

-- Listar los departamentos en los que hay más de un trabajador
SELECT dep_no, dnombre FROM departamentos d
WHERE EXISTS ( SELECT *
    FROM empleados e WHERE e.dep_no = d.dep_no
    GROUP BY dep_no HAVING count(*) > 1);

-- Localidad donde existan dptos con empleados cuya comisión supere el 10% del salario.
(SELECT dep_no FROM empleados WHERE comision > 10*salario/100); -- 30, 30
SELECT localidad FROM departamentos WHERE dep_no IN (30, 30);

SELECT localidad FROM departamentos d
WHERE EXISTS (SELECT *
    FROM empleados e WHERE e.dep_no = d.dep_no 
        AND comision>10*salario/100);

-- Con subconsulta: Obtener apellido y oficio de los empleados que tienen 
-- el mismo oficio y mismo número de departamento que el de INVESTIGACIÓN.
SELECT dep_no FROM departamentos WHERE dnombre='INVESTIGACION'; -- 20
SELECT oficio FROM empleados WHERE dep_no = 20; -- Analista, Empleado

SELECT apellido, oficio FROM empleados
WHERE oficio IN (SELECT oficio FROM empleados WHERE dep_no = 20);