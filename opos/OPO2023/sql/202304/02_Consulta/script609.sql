-- File: script601
-- Desc: Consultas con agrupamientos y funciones de grupo
-- Date: 2023.02.08
-- Tbls: DEPARTAMENTOS, EMPLEADOS, CLIENTES, PRODUCTOS Y PEDIDOS


-- cláusula HAVING
-- ---------------

SELECT oficio, count(*) FROM empleados GROUP BY oficio;

-- los oficios que tengan dos o más empleados:
SELECT oficio, salario, count(*) FROM empleados
GROUP BY oficio HAVING count(*)>= 2;

-- los oficios que tengan dos o más empleados, cuyo salario supere los 1400 euros.
SELECT oficio, salario, count(*) FROM empleados 
WHERE salario > 1400
GROUP BY oficio HAVING count(*) >= 2;

-- cláusulas ORDER BY y LIMIT
-- --------------------------
SELECT dep_no, AVG(salario) FROM empleados GROUP BY dep_no;
SELECT dep_no, count(*) FROM empleados GROUP BY dep_no;

-- Seleccionar los datos del departamento con menor salario medio
SELECT dep_no, AVG(salario) FROM empleados
GROUP BY dep_no ORDER BY 2 LIMIT 1;

-- Seleccionar los datos del departamento con mayor número de empleados.
SELECT dep_no, count(*) FROM empleados
GROUP BY dep_no ORDER BY 2 DESC LIMIT 1;

SELECT SUM(salario) FROM empleados;
SELECT AVG(salario) FROM empleados;

-- Obtener los salarios máximo, mínimo y la diferencia existente entre ambos.
SELECT MAX(salario) "Salario mas alto", MIN(salario) "Salario mas bajo",
 MAX(salario)- MIN(salario) "Diferencia" FROM empleados;

-- Obtener la fecha de alta más reciente.
SELECT MAX(fecha_alta) "Fecha alta" FROM empleados;

-- Ojo con valores nulos de comision!
SELECT AVG(comision) FROM empleados;
SELECT SUM(comision)/count(*) FROM empleados;
SELECT SUM(comision)/count(comision) FROM empleados;

-- Calcular el salario medio de los empleados que sean ANALISTAS
SELECT AVG(salario) "Salario medio" FROM empleados WHERE oficio = 'ANALISTA';