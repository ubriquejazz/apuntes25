-- DML - Solución -
-- Autor: Juana

-- 8 --
INSERT jugador VALUES
       (1, 'Pepe', MD5('pepe2000'), 'Jerez', 100, '2020-01-01', '2020-02-15'),
       (2, 'Juana', MD5('gatito1'), NULL, 500, '2020-01-07', '2020-02-01'),
       (3, 'Moisés', MD5('gallego'), 'Jerez', 300, '2020-01-02', '2020-02-17'),
       (4, 'Lolo', MD5('1234'), 'Sevilla', 0, '2020-02-17', '2020-02-17'),
       (5, 'Marga', MD5('filibau'), 'Jerez', 450, '2020-01-01', '2020-03-03');

-- 9 --
SELECT ciudad,
       nick AS 'mejor jugador',
       puntuacion
FROM jugador
WHERE puntuacion IN (SELECT MAX(puntuacion) FROM jugador GROUP BY ciudad) AND ciudad IS NOT NULL
GROUP BY ciudad;

-- 10 --
SELECT nick, 
       ciudad, 
       TIMESTAMPDIFF(DAY,fecha_ultimo_acceso,NOW()) AS 'días desde último acceso'
FROM jugador
WHERE fecha_alta = (SELECT MIN(fecha_alta) FROM jugador) 
      AND 
      puntuacion BETWEEN 100 AND 1000;

-- 11 --
SELECT texto AS opcion, 
       IF (correcta='s','*','') AS correcta 
FROM opcion 
WHERE pregunta_id = 30; 

-- 12 --
SELECT (SELECT texto FROM tema WHERE tema_id = tema.id) AS tema 
FROM pregunta 
GROUP BY tema_id 
HAVING COUNT(*) > 12
ORDER BY tema;

-- 13 --
SELECT texto AS pregunta
FROM pregunta
WHERE tema_id IS NULL;

-- 14 --
SELECT id, 
       nick, 
       password, 
       puntuacion,
       DATE_FORMAT(fecha_alta, "%d/%m/%Y") AS 'fecha alta',
       DATE_FORMAT(fecha_ultimo_acceso, "%d/%m/%Y") AS 'fecha último acceso',
FROM jugador
WHERE puntuacion < (SELECT AVG(puntuacion) FROM jugador)
ORDER BY nick;

-- 15 --
UPDATE pregunta SET texto = CONCAT(texto,'?')
WHERE texto LIKE '¿%' AND texto NOT LIKE '%?'; 

-- 16 --
SELECT texto AS correctas 
FROM opcion 
WHERE pregunta_id =  (SELECT id FROM pregunta WHERE texto LIKE '%Cuáles son las 5 ciudades más pobladas%') 
    AND
    correcta ='s';

-- 17 --
SELECT DISTINCT ciudad 
FROM jugador
WHERE ciudad IS NOT NULL
ORDER BY ciudad;

-- 18 --
UPDATE jugador 
SET password = md5('gatoBenito'), puntuacion = puntuacion + 54
WHERE nick = 'Juana'; 

-- 19 --
SELECT texto AS pregunta,
       (SELECT texto FROM tema WHERE tema_id = tema.id) AS tema,
       (SELECT GROUP_CONCAT(texto) 
              FROM opcion WHERE pregunta_id = pregunta.id 
              GROUP BY pregunta_id) AS opciones

FROM pregunta
ORDER BY 2,1;

-- 20 --
/*DELETE FROM pregunta WHERE id = 76;*/