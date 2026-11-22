-- Obtener el nombre y apellido del padre y de la madre de “Pepe Pérez”.
SELECT nombre, apellidos
FROM PERSONA P, PADREMADRE PM
WHERE P.dni=PM.dniPadreMadre AND PM.dniHijo = (SELECT dni FROM PERSONA WHERE nombre='Pepe Pérez');

-- Obtener un listado con el nombre de las empresas y el total de los salarios de 
-- sus empleados ordenados de forma que las empresas que gasten mas se muestren al principio.
SELECT E.cif, E.nombre, SUM(P.salario)
FROM EMPRESAS E, PERSONA P
WHERE E.cif=P.empresa
GROUP BY E.cif
ORDER BY SUM(P.salario);

-- Subir el salario un 10% a todas las personas que trabajen en las empresas de Sevilla (Considere que en el campo dirección se encuentra entre otros datos la provincia).
UPDATE PERSONA SET salario = salario*1.1
WHERE empresa IN (SELECT cif FROM EMPRESAS WHERE direccion
LIKE '%ALMERÍA%');

-- Mostrar el nombre y apellido de las personas que cobran más que la media del salario de todas las personas recogidas en la base de datos.
SELECT nombre, apellidos
FROM PERSONA
WHERE salario > (SELECT AVG(salario) FROM PERSONA)