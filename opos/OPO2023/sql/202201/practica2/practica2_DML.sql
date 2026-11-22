/* Práctica 2 DML */

/* 5 */
LOAD DATA INFILE 'provincia.txt' INTO TABLE provincia COLUMNS TERMINATED BY ';' LINES TERMINATED BY '\r\n';
LOAD DATA LOCAL INFILE '/home/pi/municipio.txt' 
     INTO TABLE municipio 
     COLUMNS TERMINATED BY ';' 
     LINES TERMINATED BY '\r\n' 
     (idmunicipio,idprovincia,municipio) SET habitantes=0;

/* 6 */
UPDATE municipio SET habitantes = 1000;
UPDATE municipio SET habitantes = 1602386 WHERE municipio = 'Barcelona';
UPDATE municipio SET habitantes = 16600 WHERE municipio = 'Ubrique';
UPDATE municipio SET habitantes = 117003 WHERE municipio = 'Cádiz';

/* 7.a Towns starting by Z */
SELECT municipio FROM municipio 
WHERE municipio LIKE 'Z%';

/* 7.b First town in alphabetic order */
SELECT * FROM municipio ORDER BY municipio ASC LIMIT 1;

/* 7.c List of town called Jerez*/
SELECT municipio, 
      (SELECT provincia FROM provincia WHERE provincia idprovincia = idprovincia) AS provincia 
      FROM municipio WHERE municipio LIKE 'Jerez%';

/* 7.d Province and code of Cogolludo*/
SELECT (SELECT provincia FROM provincia WHERE idprovincia = idprovincia) AS provincia,
       idmunicipio FROM municipio WHERE municipio = 'Cogolludo';

/* 7.e Town with more population*/
SELECT municipio FROM municipio 
WHERE habitantes = (SELECT MAX(habitantes) FROM municipio);

/* 7.f Number of towns in Cádiz */
SELECT COUNT(municipio) FROM municipio
WHERE idprovincia = (SELECT idprovincia FROM provincia WHERE provincia = 'Cádiz');

/* 7.g Province with less towns */
SELECT provincia FROM provincia
WHERE idprovincia = 
      (SELECT idprovincia FROM municipio 
      GROUP BY idprovincia 
      ORDER BY COUNT(*) DESC LIMIT 1);

/* 7.h Population of Extremadura */
SELECT SUM(habitantes) AS 'Extremadura'
FROM municipio 
WHERE idprovincia IN 
      (SELECT idprovincia FROM provincia 
      WHERE provincia = 'Cáceres' OR provincia = 'Badajoz');

