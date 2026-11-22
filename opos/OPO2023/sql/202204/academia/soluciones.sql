/* Vista BATERIA */
CREATE VIEW bateria (tema,pregunta,opciones,solucion) AS
SELECT pregunta.tema_idtema,
       pregunta.enunciado,
       GROUP_CONCAT(respuesta.letra,'. ',respuesta.texto SEPARATOR '<br/>'),
       pregunta.letra_correcta
FROM pregunta
JOIN respuesta ON pregunta.tema_idtema = respuesta.pregunta_tema_idtema 
     AND pregunta.idpregunta = respuesta.pregunta_idpregunta
WHERE (SELECT COUNT(*) 
       FROM pregunta 
       WHERE pregunta.tema_idtema = respuesta.pregunta_tema_idtema) > 10
GROUP BY pregunta.tema_idtema,pregunta.idpregunta;


/* Función NUEVA_PREGUNTA */
DELIMITER //

CREATE FUNCTION nueva_pregunta (ptitulo VARCHAR(100)) RETURNS MEDIUMINT
BEGIN
DECLARE salida MEDIUMINT;
SELECT pregunta.idpregunta INTO salida 
FROM pregunta
JOIN tema ON tema.idtema = pregunta.tema_idtema
WHERE tema.titulo = ptitulo
ORDER BY RAND() 
LIMIT 1;
RETURN salida;
END //

DELIMITER ;

/* Función PORCENTAJE_ACIERTOS */
DELIMITER //

CREATE FUNCTION porcentaje_aciertos (p_idtest INT) RETURNS FLOAT
BEGIN
DECLARE cuantas INT;
DECLARE aciertos INT;

SELECT COUNT(*) INTO cuantas 
FROM test_has_pregunta 
WHERE p_idtest = test_idtest;

SELECT COUNT(*) INTO aciertos 
FROM test_has_pregunta
JOIN pregunta ON pregunta_tema_idtema = tema_idtema AND
                 pregunta_idpregunta = idpregunta
WHERE p_idtest = test_idtest AND letra_elegida = letra_correcta;

RETURN aciertos * 100 / cuantas;
END //

DELIMITER ;

/* Procedimiento LISTA_CHAMPIONS */
DELIMITER //

CREATE PROCEDURE lista_champions (IN p_anio YEAR)
BEGIN
SELECT nombre_completo AS 'Alumno',
       TIMESTAMPDIFF(MONTH,fecha_alta,CURRENT_DATE()) AS 'Meses',
       AVG(PORCENTAJE_ACIERTOS(idtest)) AS 'Porcentaje medio de aciertos',
       IF (AVG(PORCENTAJE_ACIERTOS(idtest))>=50,'APTO','NO APTO') AS 'Comentario'
FROM alumno JOIN test ON alumno_idalumno = idalumno
WHERE YEAR(fecha_alta) = p_anio
GROUP BY idalumno
ORDER BY 1;
END //

DELIMITER ;

/* Procedimiento INSERTA_RESPUESTA */

DELIMITER ;

CREATE PROCEDURE inserta_respuesta (IN p_idtema SMALLINT, IN p_idpregunta MEDIUMINT, IN p_texto VARCHAR(200))
BEGIN
DECLARE ultima_letra CHAR(1);
DECLARE proxima_letra CHAR(1);

SELECT letra INTO ultima_letra 
FROM respuesta 
WHERE p_idtema = pregunta_tema_idtema
      AND p_idpregunta = pregunta_idpregunta
ORDER BY letra DESC LIMIT 1;

CASE ultima_letra
	WHEN 'A' THEN SET proxima_letra = 'B';
	WHEN 'B' THEN SET proxima_letra = 'C';
	WHEN 'C' THEN SET proxima_letra = 'D';
	WHEN 'D' THEN SET proxima_letra = ' ';
	ELSE SET proxima_letra = 'A';
END CASE;

IF proxima_letra = ' ' THEN
   SELECT 'ERROR: No es posible insertar una nueva respuesta. Ya hay 4';
ELSE
   INSERT respuesta VALUES (p_idtema,p_idpregunta,proxima_letra,p_texto);
END IF;

END //

DELIMITER ;















