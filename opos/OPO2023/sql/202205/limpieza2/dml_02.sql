-- Empresa Limpieza 
-- Date: 202205 (sesion 19)
-- Autor: Juan Gago
-- File: 

use sqlinicial;

-- NUEVAS CONSULTAS:

-- 1) Nombre de clientes agrupados por actividad
SELECT Actividad_Cli, Nombre_Cli
FROM Clientes
GROUP BY Actividad_Cli;

-- 1bis) Cuántos clientes hay en cada actividad
SELECT Actividad_Cli, COUNT(NIF_Cli)
FROM Clientes
GROUP BY Actividad_Cli;


-- 2) Actividades que tienen más de 2 clientes
SELECT Actividad_Cli, count(NIF_Cli)
FROM Clientes
GROUP BY Actividad_Cli
HAVING count(NIF_Cli) > 2;

SELECT Actividad_Cli
FROM Clientes
GROUP BY Actividad_Cli
HAVING count(NIF_Cli) > 2;

-- 3) Clientes que acumulan más de 200 euros en facturas y los datos de estas
SELECT F.*
FROM Facturas F
GROUP BY NIF_Cli
HAVING SUM(Importe_F)>200;


-- 4) Consulta de actualización: Cambiar la actividad del cliente 'Francisco de Haro' a 'Educación'
UPDATE Clientes
SET Actividad_Cli = 'Educación'
WHERE Nombre_Cli = 'Francisco de Haro';

-- 5) Consulta de borrado: Eliminar a Francisco de Haro:
DELETE FROM Clientes WHERE Nombre_Cli='Francisco de Haro';

-- 6) Consutla de inserción: Insertar de nuevo a Paco de Haro:
INSERT Clientes VALUES
('22222222B', 'Francisco de Haro', 'Sanidad','Calle de Paco');

-- 7) JOIN
