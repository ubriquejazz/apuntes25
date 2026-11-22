-- File: script701
-- Desc: Subconsultas anidadas y correlacionadas
-- Date: 2023.03.02
-- Tbls: DEPARTAME

-- Visualizar el número y el nombre del dpto con más personal de oficio VENDEDOR.
SELECT dep_no, count(*) FROM empleados 
WHERE oficio = 'VENDEDOR' GROUP BY dep_no; -- 30, 3

SELECT count(*) FROM empleados WHERE oficio = 'VENDEDOR' 
GROUP BY dep_no ORDER BY 1 DESC LIMIT 1; -- 3

SELECT dep_no FROM empleados
WHERE oficio = 'VENDEDOR'
GROUP BY dep_no HAVING COUNT(*)=3; -- 30

SELECT dep_no, dnombre FROM departamentos
WHERE dep_no=30;

SELECT dep_no, dnombre FROM departamentos
WHERE dep_no = ( SELECT dep_no FROM empleados
            WHERE oficio = 'VENDEDOR'
            GROUP BY dep_no HAVING COUNT(*)=(SELECT count(*) FROM empleados 
                    WHERE oficio = 'VENDEDOR' GROUP BY dep_no ORDER BY 1 DESC LIMIT 1));

-- Info del departamento donde trabaja el empleado más antiguo con el mismo oficio que GIL
(SELECT oficio FROM empleados WHERE apellido='GIL'); -- ANALISTA, 1982-05-06 
(SELECT oficio, MIN(fecha_alta) FROM empleados WHERE oficio='ANALISTA');

SELECT dep_no FROM empleados
WHERE (oficio,fecha_alta)=(SELECT oficio, MIN(fecha_alta) FROM empleados WHERE oficio='ANALISTA');

SELECT dep_no, dnombre, localidad
FROM departamentos
WHERE dep_no = 20;

-- Listar empleados que ganan más que la media de su departamento.
SELECT dep_no, AVG(salario) FROM empleados GROUP BY dep_no;

SELECT dep_no, oficio, salario FROM empleados e1 
WHERE salario > (SELECT AVG(salario) FROM empleados WHERE dep_no = e1.dep_no);

-- Select número de dpto, el oficio y el salario de los empleados 
-- con mayor salario de cada departamento.
SELECT dep_no, MAX(salario) FROM empleados GROUP BY dep_no;

SELECT dep_no, oficio, salario FROM empleados e1
WHERE salario = (SELECT MAX(salario) FROM empleados WHERE dep_no=e1.dep_no);

-- Visualizar el empleado más antiguo de cada oficio 
SELECT oficio, MAX(fecha_alta) FROM empleados GROUP BY oficio;

SELECT oficio, emp_no, apellido, fecha_alta FROM empleados e1
WHERE fecha_alta = (SELECT MAX(fecha_alta) FROM empleados WHERE oficio=e1.oficio);

-- Visualizar los empleados que tienen el menor salario de cada departamento 
SELECT dep_no, MIN(salario) FROM empleados GROUP BY dep_no;

SELECT oficio, emp_no, apellido, salario FROM empleados e1
WHERE salario = (SELECT MIN(salario) FROM empleados WHERE dep_no=e1.dep_no);
