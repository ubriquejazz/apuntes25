-- Examen práctico ejemplo sobre BD eleccionesjimena
-- Autor: Sánchez Rey, Juana (Solución)

/* 1. Listado de colegios electorales ordenado por número de colegio (Colegio, Lugar
y número de Mesas).*/

CREATE PROCEDURE C1()
SELECT colegio.idcolegio AS Colegio,
       colegio.direccion AS Lugar,
       COUNT(*) AS Mesas
FROM colegio
JOIN mesa ON colegio.idcolegio = mesa.colegio_idcolegio
GROUP BY colegio.idcolegio
ORDER BY colegio.idcolegio ASC;


/* 2. Listado de partidos políticos ordenado alfabéticamente por sus siglas (Partido y
Cabeza de lista).*/

CREATE PROCEDURE C2()
SELECT siglas AS Partido,
       lider AS 'Cabeza de lista'
FROM partido
ORDER BY siglas ASC;

/* 3. Componentes de una determinada mesa cuyo numero de colegio y letra se
reciben como datos de entrada (Nombre, DNI y Cargo – este último de la forma
“PRESIDENTE”, “Vocal 1º” y “Vocal 2º”, en ese orden).*/

CREATE PROCEDURE C3(IN p_idcolegio INT, IN p_letra CHAR(1))
SELECT nombre AS Nombre,
       dni AS DNI,
       CASE cargo
 	WHEN 'PR' THEN 'Presidente'
        WHEN 'V1' THEN 'Vocal 1º'
        WHEN 'V2' THEN 'Vocal 2º'
       END AS Cargo
FROM componente
WHERE mesa_colegio_idcolegio = p_idcolegio AND mesa_letra = p_letra
ORDER BY cargo;
       


/* 4. Listado de votos totales obtenidos por el actual alcalde ‘Pascual Collado’ en cada
uno de los colegios electorales, descendente por total de votos (Lugar y Total
Votos).*/

CREATE PROCEDURE C4()
SELECT colegio.direccion AS Lugar,
       SUM(recuento.votos) AS 'Total Votos'
FROM colegio
     JOIN recuento ON colegio.idcolegio = recuento.mesa_colegio_idcolegio
     JOIN partido ON partido.siglas = recuento.partido_siglas
WHERE partido.lider = 'Pascual Collado'
GROUP BY colegio.idcolegio
ORDER BY 2 DESC;


/* 1. Función votos que reciba las siglas de un partido y devuelva el total de votos
obtenido por ese partido.*/

DELIMITER &&
CREATE FUNCTION votos(p_siglas VARCHAR(15)) RETURNS INT
BEGIN
	DECLARE total INT;
	SELECT SUM(votos) INTO total
            FROM recuento
            WHERE partido_siglas = p_siglas;
	RETURN total;
END &&
DELIMITER ;


/* 2. Funcion cuenta que reciba un carácter y devuelva el total de votos. El carácter
recibido indicará qué recuento queremos realizar de modo que si se introduce
una ‘b’ el resultado será el número de votos blancos, si se introduce una ‘n’ el
resultado corresponderá al número de votos nulos y si se introduce una ‘v’ el
resultado será el correspondiente a los votos válidos (todos los votos obtenidos
por los partidos).*/

DELIMITER $$
CREATE FUNCTION cuenta(p_caracter CHAR(1)) RETURNS INT
BEGIN
	DECLARE total INT;
	CASE p_caracter
	   WHEN 'b' THEN SELECT SUM(blancos) INTO total FROM mesa;
           WHEN 'n' THEN SELECT SUM(nulos) INTO total FROM mesa;
	   WHEN 'v' THEN SELECT SUM(votos) INTO total FROM recuento;
           ELSE SET total = -1;
	END CASE;
	RETURN total;
END $$
DELIMITER ;



/* 1. Crear la vista resultado que presente los resultados definitivos de las elecciones
indicando partido, votos y porcentaje con respecto al total de participacion
(suma de blancos, nulos y válidos).*/

CREATE VIEW resultado (partido,votos,porcentaje) AS
SELECT siglas,
       VOTOS(siglas),
       VOTOS(siglas) * 100 / (CUENTA('b') + CUENTA('n') + CUENTA('v'))
FROM partido;       


/* 1. Crear el trigger control que impida que el campo votos de la tabla recuento, en
un proceso de inserción, pueda tomar un valor mayor de 7111 (censo electoral
de Jimena). */

-- Versión simple
DELIMITER //
CREATE TRIGGER control BEFORE INSERT ON recuento FOR EACH ROW
BEGIN
    IF NEW.votos > 7111 THEN
         SET NEW.votos = 0;
    END IF;
END //
DELIMITER ;

-- Versión avanzada

DELIMITER //
CREATE TRIGGER control BEFORE INSERT ON recuento FOR EACH ROW
BEGIN
        DECLARE votos_actuales INT;
        DECLARE restantes INT;
        SELECT SUM(votos) INTO votos_actuales FROM recuento;
        SET restantes = 7111 - votos_actuales;
	IF NEW.votos > restantes THEN
		SET NEW.votos = restantes;
        END IF;
END //
DELIMITER;










