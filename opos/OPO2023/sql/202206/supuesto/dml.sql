-- PES 2006 (supuesto 3) 
-- Date: 202206 (sesion 22)
-- Autor: Juan Gago
-- File: 


-- 1. 
Empleado (CodE, Dpto, Salario, Comison, NumHijos, )

Departamento (CodD, Nombre, Dpto_Jefe)

-- 2.

-- 3. 
SELECT D.Dpto_Jefe, COUNT(*), E.Nombre
FROM Departamento D, Departamento E
WHERE D.Dpto_Jefe <> NULL AND D.Dpto_Jefe = E.CodD
GROUP BY D.Dpto_Jefe
HAVING COUNT(*) >= 2;

-- 4. 
SELECT E1.Nombre, E1.NumHijos
FROM Empleado E1, Empleado E2
WHERE E1.Dpto = E2.Dpto AND E1.Salario = E2.Salario AND E1.CodE <> E2.CodE;

-- 5.  con empleados 1400 euros
SELECT Dpto
FROM Empleado
WHERE Salario > 1400
GROUP BY Dpto
HAVING COUNT(CodE) > 1

SELECT D.Nombre, COUNT(E.CodE), SUM(E.Salario), SUM(E.Comison)
FROM Departamento D JOIN Empleado E ON D.CodD = E.Dpto
WHERE D.CodD IN (..)
GROUP BY D.Nombre;

