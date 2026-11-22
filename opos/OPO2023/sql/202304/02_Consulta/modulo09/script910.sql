-- File: script910
-- Desc: VISTAS
-- Date: 2023.03.05
-- Tbls: DEPARTAMENTOS, EMPLEADOS, CLIENTES, PRODUCTOS Y PEDIDOS

-- Vista para la gestión de los empleados del departamento 30 
CREATE VIEW emple_dep30 AS SELECT * FROM EMPLEADOS WHERE DEP_NO = 30;
CREATE VIEW emple_dep10 AS SELECT * FROM EMPLEADOS WHERE DEP_NO = 10;

-- Vista que contiene todos los empleados ocultando la información confidencial.
CREATE VIEW datos_emple AS
SELECT emp_no, apellido, oficio, director, fecha_alta, dep_no
FROM empleados;

-- El siguiente ejemplo crea la vista datos_vendedores que muestra solamente las 
-- columnas emp_no, apellido, ... de aquellos empleados cuyo oficio es VENDEDOR.
CREATE VIEW datos_vendedores
    (num_vendedor, apellido, director, fecha_alta, dep_no) AS
    SELECT emp_no, apellido, director, fecha_alta, dep_no
    FROM empleados WHERE oficio = 'VENDEDOR';

-- También se pueden crear vistas a partir de consultas que incluyen agrupaciones:
CREATE VIEW resumen_dep1
    (dep_no, num_empleados, suma_salario, suma_comision) AS
    SELECT dep_no, COUNT(emp_no), SUM(salario), SUM(IFNULL(comision,0))
    FROM empleados GROUP BY dep_no;

SELECT * FROM resumen_dep1;

-- Creamos la vista resumen_dep2 con dos totales resultado e aplicar funciones de grupo
CREATE VIEW resumen_dep2 AS
SELECT dep_no, COUNT(emp_no) num_empleados, SUM(salario) suma
FROM empleados GROUP BY dep_no;

-- también podemos obtener el departamento el que pertenece este salario máximo
SELECT MAX(suma) FROM resumen_dep2; -- 9800
SELECT dep_no, dnombre FROM departamentos
WHERE dep_no = ( SELECT dep_no FROM resumen_dep2
                 WHERE suma = 9800.5);

-- vista q permite trabajar con datos de dos tablas, agrupados y seleccionando las filas 
-- que interesan (en este caso todos los departamentos que tengan más de dos empleados):

SELECT dnombre, COUNT(emp_no), SUM(salario)
FROM empleados, departamentos
WHERE empleados.dep_no = departamentos.dep_no
GROUP BY empleados.dep_no, dnombre;

CREATE VIEW resumen_emp_dep (departamento, num_empleados, suma_salario) AS
    SELECT dnombre, COUNT(emp_no), SUM(salario)
    FROM empleados, departamentos
    WHERE empleados.dep_no = departamentos.dep_no
    GROUP BY empleados.dep_no, dnombre
    HAVING COUNT(*) > 2;

SELECT departamento, num_empleados FROM resumen_emp_dep;

-- Eliminar vistas
DROP VIEW IF EXISTS datos_emple; 
Query OK, 0 rows affected (0.00 sec)

SELECT * FROM datos_emple_10; 
ERROR 1356 (HY000): View table(s) or column(s)