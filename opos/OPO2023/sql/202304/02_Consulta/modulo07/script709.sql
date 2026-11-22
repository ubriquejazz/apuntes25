-- File: script701
-- Desc: Subconsultas que devuelven más de una expresión.
-- Date: 2023.03.02
-- Tbls: DEPARTAMENTOS, EMPLEADOS, CLIENTES, PRODUCTOS Y PEDIDOS

-- Empleados que pertenecen al mismo departamento y entraron el mismo día que GARRIDO
(SELECT dep_no, fecha_alta FROM empleados WHERE apellido='GARRIDO');
SELECT emp_no, apellido FROM empleados WHERE (dep_no,fecha_alta) = (30, '1981-05-01');

-- Empleado que pertenece al mismo departamento que JIMENEZ y tiene el máximo salario
(SELECT dep_no FROM empleados WHERE apellido='JIMENEZ'); -- 20
(SELECT MAX(salario) FROM empleados WHERE dep_no=20 GROUP BY dep_no); -- 3350
SELECT emp_no, apellido FROM empleados WHERE salario = 3350;

-- Listar el empleado que tiene el mayor salario de cada departamento
(SELECT dep_no, MAX(salario) FROM empleados GROUP BY dep_no);
SELECT dep_no, apellido FROM empleados
WHERE (dep_no, salario) IN (SELECT dep_no, MAX(salario) FROM empleados GROUP BY dep_no);

-- Empleados que tienen el mismo jefe y departamento que ALONSO excluido el mismo.
(SELECT director, dep_no FROM empleados WHERE apellido = 'ALONSO'); -- 7698, 30
SELECT emp_no, apellido, director, dep_no
FROM empleados WHERE (director, dep_no) = (7698, 30)
AND apellido != 'ALONSO';

-- Sub. en cláusula HAVING
-- -----------------------

-- Dptos en los que el salario medio de sus empleados sea 
-- mayor que la media de todos los salarios de la empresa.
(SELECT AVG(salario) FROM empleados); -- 2566.7

SELECT dep_no, AVG(salario) "media" FROM empleados 
GROUP BY dep_no HAVING AVG(salario) > 2566.7;

-- Dptos que tengan mayor media salarial total (salario + comision) que 
-- la mitad de la media salarial total de la empresa.
(SELECT AVG(salario+IFNULL(comision,0))/2 FROM empleados); -- 1394.48

SELECT dep_no, AVG(salario+IFNULL(comision,0)) "media" FROM empleados
GROUP BY dep_no HAVING AVG(salario+IFNULL(comision,0)) > 1394.48;

-- Dpto con menos presupuesto asignado para pagar el salario de sus empleados
SELECT dep_no, SUM(salario) FROM empleados GROUP BY dep_no;
(SELECT SUM(salario) FROM empleados GROUP BY dep_no ORDER BY 1 LIMIT 1);

SELECT dep_no , SUM(salario) "lowest" 
FROM empleados
GROUP BY dep_no HAVING SUM(salario) = 4750;
