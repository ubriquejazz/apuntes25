-- Feria del Caballo 
-- Date: 202204
-- Autor: Juan Gago
-- File: dml01.sql
 
-- 1. Create a function that receives as a parameter the number of a booth and returns the number of members of it

CREATE FUNCTION F1 (p_numero NUMBER) 
RETURNS NUMBER
AS
        cuantos NUMBER;
BEGIN
	SELECT COUNT(socio_dni) INTO cuantos
  	     FROM Caseta_Has_Socio
   	     WHERE caseta_id = p_numero;
	RETURN cuantos;
END F1;

-- 2. Create a procedure that displays a list of all booths indicating the following fields: name of the booth, 
--      street where it is located and the booth number (id). It will receive as a parameter 
--      a character to indicate how to order the list: alphabetically ('a') or by booth number ('n')

CREATE PROCEDURE P1 (IN p_orden_listado CHAR(1))
BEGIN
	IF p_orden_listado = 'a' THEN
		SELECT caseta.nombre AS caseta,
                       calle.nombre AS calle,
                       caseta.id AS numero
                FROM caseta JOIN calle ON caseta.calle_id = calle.id
                ORDER BY caseta.nombre;
        END IF;
	
	IF p_orden_listado = 'n' THEN
		SELECT caseta.nombre AS caseta,
                       calle.nombre AS calle,
                       caseta.id AS numero
                FROM caseta JOIN calle ON caseta.calle_id = calle.id
                ORDER BY caseta.id;
        END IF;
END P1 ;

-- SolucioN 2 : ELIF ... ELSE
CREATE PROCEDURE P1_V2 (IN p_orden_listado CHAR(1))
BEGIN
	IF p_orden_listado = 'a' THEN
		SELECT caseta.nombre AS caseta,
                       calle.nombre AS calle,
                       caseta.id AS numero
                FROM caseta JOIN calle ON caseta.calle_id = calle.id
                ORDER BY caseta.nombre;
        ELSE IF p_orden_listado = 'n' THEN
		SELECT caseta.nombre AS caseta,
                       calle.nombre AS calle,
                       caseta.id AS numero
                FROM caseta JOIN calle ON caseta.calle_id = calle.id
                ORDER BY caseta.id;
	ELSE 
                DBMS_OUTPUT.PUT_LINE("Debe insertar una 'a' o una 'n'");
        END IF;
END P1_V2 ;

-- SolicioN 3 : WHEN, WHEN ... ELSE
CREATE PROCEDURE P1_V3(IN p_caracter CHAR(1))
BEGIN
    CASE p_caracter

        /* Ordeno por nombre de caseta */
	WHEN 'a' THEN SELECT caseta.nombre AS caseta,
           calle.nombre AS calle,
           caseta.id AS numero
    	FROM caseta JOIN calle ON caseta.calle_id = calle.id
        ORDER BY caseta.nombre ASC;

	/* Ordeno por numero de caseta */
        WHEN 'n' THEN SELECT caseta.nombre AS caseta,
           calle.nombre AS calle,
           caseta.id AS numero
    	FROM caseta JOIN calle ON caseta.calle_id = calle.id
        ORDER BY 3 ASC;

	/* Si no es ninguno de los caracteres anteriores ... */
        ELSE 
            DBMS_OUTPUT.PUT_LINE("El parametro " || p_caracter || " no es correcto");
    END CASE;
END P1_V3 ;

-- 3. Create a view that shows the description of the prize (prize), the name of the booth (booth) 
-- and its location, indicating street and number separated by a comma (location)

CREATE VIEW premiados (premio, caseta, localizacion) AS
SELECT premio.descripcion,
       caseta.nombre,
       CONCAT(calle.nombre, ', ', caseta.id)
FROM caseta
     JOIN calle ON caseta.calle_id = calle.id
     JOIN premio ON caseta.id = premio.caseta_id;
 
/* 4. VISTA precios que contenga las diferentes consumiciones (consumicion) y el precio medio que tiene esa consumicioN en las diferentes casetas de la feria (precio_medio). */

CREATE VIEW precios (consumicion, precio_medio) AS
SELECT consumicion.nombre,
       AVG(caseta_has_consumicion.precio)
FROM consumicion
JOIN caseta_has_consumicion ON consumicion.idconsumicion = caseta_has_consumicion.consumicion_idconsumicion
GROUP BY consumicion.idconsumicion;

