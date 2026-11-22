-- Empresa Limpieza 
-- Date: 202205 (sesion 18)
-- Autor: Juan Gago
-- File: dml_018.sql

use sqlinicial;

/* CONSULTAS */

-- 1) Servicios contratados por todos los clientes que se apelliden 
-- "Martínez" ordenados por el nombre del servicio.
SELECT Nombre_Cli, S.*
FROM Servicios S, Contrata C, Clientes L
WHERE S.Cod_S=C.Cod_S
AND C.NIF_Cli=L.NIF_Cli
AND Nombre_Cli LIKE '%Martínez%' ORDER BY Nombre_S;

+-----------------+-------+------------------------------+
| Nombre_Cli      | Cod_S | Nombre_S                     |
+-----------------+-------+------------------------------+
| Amalia Martínez |     2 | Limpiado lo que ve la suegra |
| Amalia Martínez |     3 | Limpiado lo que ve la suegra |
+-----------------+-------+------------------------------+

-- 2) Facturas pagadas por Amalia Martínez
SELECT F.Fecha_F, F.Nro_F, F.Importe_F
FROM Facturas F, Clientes C
WHERE F.NIF_Cli=C.NIF_Cli
AND Estado_F='Pagada' AND Nombre_Cli='Amalia Martínez';

+--------+-----------+------------+----------+-----------+
| Nro_F  | Importe_F | Fecha_F    | Estado_F | NIF_Cli   |
+--------+-----------+------------+----------+-----------+
| FP-003 |     939.5 | 2022-01-23 | Pagada   | 88888888H |
| FP-004 |     19.93 | 2022-02-21 | Pagada   | 88888888H |
+--------+-----------+------------+----------+-----------+

-- 3) Servicios y su disponibilidad que realiza el limpiador Fco Martínez:
SELECT S.Nombre_S, Dia_D, Hora_Ini_D, Hora_Fin_D
FROM Servicios S, Disponibilidad D, Limpiadores L
WHERE S.Cod_S=D.Cod_S AND D.NIF_L=L.NIF_L
AND Nombre_L='Francisco Martínez';

+----------------------+-------+------------+------------+
| Nombre_S             | Dia_D | Hora_Ini_D | Hora_Fin_D |
+----------------------+-------+------------+------------+
| Limpiado de fachadas | Lunes | 09:00:00   | 10:00:00   |
+----------------------+-------+------------+------------+

-- 4) Nombre de limpiadores que hacer servicios contratados 
-- por el cliente Joaquín Gallegos.
SELECT L.Nombre_L, D.Dia_D, C.Periodicidad_C
FROM Limpiadores L, Clientes Cli, Contrata C, Disponibilidad D
WHERE L.NIF_L=D.NIF_L AND D.Cod_S = C.Cod_S AND C.NIF_Cli = Cli.NIF_Cli
AND Cli.Nombre_Cli='Joaquín Gallegos';

+---------------------+------------+----------------+
| Nombre_L            | Dia_D      | Periodicidad_C |
+---------------------+------------+----------------+
| Francisco Martínez  | Lunes      | Quincenal      |
| Dieguito Gay        | Miércoles  | Quincenal      |
| Carmen              | Martes     | Semanal        |
+---------------------+------------+----------------+

/* SUBCONSULTAS */

-- 1) Mostrar los nombres de clientes que tienen factura de más de 100 euros
SELECT Nombre_Cli FROM Clientes
WHERE NIF_Cli IN (SELECT DISTINCT NIF_Cli FROM Facturas WHERE Importe_F>100);

-- 2) Mostrar los nombres de clientes que no tienen factura
SELECT C.Nombre_Cli FROM Clientes C
WHERE C.NIF_Cli NOT IN (SELECT DISTINCT F.NIF_Cli FROM Facturas F);

-- 3) Nombre de cliente con la factura más alta
SELECT Nombre_Cli, F.Importe_F, F.Fecha_F 
FROM Clientes C, Facturas F WHERE C.NIF_Cli=F.NIF_Cli
AND F.Importe_F >= ALL (SELECT Importe_F FROM Facturas);

-- 4) Clientes que tienen facturas menos el que tenga la factura más baja:
SELECT Nombre_Cli, F.Importe_F, F.Fecha_F 
FROM Clientes C, Facturas F
WHERE C.NIF_Cli=F.NIF_Cli
AND F.Importe_F > ANY (SELECT Importe_F FROM Facturas);

  SELECT Nombre_Cli, F.Importe_F
  FROM Clientes C, Facturas F
  WHERE C.NIF_Cli=F.NIF_Cli
  AND F.Importe_F > (SELECT MIN(Importe_F) FROM Facturas);

  SELECT Nombre_Cli, F.Importe_F
  FROM Clientes C, Facturas F
  WHERE C.NIF_Cli=F.NIF_Cli
  AND F.Importe_F <> (SELECT MIN(Importe_F) FROM Facturas);

-- 5) Número de facturas, importe medio, máximo, mínimo y sumatoria
SELECT COUNT(*) ,AVG(Importe_F), MAX(Importe_F), MIN(Importe_F), 
SUM(Importe_F) FROM Facturas;

-- 6) Nombres y direcciones de todas las personas de la BD
(SELECT Nombre_Cli AS "Nombre_Persona", Domicilio_Cli AS "Domicilio" FROM Clientes)
UNION ALL (SELECT Nombre_L, Domicilio_L FROM Limpiadores);

