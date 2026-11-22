-- File: script909
-- Desc: Consultas dentro de otras instrucciones
-- Date: 2023.03.05
-- Tbls: DEPARTAMENTOS, EMPLEADOS, CLIENTES, PRODUCTOS Y PEDIDOS

-- Crear una tabla de vendedores seleccionando éstos de la tabla de empleados.
CREATE TABLE vendedores SELECT * FROM empleados WHERE oficio = 'VENDEDOR';

-- Crear una nueva tabla sólo con los nombres y números de los departamentos 
-- a partir de la tabla ya creada con los mismos.
CREATE TABLE nombres_dep (depart_no INT(4), nombre VARCHAR(10))
-> SELECT dep_no, dnombre FROM departamentos;

-- Inserciones con subconsultas
CREATE TABLE n2dept (
    DEP_NO INT(2),
    NOMBRE VARCHAR(14),
    CONSTRAINT PK_DEPARTAMENTOS_DEP_NO PRIMARY KEY (DEP_NO)
);

INSERT INTO n2dept
SELECT dep_no, dnombre FROM departamentos WHERE LENGTH(dnombre)> 8;

-- Modificacion del salario de todos los empleados cuyo departamento no esté en MADRID
SELECT dep_no FROM departamentos WHERE localidad <> 'MADRID'; -- 10, 20, 40

UPDATE empleados SET salario = salario + 500
WHERE dep_no NOT IN (10, 20, 40);

-- Eliminacion departamentos con ningun empleado
DELETE FROM departamentos 
-> WHERE dep_no NOT IN (SELECT DISTINCT dep_no FROM empleados);

-- Eliminar los departamentos que tienen menos de tres empleados
SELECT dep_no, count(*) FROM empleados GROUP BY dep_no;
(SELECT dep_no FROM empleados GROUP BY dep_no HAVING count(*) < 3);
DELETE FROM departamentos2 WHERE dep_no IN (20);

-- los dptos que no tengan ningún empleado no se borrarán. Para evitar esto 
-- podemos cambiar la condición indicando que se borren aquellos dptos que no están 
-- en la lista de departamentos con tres o más empleados.
SELECT dep_no FROM empleados GROUP BY dep_no HAVING count(*) >= 3;
DELETE FROM departamentos2 WHERE dep_no NOT IN (10, 30);

-- la tabla destino no puede aparecer en la cláusula FROM de ninguna de la subconsulta
-- Si se permiten referencias externas, como en el siguiente ejemplo:
SELECT * FROM empleados WHERE empleados.dep_no = departamentos.dep_no; -- ref. externa
DELETE FROM departamentos
-> WHERE NOT EXISTS (SELECT *
-> FROM empleados
-> WHERE empleados.dep_no=departamentos.dep_no);