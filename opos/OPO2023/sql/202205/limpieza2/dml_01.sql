-- Empresa Limpieza 
-- Date: 202205 (sesion 18)
-- Autor: Juan Gago
-- File: 

use sqlinicial;

/* CONSULTAS JOIN */

-- 1) Nombre y domicilio de clientes que se dedican a la misma actividad que Francisco Martínez

SELECT Actividad_Cli
FROM Clientes 
WHERE Nombre_Cli='Francisco Martínez';

SELECT Nombre_Cli, Domicilio_Cli
FROM Clientes 
WHERE Actividad_Cli = 'Sanidad';

SELECT A.Nombre_Cli, A.Domicilio_Cli
FROM Clientes A, Clientes B
WHERE B.Nombre_Cli='Francisco Martínez'
AND B.Actividad_Cli = A.Actividad_Cli;

+--------------------+-------------------------------------+
| Nombre_Cli         | Domicilio_Cli                       |
+--------------------+-------------------------------------+
| Francisco Martínez | Calle de Fran                       |
| Manuela Martínez   | Calle Profesor Mulián, Edif. A, 3-3 |
| Francisco de Haro  | Calle de Paco                       |
| Pepe Pérez         | Calle Dil                           |
+--------------------+-------------------------------------+

-- 2) Clientes que tienen alguna factura que supera el importe medio de las facturas

SELECT C.*
FROM Clientes C, Facturas F
WHERE C.NIF_Cli=F.NIF_Cli
AND F.Importe_F > (SELECT AVG(Importe_F) FROM Facturas);

+-----------+------------------+---------------+---------------------------------+
| NIF_Cli   | Nombre_Cli       | Actividad_Cli | Domicilio_Cli                   |
+-----------+------------------+---------------+---------------------------------+
| 10101010J | Joaquín Gallegos | Educación     | calle Profesor Mulián, nº 4-3-3 |
| 88888888H | Amalia Martínez  | Construcción  | C/ Profesor Mulián, 39          |
| 77777777G | Amalia Gallegos  | Educación     | Calle Profesor Mulián, 20       |
+-----------+------------------+---------------+---------------------------------+

-- 2a) Datos de clientes y de sus facturas que superan el importe medio de sus facturas

INSERT Facturas VALUES ('FP-005', 1000, '2022-02-21', 'Pagada', '88888888H');

SELECT C.NIF_Cli, C.Nombre_Cli, F.Nro_F, F.Importe_F
FROM Clientes C, Facturas F
WHERE C.NIF_Cli=F.NIF_Cli
AND F.Importe_F > (SELECT AVG(Importe_F) FROM Facturas WHERE Facturas.NIF_Cli = F.NIF_Cli);

-- 3) Limpiadores que trabajan los lunes.

SELECT Nombre_L
FROM Limpiadores L, Disponibilidad D
WHERE L.NIF_L=D.NIF_L
AND D.Dia_D='Lunes'; 

+--------------------+
| Nombre_L           |
+--------------------+
| Francisco Martínez |
| Francisco de Haro  |
| Gran Luque         |
+--------------------+

-- 4) Cliente que han contratado servicio de 'Limpiado de fachadas' con periodicidad quincenal

SELECT L.*
FROM Servicios S, Contrata C, Clientes L
WHERE S.Cod_S=C.Cod_S
AND C.NIF_Cli=L.NIF_Cli
AND S.Nombre_S='Limpiado de fachadas'
AND C.Periodicidad_C='Quincenal';

+-----------+------------------+---------------+---------------------------------+
| NIF_Cli   | Nombre_Cli       | Actividad_Cli | Domicilio_Cli                   |
+-----------+------------------+---------------+---------------------------------+
| 10101010J | Joaquín Gallegos | Educación     | calle Profesor Mulián, nº 4-3-3 |
+-----------+------------------+---------------+---------------------------------+

/* CONSULTAS TEORÍA DE CONJUNTOS: */

-- 1) Nombres y direcciones de todas las personas de la BD (suprimiendo duplicados)

(SELECT Nombre_Cli AS "Nombre_Persona", Domicilio_Cli AS "Domicilio"
FROM Clientes)
UNION
(SELECT Nombre_L, Domicilio_L FROM Limpiadores);

+--------------------+-------------------------------------+
| Nombre_Persona     | Domicilio                           |
+--------------------+-------------------------------------+
| Amalia Gallegos    | Calle Profesor Mulián, 20           |
| Amalia Martínez    | C/ Profesor Mulián, 39              |
| Manuela Martínez   | Calle Profesor Mulián, Edif. A, 3-3 |
| Joaquín Gallegos   | calle Profesor Mulián, nº 4-3-3     |
| Amalia Ruiz        | Calle El ejido                      |
| Pepe Pérez         | Calle Dil                           |
| Francisco Martínez | Calle de Fran                       |
| Francisco de Haro  | Calle de Paco                       |
| Carmen             | Calle de Carmen                     |
| Gran Luque         | Calle del Gran Luque                |
| Dieguito Gay       | Calle de Dieguito                   |
| Dieguito Gay       | dsfadf                              |
+--------------------+-------------------------------------+

-- 2) Nombres y direcciones de todas las personas de la BD (manteniendo duplicados)

(SELECT Nombre_Cli AS "Nombre_Persona", Domicilio_Cli AS "Domicilio"
FROM Clientes)
UNION ALL
(SELECT Nombre_L, Domicilio_L FROM Limpiadores);

+--------------------+-------------------------------------+
| Nombre_Persona     | Domicilio                           |
+--------------------+-------------------------------------+
| Francisco Martínez | Calle de Fran                       |
| Amalia Gallegos    | Calle Profesor Mulián, 20           |
| Amalia Martínez    | C/ Profesor Mulián, 39              |
| Manuela Martínez   | Calle Profesor Mulián, Edif. A, 3-3 |
| Joaquín Gallegos   | calle Profesor Mulián, nº 4-3-3     |
| Francisco de Haro  | Calle de Paco                       |
| Amalia Ruiz        | Calle El ejido                      |
| Pepe Pérez         | Calle Dil                           |
| Francisco Martínez | Calle de Fran                       |
| Francisco de Haro  | Calle de Paco                       |
| Carmen             | Calle de Carmen                     |
| Gran Luque         | Calle del Gran Luque                |
| Dieguito Gay       | Calle de Dieguito                   |
| Dieguito Gay       | dsfadf                              |
+--------------------+-------------------------------------+

-- 3) INTERSECCIÓN: Nombres y direcciones de personas que son clientes y empleados

-- Forma 1: con subconsulta con IN

SELECT Nombre_Cli, Domicilio_Cli
FROM Clientes
WHERE NIF_Cli IN (SELECT NIF_L FROM Limpiadores);

-- Forma 2: producto cartesiano con INNER JOIN

SELECT Nombre_Al, Apellido1_Al
FROM Alumnos INNER JOIN Estudian ON Alumnos.DNI_Al = Estudian.DNI_Al;

SELECT Nombre_Cli, Domicilio_Cli
FROM Clientes INNER JOIN Limpiadores ON Clientes.NIF_Cli = Limpiadores.NIF_L;

+--------------------+---------------+
| Nombre_Cli         | Domicilio_Cli |
+--------------------+---------------+
| Francisco Martínez | Calle de Fran |
| Francisco de Haro  | Calle de Paco |
+--------------------+---------------+

-- 4) DIFERENCIA: Nombres y direcciones de clientes que NO seas limpiadores.

-- Forma 1: NOT IN

SELECT Nombre_Cli, Domicilio_Cli
FROM Clientes
WHERE NIF_Cli NOT IN (SELECT NIF_L FROM Limpiadores);

-- Forma 2: producto cartesiano con NOT EXIT

SELECT Nombre_Cli, Domicilio_Cli
FROM Clientes C 
WHERE NOT EXISTS (SELECT * FROM Limpiadores L WHERE L.NIF_L = C.NIF_Cli);

+------------------+-------------------------------------+
| Nombre_Cli       | Domicilio_Cli                       |
+------------------+-------------------------------------+
| Amalia Gallegos  | Calle Profesor Mulián, 20           |
| Amalia Martínez  | C/ Profesor Mulián, 39              |
| Manuela Martínez | Calle Profesor Mulián, Edif. A, 3-3 |
| Joaquín Gallegos | calle Profesor Mulián, nº 4-3-3     |
| Amalia Ruiz      | Calle El ejido                      |
| Pepe Pérez       | Calle Dil                           |
+------------------+-------------------------------------+

