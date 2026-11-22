-- File: script601
-- Desc: Consultas con agrupamientos y funciones de grupo
-- Date: 2023.02.08
-- Tbls: DEPARTAMENTOS, EMPLEADOS, CLIENTES, PRODUCTOS Y PEDIDOS

-- Recuperar para cada departamento el salario mínimo y máximo que se cobra en él.
select dep_no, min(salario), max(salario) from empleados group by dep_no;

-- Obtener para cada departamento 
-- cuantos vendedores tiene y cuál es su salario medio sin incluir comisión. 
select * from empleados where oficio = 'VENDEDOR';

SELECT dep_no, AVG(salario) "Salario medio"
FROM empleados WHERE oficio = 'VENDEDOR' GROUP BY dep_no;

-- Obtener para cada cliente el número de pedidos que tiene. 
SELECT cliente_no, count(*) FROM pedidos GROUP BY cliente_no;

-- total de unidades por producto que hay entre todos los pedidos, 
-- indicando el número de producto y la suma de sus unidades.
SELECT producto_no, sum(unidades) FROM pedidos
GROUP BY producto_no;

-- Hallar para cada oficio el número de empleados que lo desempeña
SELECT oficio, count(*) "empleados"
FROM empleados GROUP BY oficio;

-- cuantos valores diferentes en la columna 
SELECT DISTINCT(oficio) FROM empleados; 
SELECT COUNT(DISTINCT(oficio)) FROM empleados; 