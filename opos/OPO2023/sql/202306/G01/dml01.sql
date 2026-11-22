-- 
--
--

-- Para las tablas ESPECIALIDADES y PETICIONES indicar las sentencias a utilizar 
-- para las tablas restantes utilizar las sentencias que se detallan a continuación 

INSERT INTO PACIENTES VALUES 
('22897576R', "PÉREZ GARCÍA, CARLOS", '646787987', 'ASISA'),
('19887234W', "GUTIÉRREZ CAMACHO, ANTONIO", '646678986', 'CASER'),
('71515623A', "MARTÍNEZ HEREDIA, PACO", '646234127', 'SANITAS'),
('55524632J', "RUIZ SEÑOR, RAFAEL", '687565454', 'SANITAS'),
('33788976F', "LÁZARO PEDRÓS , MARÍA", '690343434', 'ASISA'),
('79876867X', "SERRA TORNER, LUISA", '696340929', 'DKV'),
('44787345H', "TUSET BOADA, CARLOS", '623758940', 'CASER');

INSERT INTO ESPECIALIDADES VALUES
    (1, 'GENERALISTA'),
    (2, 'TRAUMATOLOGIA'),
    (3, 'CARDIOLOGIA'),
    (4, 'NEUMOLOGIA');

INSERT INTO DOCTORES VALUES
('23456398F',   'GÓMEZ DAVID, ADRIÁN', 1, '646768454'),     
('25349857H',   'BURGOS CASA, CANDY', 2, '659758476'),
('22909456Y',   'HERAS PRADO, ANTONIA', 1, '676234598'),
('55776898K',   'RAMÓN CORONADO,LUIS', 4, '654364736'),
('88647389P',   'DOMÍNGUEZ GÓMEZ, MANUEL', 1, '623787343'),
('22888444O',   'MATEO DÍAZ, RAMÓN', 3, '659876457'),
('78988484B',   'CONRADO ALONSO, JOSE', 2, '645878745');

INSERT INTO TIPOS_ANALISIS VALUES
    (1, 'SANGRE BÁSICO'),
    (2, 'SANGRE COMPLETO'),
    (3, 'ORINA BÁSICO'),
    (4, 'ORINA COMPLETO'),
    (5, 'HECES BÁSICO'),
    (6, 'HECES COMPLETO');

INSERT INTO PETICIONES VALUES
   (  1, "2008-01-03", 2, '71515623A',  '23456398F'),
   (  2, "2008-05-10", 2, '33788976F',	'55776898K'),
   (  3, "2008-05-08", 3, '79876867X',	'23456398F'),
   (  4, "2008-05-11", 4, '44787345H',	'55776898K'),
   (  5, "2008-05-12", 2, '19887234W',	'25349857H'),  
   (  6, "2008-05-05", 4, '22897576R',	'55776898K'),
   (  7, "2008-03-15", 5, '44787345H',	'88647389P'),  
   (  8, "2008-03-19", 1, '71515623A',	'23456398F'),
   (  9, "2008-03-26", 2, '71515623A',	'78988484B'),  
   ( 10, "2008-03-15", 2, '19887234W',	'88647389P'),  
   ( 11, "2008-03-15", 3, '33788976F',	'55776898K'),
   ( 12, "2008-03-26", 2, '44787345H',	'23456398F');

-- Comprobar mediante SELECTS que se han insertado las filas
select count(*) from pacientes;         -- 7
select count(*) from especialidades;    -- 4
select count(*) from doctores;          -- 7
select count(*) from tipos_analisis;    -- 6
select count(*) from peticiones;        -- 12