-- 

-- Consulta 1: De la tabla EMPLEADO, el código, nombre y salario de los
-- empleados ordenados por nombre ascendentemente y por salario de manera descendente.
SELECT * FROM empleado
ORDER BY nombre ASC, salario DESC;

-- Consulta 2: Todos los nombres de departamentos menos los de 'Sevilla' o 'Granada'.
SELECT nombre, ciudad FROM departamento
WHERE ciudad NOT IN ('Sevilla', 'Granada');

-- Consulta 3: Número de empleados con departamento asignado.
SELECT e.cdemp, d.nombre
FROM empleado e LEFT JOIN departamento d ON e.cddep = d.cddep;

-- Consulta 4: Media de horas trabajadas en proyectos de la tabla trabaja.
SELECT AVG(nhoras) FROM trabaja;

-- Consulta 5: Total de empleados de cada departamento que ganan un
-- salario superior a 1500€, pero que sólo se mostraran los departamentos
-- con más de 2 empleados con salario superior a 1500€.
SELECT cddep FROM empleado 
GROUP BY cddep
HAVING count(*) > 2; -- cddep = ('01','02')

SELECT cdemp, salario, cddep 
FROM empleado 
WHERE salario > 1500 AND cddep IN ('01','02');

-- Consulta 6: Nombre de cada empleado de la base de datos junto al nombre de su jefe.
SELECT e1.nombre trabajador, e2.nombre jefe
FROM empleado e1 JOIN empleado e2 ON e1.cdjefe = e2.cdemp
ORDER BY e1.nombre;

-- Consulta 7: Nombre del departamento con más empleados.
SELECT d.cddep, count(e.cdemp) empleados
FROM empleado e JOIN departamento d ON e.cddep = d.cddep
GROUP BY d.cddep
ORDER BY count(e.cdemp) DESC LIMIT 1;

SELECT d.nombre
FROM empleado e JOIN departamento d ON e.cddep = d.cddep
GROUP BY d.cddep
HAVING count(e.cdemp) = 4;

SELECT d.nombre
FROM empleado e JOIN departamento d ON e.cddep = d.cddep
GROUP BY d.cddep
HAVING count(e.cdemp) = (SELECT count(e.cdemp) FROM
    empleado e JOIN departamento d ON e.cddep = d.cddep
    GROUP BY d.cddep
    ORDER BY count(e.cdemp) DESC LIMIT 1
    );

-- Consulta 8: Empleado que más horas ha trabajado en cada proyecto.
SELECT e.nombre, sum(nhoras)
FROM empleado e JOIN trabaja j ON e.cdemp = j.cdemp
GROUP BY e.cdemp
ORDER BY sum(nhoras) DESC
LIMIT 1;

-- Consulta 9: Nombre de los departamentos que NO tienen empleados 
-- que ingresaron antes de 1999.
SELECT fecha_ingreso, cddep
FROM empleado 
WHERE fecha_ingreso > '1999-01-01'; -- 05, NULL

SELECT nombre
FROM departamento 
WHERE cddep IN ('05', NULL);

-- Consulta 10: Datos de los empleados cuyo nombre comienza por “A”.
SELECT * FROM empleado
WHERE nombre LIKE 'A%' OR nombre LIKE 'a%';