-- Empresa Limpieza 
-- Date: 202205 (sesion 16)
-- Autor: Juan Gago
-- File: dml_016.sql

use sqlinicial;

/* CONSULTAS SIMPLES */

-- Mostrar un listado ordenado descendentemente por nombre de todos los limpiadores.
SELECT * FROM Limpiadores ORDER BY Nombre_L DESC;

-- Solución:
+-----------+--------------------+----------------------+------------+
| NIF_L     | Nombre_L           | Domicilio_L          | Telefono_L |
+-----------+--------------------+----------------------+------------+
| 44444444D | Gran Luque         | Calle del Gran Luque |            |
| 11111111A | Francisco Martínez | Calle de Fran        | 111111111  |
| 22222222B | Francisco de Haro  | Calle de Paco        | 222222222  |
| 55555555E | Dieguito Gay       | Calle de Dieguito    | NULL       |
| 66666666F | Dieguito Gay       | dsfadf               | 999999999  |
| 33333333C | Carmen             | Calle de Carmen      | NULL       |
+-----------+--------------------+----------------------+------------+

-- Mostrar DNI, nombre y dirección de los clientes dedicados a la Educación.
SELECT NIF_Cli, Nombre_Cli, Domicilio_Cli 
  FROM Clientes WHERE Actividad_Cli = 'Educacion';

-- Solución:
+-----------+------------------+----------------+
| NIF_Cli   | Nombre_Cli       | Domicilio_Cli  |
+-----------+------------------+----------------+
| 10101010J | Joaquín Gallegos | Calle El Ejido |
| 77777777G | Amalia Gallegos  | Calle Reina    |
+-----------+------------------+----------------+

-- Mostrar el número de factura y el importe de las facturas pagadas ordenadas por fecha.
SELECT Nro_F, Importe_F FROM Facturas 
  WHERE Estado_F = 'Pagada' ORDER BY Fecha_F;

-- Solución:
+---------+-----------+
| Nro_F   | Importe_F |
+---------+-----------+
| FP-001  |       100 |
| FP-003  |     939.5 |
| FP-004  |     19.93 |
| PES-001 |       203 |
+---------+-----------+

-- Mostrar los NIF de clientes que han contratado servicios con periodicidad Diaria.
SELECT NIF_Cli FROM Contrata WHERE Periodicidad_C = 'Diaria';

-- Solución:
+-----------+
| NIF_Cli   |
+-----------+
| 88888888H |
+-----------+

-- Disponibilidad que tiene los Lunes para el servicio número 1.

SELECT NIF_L, Hora_Ini_D, Hora_Fin_D 
  FROM Disponibilidad WHERE Dia_D = 'Lunes' AND Cod_S = 1;

-- Solución:
+-----------+-------+-------+------------+------------+
| NIF_L     | Cod_S | Dia_D | Hora_Ini_D | Hora_Fin_D |
+-----------+-------+-------+------------+------------+
| 11111111A |     1 | Lunes | 09:00:00   | 10:00:00   |
+-----------+-------+-------+------------+------------+

-- Teoria conjuntos: UNION
(SELECT Nombre_Cli, Domicilio_Cli FROM Clientes)
UNION
(SELECT Nombre_L, Domicilio_L FROM Limpiadores);

-- Teoria conjuntos: INTERSECT
(SELECT Nombre_Cli, Domicilio_Cli FROM Clientes)
INTERSECT
(SELECT Nombre_L, Domicilio_L FROM Limpiadores);

-- Teoria conjuntos: MINUS (EXCEPT)
(SELECT Nombre_Cli, Domicilio_Cli FROM Clientes)
EXCEPT
(SELECT Nombre_L, Domicilio_L FROM Limpiadores);

/* TESTS */

INSERT Clientes VALUES 
('13131311L', 'Fran Martinez', 'Servicios', 'Calle Dil');

INSERT Limpiadores (NIF_L, Nombre_L, Domicilio_L)
VALUES ('13131311L', 'Fran Martinez', 'Calle Dil');

-- PC: Caracteristicas de servicios capaz de realizar Fran
SELECT Nombre_S, Servicios.Cod_S FROM Servicios 
FROM Servicios S, Limpiadores L, Disponibilidad D
WHERE D.Cod_S = S.Cod_S 
AND D.NIF_L = L.NIF_L
AND L.Nombre_L = 'Francisco de Haro';

