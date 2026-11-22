-- Club de Tenis 
-- Date: 202206 (sesion 20)
-- Autor: Juan Gago
-- File: 

create database pistas;

use pistas;

CREATE TABLE Pistas(
  Id_P INTEGER NOT NULL PRIMARY KEY auto_increment,
  Descripcion_P CHARACTER(50),
  Gradas_P BOOLEAN,
  Homologada_P BOOLEAN);

INSERT Pistas(Descripcion_P, Gradas_P,Homologada_P) VALUES
('Pistas Central',1,1),
('Pista 1',1,1),
('Pista 2',0,1),
('Pista entrenamiento',0,0),
('Pistas de niños',0,0);

CREATE TABLE Reservas(
  Id_P INTEGER NOT NULL REFERENCES Pistas(Id_P) ON DELETE CASCADE ON UPDATE CASCADE,
  Fecha_R DATE NOT NULL,
  Hora_Ini_R TIME NOT NULL,
  Hora_Fin_R TIME NOT NULL,
  Pagada_R BOOLEAN,
  Iluminacion_R BOOLEAN,
  PRIMARY KEY (Id_P, Fecha_R, Hora_Ini_R));

-- Determinante Fecha_R, Hora_Ini_R
INSERT Reservas VALUES
(1,'2022-05-30','10:00:00','11:00:00',1,0),
(1,'2022-05-31','10:00:00','11:00:00',1,0),
(1,'2022-05-30','12:00:00','13:00:00',1,0),
(2,'2022-05-30','10:00:00','11:00:00',1,0),
(2,'2022-05-31','10:00:00','11:00:00',1,0),
(2,'2022-05-30','20:00:00','21:00:00',1,1),
(3,'2022-05-30','20:00:00','21:00:00',1,1),
(3,'2022-05-31','20:00:00','21:00:00',1,1),
(3,'2022-05-30','10:00:00','11:00:00',1,0),
(4,'2022-05-30','11:00:00','12:00:00',1,0),
(4,'2022-05-30','12:00:00','13:00:00',1,0),
(4,'2022-05-30','13:00:00','14:00:00',1,0),
(4,'2022-05-31','20:00:00','21:00:00',1,1),
(5,'2022-05-30','17:00:00','18:00:00',1,0);

CREATE TABLE Socios(
  Num_S INTEGER NOT NULL PRIMARY KEY auto_increment,
  NIF_S VARCHAR(9) NOT NULL,
  Nombre_S VARCHAR(50),
  Apellidos_S VARCHAR(50),
  Direccion_S VARCHAR(50),
  Tfno_S VARCHAR(9),
  NCuenta_S  VARCHAR(21),
  Accionista_S BOOLEAN);

INSERT Socios(NIF_S, Nombre_S,Apellidos_S, Direccion_S, Tfno_S, NCuenta_S, Accionista_S) VALUES
('11111111A','Amalia','Gallegos','Calle Amalia','111111111','111111111111111111111',1),
('22222222B','Manuela','Martínez','Calle Amalia','222222222','22222222222222222222',0),
('33333333C','Mercedes','López','Calle Mercedes','333333333','33333333333333333333',0),
('44444444D','María del Mar','Martínez','Calle Mar','444444444','444444444444444444444',1),
('55555555E','Manuel','Martínez','Calle Mercedes','555555555','555555555555555555555',0),
('66666666F','Fran','García','Calle Aguadulce','666666666','666666666666666666666',0);

-- Reserva a Nombre
CREATE TABLE ANombre(
  Id_P INTEGER NOT NULL REFERENCES Reservas(Id_P) ON DELETE CASCADE ON UPDATE CASCADE,
  Fecha_R DATE NOT NULL REFERENCES Reservas(Fecha_R) ON DELETE CASCADE ON UPDATE CASCADE,
  Hora_Ini_R TIME NOT NULL REFERENCES Reservas(Hora_Ini_R) ON DELETE CASCADE ON UPDATE CASCADE,
  Num_S INTEGER NOT NULL REFERENCES Socios(Num_S) ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY(Id_P, Fecha_R, Hora_Ini_R, Num_S));

INSERT ANombre VALUES
(1,'2022-05-30','10:00:00',1),
(1,'2022-05-31','10:00:00',1),
(1,'2022-05-30','12:00:00',2),
(2,'2022-05-30','10:00:00',3),
(2,'2022-05-31','10:00:00',3),
(2,'2022-05-30','20:00:00',4),
(3,'2022-05-30','20:00:00',5),
(3,'2022-05-31','20:00:00',5),
(3,'2022-05-30','10:00:00',6),
(4,'2022-05-30','11:00:00',4),
(4,'2022-05-30','12:00:00',4),
(4,'2022-05-30','13:00:00',4),
(4,'2022-05-31','20:00:00',1),
(5,'2022-05-31','17:00:00',2);

CREATE TABLE Profes(
  NIF_Profe VARCHAR(9) NOT NULL PRIMARY KEY,
  NFed_Profe VARCHAR(6) NOT NULL,
  Nombre_Profe VARCHAR(50) NOT NULL,
  Apellidos_Profe VARCHAR(50),
  Direccion_Profe VARCHAR(50),
  Tfno_Profe VARCHAR(9));

INSERT Profes VALUES
('77777777A','AAAAAA','Paco','de Haro','Calle Paco','111111111'),
('88888888B','BBBBBB','Fran','Martínez','Calle Amalia','222222222');

-- Curso impartidos por Profe
CREATE TABLE Cursos(
  Id_C INTEGER NOT NULL PRIMARY KEY auto_increment,
  Nombre_C VARCHAR(20) NOT NULL,
  NMaxAlumnos_C INTEGER NOT NULL,
  NIF_Profe VARCHAR(9) REFERENCES Profes(NIF_Profe) ON DELETE CASCADE ON UPDATE CASCADE);

INSERT Cursos(Nombre_C, NMaxAlumnos_C, NIF_Profe) VALUES
('Adultos Grupo 1',3,'77777777A'),
('Adultos Grupo 2',3,'88888888B'),
('Veteranos Grupo 1',4,'77777777A'),
('Veteranos Grupo 2',4,'88888888B'),
('Niños Grupo 1',6,'77777777A'),
('Niños Grupo 2',6,'88888888B');

-- Agregacion Socio-Curso
CREATE TABLE SC(
  Num_S INTEGER NOT NULL REFERENCES Socios(Num_S) ON DELETE CASCADE ON UPDATE CASCADE,
  Id_C INTEGER NOT NULL REFERENCES Cursos(Id_C) ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY(Num_S,Id_C));

INSERT SC VALUES
(1,1),
(2,1),
(3,2),
(4,3),
(5,4),
(6,5),
(5,6);

-- Weak regarding to CURSO
CREATE TABLE Horario(
  Id_C INTEGER NOT NULL REFERENCES Cursos(Id_C) ON DELETE CASCADE ON UPDATE CASCADE,
  Dia VARCHAR(10) NOT NULL,
  Hora_Inicio TIME NOT NULL,
  Hora_Fin TIME NOT NULL,
  PRIMARY KEY(Id_C, Dia));

INSERT Horario VALUES
  (1,'Lunes','18:00:00','19:00:00'),
  (1,'Miércoles','18:00:00','19:00:00'),
  (2,'Martes','18:00:00','19:00:00'),
  (2,'Jueves','18:00:00','19:00:00'),
  (3,'Lunes','19:00:00','20:00:00'),
  (3,'Miércoles','19:00:00','20:00:00'),
  (4,'Martes','19:00:00','20:00:00'),
  (4,'Jueves','19:00:00','20:00:00'),
  (5,'Viernes','16:00:00','18:00:00'),
  (6,'Sábado','11:00:00','13:00:00');

CREATE TABLE Recibos(
  Num_S INTEGER NOT NULL REFERENCES Socios(Num_S) ON DELETE CASCADE ON UPDATE CASCADE,
  Id_C INTEGER NOT NULL REFERENCES Cursos(Id_C) ON DELETE CASCADE ON UPDATE CASCADE,
  Mes_R VARCHAR(10) NOT NULL,
  Anyo_R INTEGER NOT NULL,
  Pagado BOOLEAN,
  PRIMARY KEY(Num_S,Id_C,Mes_R,Anyo_R));

INSERT Recibos VALUES
(1,1,'Enero',2022,1),
(2,1,'Enero',2022,1),
(3,2,'Enero',2022,1),
(4,3,'Enero',2022,1),
(5,4,'Enero',2022,1),
(6,5,'Enero',2022,1),
(5,6,'Enero',2022,1),
(1,1,'Febrero',2022,1),
(2,1,'Febrero',2022,0),
(3,2,'Febrero',2022,1),
(4,3,'Febrero',2022,0),
(5,4,'Febrero',2022,1),
(6,5,'Febrero',2022,0),
(5,6,'Febrero',2022,0);

