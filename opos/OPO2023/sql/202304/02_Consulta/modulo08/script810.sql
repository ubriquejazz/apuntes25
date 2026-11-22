-- File: script801
-- Desc: Consultas multitabla (OUTER)
-- Date: 2023.03.02
-- Tbls: DEPARTAMENTOS, EMPLEADOS, CLIENTES, PRODUCTOS Y PEDIDOS

SELECT dnombre, localidad, emp_no, apellido
FROM departamentos d, empleados e
WHERE e.dep_no=d.dep_no;

-- los dptos que no tengan empleados no aparecerán porque para ellos
-- no se cumplirá la igualdad empleados.dep_no = departamentos.dep_no
SELECT dnombre, localidad, emp_no, apellido
FROM departamentos d LEFT JOIN empleados e 
ON d.dep_no=e.dep_no;

-- consulta que muestre todas las filas, aunque algunas con falta de info
-- para conseguir este resultado se utiliza la composición externa (OUTER)
-- mismo resultado si cambiamos LEFT por RIGHT el orden de las tablas
SELECT dnombre, localidad, emp_no, apellido
FROM empleados e RIGHT JOIN departamentos d
ON d.dep_no=e.dep_no;

-- Ej01: dptos con su nombre y localidad y el número de empleados trabajando en ellos, 
-- incluyendo los que no tienen empleados.
SELECT dnombre, localidad, emp_no
FROM departamentos d LEFT JOIN empleados e
ON d.dep_no=e.dep_no;

SELECT dnombre, localidad, COUNT(emp_no)
FROM departamentos d LEFT JOIN empleados e
ON d.dep_no=e.dep_no GROUP BY dnombre, localidad;

-- Ej02: lista de empleados con los nombres de sus directores, 
-- incluyendo al PRESIDENTE. (Ejemplo en autocomposiciones) 
SELECT e1.apellido "Empleado", e2.apellido "Director"
FROM empleados e1 LEFT JOIN empleados e2
ON e1.director = e2.emp_no;
