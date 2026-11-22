-- Empresa Limpieza 
-- Date: 202204 (sesion 14)
-- Autor: Juan Gago
-- File: ddl.sql

create database sqlinicial;

CREATE TABLE Limpiadores(
  NIF_L CHARACTER(9) NOT NULL,
  Nombre_L CHARACTER(50),
  Domicilio_L CHARACTER(50),
  Telefono_L CHARACTER(9),
  PRIMARY KEY (NIF_L));

INSERT Limpiadores VALUES
    ('11111111A', 'Francisco Martínez', 'Calle de Fran','111111111'),
    ('22222222B', 'Francisco de Haro', 'Calle de Paco','222222222'),
    ('33333333C', 'Carmen', 'Calle de Carmen',NULL),
    ('44444444D', 'Gran Luque', 'Calle del Gran Luque',''),
    ('55555555E', 'Dieguito Gay', 'Calle de Dieguito',NULL),
    ('66666666F', 'Dieguito Gay', 'dsfadf','999999999');

-- clientes
CREATE TABLE Clientes(
  NIF_Cli CHARACTER(9) NOT NULL,
  Nombre_Cli CHARACTER(50),
  Actividad_Cli CHARACTER(50),
  Domicilio_Cli CHARACTER(50),
  PRIMARY KEY (NIF_Cli));

INSERT Clientes VALUES
    ('77777777G', 'Amalia Gallegos', 'Educación', 'Calle Profesor Mulián, 20'),
    ('88888888H', 'Amalia Martínez', 'Construcción', 'C/ Profesor Mulián, 39'),
    ('99999999I', 'Manuela Martínez', 'Sanidad', 'Calle Profesor Mulián, Edif. A, 3-3'),
    ('10101010J', 'Joaquín Gallegos', 'Educación', 'calle Profesor Mulián, nº 4-3-3'),
    ('12121212K', 'Amalia Ruiz', 'Construcción', 'Calle El ejido'),
    ('13131313L', 'Pepe Pérez', 'Sanidad', 'Calle Dil'),
    ('11111111A', 'Francisco Martínez', 'Sanidad','Calle de Fran'),
    ('22222222B', 'Francisco de Haro', 'Sanidad','Calle de Paco');

-- facturas de clientes
CREATE TABLE Facturas(
  Nro_F CHARACTER(10) NOT NULL,
  Importe_F REAL NOT NULL,
  Fecha_F DATE NOT NULL,
  Estado_F CHARACTER(20) NOT NULL,
  NIF_Cli CHARACTER(9) REFERENCES Clientes(NIF_Cli) ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY (Nro_F));

INSERT Facturas VALUES
('FP-001', 100, '2022-01-21', 'Pagada', '13131313L'),
('FP-002', 393.3, '2022-01-22', 'Devuelta', '10101010J'),
('FP-003', 939.5, '2022-01-23', 'Pagada', '88888888H'),
('FP-004', 19.93, '2022-02-21', 'Pagada', '88888888H');

INSERT Facturas VALUES
('PES-001', 203, '2022-02-23', 'Pagada', '10101010J'),
('PES-002', 456, '2022-03-24', 'Pendiente', '77777777G');

-- tabla de servicios
CREATE TABLE Servicios(
  Cod_S INTEGER NOT NULL PRIMARY KEY auto_increment,
  Nombre_S CHARACTER(50));

INSERT Servicios (Nombre_S) VALUES
('Limpiado de fachadas'),
('Limpiado lo que ve la suegra'),
('Limpiado de ventanas'),
('Limpiado de baños'),
('Limpiado de oficinas');

-- cliente contrata servicio
CREATE TABLE Contrata(
  Cod_S INTEGER NOT NULL REFERENCES Servicios(Cod_S) ON DELETE CASCADE ON UPDATE CASCADE,
  NIF_Cli CHARACTER(9) NOT NULL REFERENCES Clientes(NIF_Cli) ON DELETE CASCADE ON UPDATE CASCADE,
  Periodicidad_C CHARACTER(20),
  PRIMARY KEY (NIF_Cli,Cod_S));

INSERT Contrata VALUES
(1, '13131313L', 'Semanal'),
(1, '10101010J', 'Quincenal'),
(2, '88888888H', 'Semanal'),
(3, '88888888H', 'Diaria'),
(3, '10101010J', 'Semanal'),
(4, '77777777G', 'Semanal');

--  disponibilidad de limpiadores (es una agregacion)
CREATE TABLE Disponibilidad(
  NIF_L CHARACTER(9) NOT NULL REFERENCES Limpiadores(NIF_L) ON DELETE CASCADE ON UPDATE CASCADE,
  Cod_S INTEGER NOT NULL REFERENCES Servicios(Cod_S) ON DELETE CASCADE ON UPDATE CASCADE,
  Dia_D CHARACTER(9) NOT NULL,
  Hora_Ini_D TIME NOT NULL,
  Hora_Fin_D TIME NOT NULL,
  PRIMARY KEY(NIF_L,Cod_S,Dia_D,Hora_Ini_D,Hora_Fin_D));

INSERT Disponibilidad VALUES
('11111111A', 1, 'Lunes', '09:00:00', '10:00:00'),
('22222222B', 2, 'Lunes', '11:00:00', '12:00:00'),
('33333333C', 3, 'Martes', '09:00:00', '10:00:00'),
('44444444D', 4, 'Viernes', '16:00:00', '20:00:00'),
('44444444D', 5, 'Lunes', '10:00:00', '13:00:00'),
('55555555E', 1, 'Miércoles', '10:00:00', '15:00:00'),
('55555555E', 6, 'Jueves', '11:00:00', '17:00:00'),
('66666666F', 6, 'Jueves', '11:00:00', '17:00:00');