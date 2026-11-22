-- Club de Tenis 
-- Date: 202206 (sesion 20)
-- Autor: Juan Gago
-- File: 

-- a.¿Está libre la pista 1 el 30/05/2022 de 20:00 a 21:00 horas? (Pista: 0 libre, 1 ocupada).

SELECT COUNT(*) AS 'Reservada S/N'
FROM Reservas
WHERE Id_P=1
AND Fecha_R='2022-05-30'
AND Hora_Ini_R='20:00'
AND Hora_Fin_R='21:00';

+---------------+
| Reservada S/N |
+---------------+
|             0 |
+---------------+

-- b.Nombre y apellidos de los socios apuntados al curso denominado “Adultos Grupo 1” que tienen pendiente de pago el recibo del mes de Febrero de 2022.

SELECT Nombre_S, Apellidos_S
FROM Socios S, SC R, Cursos C, Recibos E
WHERE S.Num_S=R.Num_S
AND R.Id_C = C.Id_C
AND E.Num_S=R.Num_S
AND E. Id_C = R.Id_C
AND Pagado=0
AND Nombre_C = 'Adultos Grupo 1'
AND Mes_R = 'Febrero'
AND Anyo_R=2022;

+----------+-------------+
| Nombre_S | Apellidos_S |
+----------+-------------+
| Manuela  | Martínez    |
+----------+-------------+

-- c.¿Cuántos alumnos tiene el profesor “Paco de Haro” en cada curso?

SELECT C.Id_C, Nombre_C, COUNT(Num_S)
FROM SC S, Cursos C, Profes P
WHERE S.Id_C=C.Id_C
AND C.NIF_Profe = P.NIF_Profe
AND Nombre_Profe='Paco'
AND Apellidos_Profe='de Haro'
GROUP BY C.Id_C;

+------+-------------------+--------------+
| Id_C | Nombre_C          | COUNT(Num_S) |
+------+-------------------+--------------+
|    1 | Adultos Grupo 1   |            2 |
|    3 | Veteranos Grupo 1 |            1 |
|    5 | Niños Grupo 1     |            1 |
+------+-------------------+--------------+

-- d.Socios que hayan realizado más de 2 reservas en el mes de mayo de 2022 en pistas no homologadas para campeonatos.

SELECT S.Num_S, Nombre_S, Apellidos_S
FROM Socios S, ANombre A, Pistas P
WHERE S.Num_S = A.Num_S
AND A.Id_P=P.Id_P
AND A.Fecha_R BETWEEN '2022-05-01' AND '2022-05-31'
AND Homologada_P=0
GROUP BY S.Num_S
HAVING COUNT(*)>2;

+-------+---------------+-------------+
| Num_S | Nombre_S      | Apellidos_S |
+-------+---------------+-------------+
|     4 | María del Mar | Martínez    |
+-------+---------------+-------------+
