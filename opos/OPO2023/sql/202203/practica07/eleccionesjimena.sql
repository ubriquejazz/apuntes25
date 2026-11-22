-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-05-2021 a las 13:01:04
-- Versión del servidor: 10.1.35-MariaDB
-- Versión de PHP: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: eleccionesjimena
--
CREATE DATABASE IF NOT EXISTS eleccionesjimena DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE eleccionesjimena;

--
-- Estructura de tabla para la tabla colegio
--

CREATE TABLE colegio (
  idcolegio int(10) UNSIGNED NOT NULL,
  direccion varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla colegio
--

INSERT INTO colegio (idcolegio, direccion) VALUES
(1, 'CEIP Reina de los Angeles'),
(2, 'Casa de la Cultura Leopoldo de Luis'),
(3, 'CEIP Aljibe'),
(4, 'Casa de la Cultura Enrique Tierno Galvan'),
(5, 'CEIP Jose Luis Sanchez');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla componente
--

CREATE TABLE componente (
  dni varchar(12) NOT NULL,
  nombre varchar(45) NOT NULL,
  f_nacimiento date NOT NULL,
  cargo enum('PR','V1','V2') NOT NULL,
  mesa_letra char(1) NOT NULL,
  mesa_colegio_idcolegio int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla componente
--

INSERT INTO componente (dni, nombre, f_nacimiento, cargo, mesa_letra, mesa_colegio_idcolegio) VALUES
('01234589', 'Cristobal Espinosa Luque', '1984-01-17', 'V1', 'A', 2),
('11111111', 'Jose Manuel Castilla Gil', '1963-06-17', 'PR', 'A', 1),
('22222222', 'Adrian Luque Infante', '1983-02-14', 'V1', 'A', 1),
('23322332', 'Daniel Minguet Ruiz', '1978-06-05', 'V1', 'B', 4),
('23456123', 'Josefa Gago Almenta', '1979-09-11', 'V2', 'C', 5),
('31002003', 'Salvador Andrades Sanchez', '1950-05-23', 'V2', 'A', 3),
('31313131', 'Virginia Fernandez Aguilar', '1986-02-13', 'PR', 'A', 3),
('33334444', 'Maria Dolores Sanchez Lobato', '1979-01-01', 'V1', 'B', 2),
('41424344', 'Maria Antonia Gallego Conde', '1963-12-12', 'V1', 'A', 3),
('42556162', 'Ana Maria Ramos Andrades', '1977-07-07', 'V2', 'B', 3),
('42562222', 'Francisco Javier Garcia Lopez', '1982-03-18', 'V1', 'C', 5),
('43214321', 'Rosa Isabel Vadillo Garcia', '1970-02-04', 'PR', 'B', 5),
('44447777', 'Antonio Rubiales Marva', '1985-03-03', 'V2', 'B', 2),
('47777774', 'Ignacio Garcia Polavieja', '1981-11-11', 'PR', 'A', 4),
('52010101', 'Maria Carmen Guerrero Rejano', '1958-05-30', 'V2', 'A', 4),
('55712349', 'Jose Luis Gonzalez Tirado', '1980-11-25', 'PR', 'C', 5),
('56565656', 'Francisco Manuel Moreno Cabra', '1981-06-15', 'V2', 'B', 4),
('56789010', 'Cristobal Guerrero Villanueva', '1960-08-16', 'V2', 'A', 1),
('57890181', 'Juan Diego Vera Orega', '1988-11-18', 'V2', 'B', 1),
('61234577', 'Maria Carmen Lopez Castilla', '1970-09-12', 'PR', 'A', 2),
('61345543', 'Manuel Pons del Pino', '1959-05-30', 'PR', 'B', 4),
('65670432', 'Jose Lopez Martin', '1983-02-27', 'V2', 'A', 5),
('66666432', 'Isabel Maria Carrillo Martin', '1984-12-19', 'V1', 'A', 5),
('71000071', 'Isaac Oncala Gil', '1967-07-21', 'PR', 'B', 3),
('71006471', 'Cristobal Quiros Sanchez de Medina', '1968-08-20', 'V1', 'B', 3),
('73348901', 'Jesus Maria Pomares Maldonado', '1960-09-22', 'V2', 'B', 5),
('74449900', 'Alfonso Diaz Sanchez', '1984-12-02', 'V1', 'A', 4),
('77777777', 'Pedro Rubiales Almagro', '1965-09-21', 'PR', 'B', 1),
('81234002', 'Maria Angeles Sanchez Canias', '1974-10-26', 'PR', 'B', 2),
('81818181', 'Miguel Reyes Reyes', '1980-01-18', 'V1', 'B', 1),
('91234562', 'Martin Bueno Martin', '1974-12-25', 'V2', 'A', 2),
('92345610', 'Esther Emberley Soria', '1983-08-15', 'PR', 'A', 5),
('99553245', 'Sonia Perez Perales', '1966-06-16', 'V1', 'B', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla mesa
--

CREATE TABLE mesa (
  colegio_idcolegio int(10) UNSIGNED NOT NULL,
  letra char(1) NOT NULL,
  blancos int(11) DEFAULT NULL,
  nulos int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla mesa
--

INSERT INTO mesa (colegio_idcolegio, letra, blancos, nulos) VALUES
(1, 'A', 2, 7),
(2, 'A', 1, 3),
(3, 'A', 11, 6),
(4, 'A', 4, 4),
(5, 'A', 3, 10),
(1, 'B', 4, 9),
(2, 'B', 2, 5),
(3, 'B', 14, 13),
(4, 'B', 6, 5),
(5, 'B', 0, 5),
(5, 'C', 4, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla partido
--

CREATE TABLE partido (
  siglas varchar(15) NOT NULL,
  lider varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla partido
--

INSERT INTO partido (siglas, lider) VALUES
('IU-LV-CA', 'Francisco Gomez'),
('PA', 'Jose Antonio Castilla'),
('PP', 'Francisco Pineda'),
('PSOE', 'Pascual Collado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla recuento
--

CREATE TABLE recuento (
  mesa_colegio_idcolegio int(10) UNSIGNED NOT NULL,
  mesa_letra char(1) NOT NULL,
  partido_siglas varchar(15) NOT NULL,
  votos int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla recuento
--

INSERT INTO recuento (mesa_colegio_idcolegio, mesa_letra, partido_siglas, votos) VALUES
(1, 'A', 'IU-LV-CA', 86),
(1, 'A', 'PA', 41),
(1, 'A', 'PP', 249),
(1, 'A', 'PSOE', 183),
(1, 'B', 'IU-LV-CA', 95),
(1, 'B', 'PA', 52),
(1, 'B', 'PP', 221),
(1, 'B', 'PSOE', 209),
(2, 'A', 'IU-LV-CA', 40),
(2, 'A', 'PA', 28),
(2, 'A', 'PP', 117),
(2, 'A', 'PSOE', 123),
(2, 'B', 'IU-LV-CA', 67),
(2, 'B', 'PA', 28),
(2, 'B', 'PP', 133),
(2, 'B', 'PSOE', 153),
(3, 'A', 'IU-LV-CA', 101),
(3, 'A', 'PA', 45),
(3, 'A', 'PP', 233),
(3, 'A', 'PSOE', 209),
(3, 'B', 'IU-LV-CA', 109),
(3, 'B', 'PA', 48),
(3, 'B', 'PP', 216),
(3, 'B', 'PSOE', 186),
(4, 'A', 'IU-LV-CA', 55),
(4, 'A', 'PA', 78),
(4, 'A', 'PP', 152),
(4, 'A', 'PSOE', 193),
(4, 'B', 'IU-LV-CA', 59),
(4, 'B', 'PA', 116),
(4, 'B', 'PP', 145),
(4, 'B', 'PSOE', 186),
(5, 'A', 'IU-LV-CA', 28),
(5, 'A', 'PA', 5),
(5, 'A', 'PP', 137),
(5, 'A', 'PSOE', 97),
(5, 'B', 'IU-LV-CA', 41),
(5, 'B', 'PA', 16),
(5, 'B', 'PP', 150),
(5, 'B', 'PSOE', 134),
(5, 'C', 'IU-LV-CA', 36),
(5, 'C', 'PA', 16),
(5, 'C', 'PP', 188),
(5, 'c', 'PSOE', 126);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla colegio
--
ALTER TABLE colegio
  ADD PRIMARY KEY (idcolegio);

--
-- Indices de la tabla componente
--
ALTER TABLE componente
  ADD PRIMARY KEY (dni),
  ADD KEY fk_votante_mesa1 (mesa_letra,mesa_colegio_idcolegio);

--
-- Indices de la tabla mesa
--
ALTER TABLE mesa
  ADD PRIMARY KEY (letra,colegio_idcolegio),
  ADD KEY fk_mesa_colegio (colegio_idcolegio);

--
-- Indices de la tabla partido
--
ALTER TABLE partido
  ADD PRIMARY KEY (siglas);

--
-- Indices de la tabla recuento
--
ALTER TABLE recuento
  ADD PRIMARY KEY (mesa_colegio_idcolegio,mesa_letra,partido_siglas),
  ADD KEY fk_mesa_has_partido_partido1 (partido_siglas),
  ADD KEY fk_mesa_has_partido_mesa1 (mesa_letra,mesa_colegio_idcolegio);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla componente
--
ALTER TABLE componente
  ADD CONSTRAINT fk_votante_mesa1 FOREIGN KEY (mesa_letra,mesa_colegio_idcolegio) REFERENCES mesa (letra, colegio_idcolegio) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla mesa
--
ALTER TABLE mesa
  ADD CONSTRAINT fk_mesa_colegio FOREIGN KEY (colegio_idcolegio) REFERENCES colegio (idcolegio) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla recuento
--
ALTER TABLE recuento
  ADD CONSTRAINT fk_mesa_has_partido_mesa1 FOREIGN KEY (mesa_letra,mesa_colegio_idcolegio) REFERENCES mesa (letra, colegio_idcolegio) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT fk_mesa_has_partido_partido1 FOREIGN KEY (partido_siglas) REFERENCES partido (siglas) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
