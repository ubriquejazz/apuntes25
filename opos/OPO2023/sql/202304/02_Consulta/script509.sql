-- File: script509
-- Desc: Las consultas sencillas en SQL (DML-II)
-- Date: 2023.02.24
-- Tbls: DEPARTAMENTOS, EMPLEADOS, CLIENTES, PRODUCTOS Y PEDIDOS

-- Select empleados clasificados por oficios y en orden descendente de salarios.
SELECT emp_no, apellido, oficio, salario FROM empleados ORDER BY oficio, salario DESC;

-- Select empleados junto con su salario anual (salario + comision en 14 pagas) 
-- ordenado de mayor a menor por este salario total.
SELECT apellido, (salario+IFNULL(comision,0))*14 "Anual"
FROM empleados ORDER BY Anual;

-- Select los departamentos diferentes que hay en la tabla empleados
SELECT DISTINCT dep_no FROM empleados;

-- Select los oficios que hay en cada departamento de la tabla empleados
SELECT DISTINCT oficio, dep_no FROM empleados;

-- Select el número de empleado, el apellido y el dpto de los empleados de la empresa.
SELECT emp_no "Nº", apellido "Apellido", dep_no "Dpto" FROM empleados;

-- Condiciones de selección
-- ------------------------

-- Select empleados cuyo apellido empiece por 'M' y tengan un salario entre 1000 y 200 euros.
SELECT * FROM empleados WHERE apellido LIKE 'M%' AND salario BETWEEN 1000 AND 2000;

-- Select empleados cuyo apellido incluya una ‘A’ en el segundo carácter.
SELECT emp_no, apellido, dep_no FROM empleados WHERE (apellido LIKE '_A%') ORDER BY 1;

-- Select empleados existentes en los departamentos 10 y 30. WHERE dep_no IN(10,30);
SELECT emp_no, apellido, dep_no FROM empleados WHERE dep_no=10 OR dep_no=30;

-- Select empleados que tienen de oficio ANALISTA
SELECT emp_no, apellido, oficio FROM empleados WHERE oficio = 'ANALISTA';

-- Funciones numericas
-- -------------------

-- Visualizar los salarios de los empleados redondeados sin decimales
SELECT apellido, ROUND(salario,0) FROM empleados;

-- Mostrar los datos de los empleados en los que su comisión se múltiplo de 100
SELECT * FROM empleados WHERE MOD(comision,100)=0 AND comision!=0;

-- Funciones de caracteres
-- -----------------------

-- Select tres primeros caracteres de los apellidos de los empleados seguidos de un punto
SELECT SUBSTR(apellido,1,3) FROM empleados;
SELECT CONCAT(SUBSTR(apellido,1,3),'.') "INICIALES" FROM empleados;

-- Select los departamentos cuyo nombre tenga de más de 6 caracteres  
-- reemplazando las letras ‘A’ por ‘*’ 
SELECT REPLACE(dnombre,'A','*') FROM departamentos WHERE LENGTH(dnombre)>6;

-- Funciones de fechas
-- -------------------

-- Visualizar la fecha que será dentro de una semana
SELECT DAYNAME(CURDATE()) "HOY", ADDDATE(CURDATE(),7) "DENTRO DE UNA SEMANA";
SELECT DAYOFMONTH(CURDATE()) "HOY";

-- Alta de los empleados con el formato <día semana> - <dia> de <mes> de <año>
SELECT apellido, 
CONCAT(DAYNAME(fecha_alta),' - ', MONTH(fecha_alta),' de ', YEAR(fecha_alta)) "ALTA" 
FROM empleados;

-- Mostrar los datos de los empleados que entraron en la empresa en lunes
SELECT * FROM empleados WHERE DAYOFWEEK(fecha_alta)=2;

-- Mostrar para cada empleado su apellido junto con el número de anios
SELECT APELLIDO, TRUNCATE(DATEDIFF(CURDATE(),fecha_alta)/365,0) "YEARS" FROM empleados;

-- Mostrar para cada empleado su apellido junto con el número de trienos
SELECT APELLIDO, TRUNCATE((DATEDIFF(CURDATE(),fecha_alta)/365/3),0) "TRIENIOS" FROM empleados;

-- Mostrar los empleados que llevan más de 41 años en la empresa.
SELECT * FROM empleados 
WHERE TRUNCATE(DATEDIFF(CURDATE(),fecha_alta)/365,0) > 41;

-- Visualizar la fecha de 4/10/1997 con el formato ...
SELECT DATE_FORMAT('1997-10-04','%W, %e de %M de %Y') "ALTA";

-- Funciones de comparación
-- ------------------------

-- Visualizar para cada empleado el valor que sea mayor entre su salario y su comisión
select emp_no, salario + ifnull(comision, 0) as total from empleados; 

SELECT apellido, salario, comision, 
GREATEST(salario, ifnull(comision, 0)) "MAX" FROM empleados ORDER BY 4;

-- empleados en los que la suma de su salario más su comisión es menor de 2.000 euros 
SELECT apellido, salario, ifnull(comision, 0) "com" FROM empleados WHERE salario+ ifnull(comision,0)<2000;
