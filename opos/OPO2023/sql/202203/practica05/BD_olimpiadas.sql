-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-04-2017 a las 17:25:22
-- Versión del servidor: 10.1.16-MariaDB
-- Versión de PHP: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `olimpiadas`
--
CREATE DATABASE IF NOT EXISTS `olimpiadas` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `olimpiadas`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

DROP TABLE IF EXISTS `alumno`;
CREATE TABLE `alumno` (
  `instituto_id` int(11) NOT NULL,
  `id` int(2) UNSIGNED ZEROFILL NOT NULL,
  `nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `genero` enum('M','F') COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`instituto_id`, `id`, `nombre`, `fecha_nacimiento`, `genero`) VALUES
(1, 01, ' Gallego Gil, Fernando', '1994-03-24', 'M'),
(1, 02, ' Rocha Gil, Lidia', '1994-02-02', 'F'),
(1, 03, ' Gómez Ceballos, Mario', '1992-07-29', 'M'),
(1, 04, ' Gómez Gómez, Lidia', '1990-08-24', 'F'),
(1, 05, ' Parrado Gómez, Gabriel', '1995-07-16', 'M'),
(1, 06, ' Fernández Aragon, Lidia', '1990-09-28', 'F'),
(1, 07, ' Rocha Montiel, Alfredo', '1993-04-19', 'M'),
(1, 08, ' Fernández Ceballos, Irene', '1993-10-13', 'F'),
(1, 09, ' Sánchez del Monte, Fernando', '1997-11-26', 'M'),
(1, 10, ' Alonso Aranda, Rosa', '1999-05-31', 'F'),
(1, 11, ' Argudo Ceballos, Mario', '1994-11-01', 'M'),
(1, 12, ' Gómez Arana, Lidia', '1996-01-05', 'F'),
(2, 01, ' Fernández Pérez, Gonzalo', '1995-05-28', 'M'),
(2, 02, ' Gómez del Monte, Juana', '1998-06-08', 'F'),
(2, 03, ' Cano Ceballos, Gonzalo', '1994-09-30', 'M'),
(2, 04, ' Rodríguez Pérez, Inmaculada', '1993-03-30', 'F'),
(2, 05, ' Gómez Aguirre, Alfredo', '1997-08-14', 'M'),
(2, 06, ' Alonso del Valle, Herminia', '1996-09-05', 'F'),
(2, 07, ' García Arana, Ángel', '1994-04-17', 'M'),
(2, 08, ' Parrado Arana, Inmaculada', '1992-02-27', 'F'),
(2, 09, ' Argudo Carrasco, Mariano', '1996-05-28', 'M'),
(2, 10, ' Fernández Díaz, Lucía', '1993-05-01', 'F'),
(2, 11, ' Ávila Díaz, Gonzalo', '1993-02-17', 'M'),
(2, 12, ' Rodríguez Arana, Dolores', '1994-09-27', 'F'),
(3, 01, ' Acevedo del Valle, Moisés', '1997-08-24', 'M'),
(3, 02, ' Ávila Gil, Lorena', '1998-07-24', 'F'),
(3, 03, ' Castilla Carrasco, Juan', '1997-08-19', 'M'),
(3, 04, ' López Carrasco, Inmaculada', '1992-06-06', 'F'),
(3, 05, ' Castilla Aguirre, Lorenzo', '1992-12-13', 'M'),
(3, 06, ' Alonso Gómez, Antonia', '1991-12-11', 'F'),
(3, 07, ' Gallego Ceballos, Moises', '1996-07-06', 'M'),
(3, 08, ' Rodríguez Aragón, Cristina', '1996-03-29', 'F'),
(3, 09, ' Álvarez Rey, Mario', '1994-02-04', 'M'),
(3, 10, ' Gómez Ceballos, Estefanía', '1999-05-24', 'F'),
(3, 11, ' López Carrasco, Gabriel', '1995-09-10', 'M'),
(3, 12, ' Ávila Montiel, Isabel', '1998-02-14', 'F'),
(4, 01, ' Gallego García, Juan', '1993-07-12', 'M'),
(4, 02, ' Alonso Aranda, María', '1996-11-20', 'F'),
(4, 03, ' Gallego Gil, Luis', '1995-06-22', 'M'),
(4, 04, ' Acevedo Aranda, Lucía', '1994-03-30', 'F'),
(4, 05, ' Argudo Gil, Moisés', '1996-05-06', 'M'),
(4, 06, ' Domínguez del Río, Rosa', '1994-06-04', 'F'),
(4, 07, ' Rodríguez Montiel, Juan', '1997-09-23', 'M'),
(4, 08, ' Castilla Aragón, Herminia', '1994-07-05', 'F'),
(4, 09, ' Fernández Gallego, Ángel', '1999-07-22', 'M'),
(4, 10, ' Cano Borrego, Raquel', '1996-06-04', 'F'),
(4, 11, ' López Pérez, José', '1998-04-11', 'M'),
(4, 12, ' Muñoz Pérez, María', '1997-12-08', 'F'),
(5, 01, ' Morales Díaz, Ángel', '1990-06-18', 'M'),
(5, 02, ' Garcia Fernandez, Herminia', '1992-07-06', 'F'),
(5, 03, ' Sánchez del Castillo, Juan José', '1993-12-05', 'M'),
(5, 04, ' Acevedo Díaz, Luisa', '1997-03-04', 'F'),
(5, 05, ' Acevedo Gallego, Ramón', '1997-03-05', 'M'),
(5, 06, ' Castilla del Campo, Rosa', '1991-09-03', 'F'),
(5, 07, ' Alonso Montiel, Luis', '1995-09-05', 'M'),
(5, 08, ' Álvarez Carrasco, Teresa', '1996-02-23', 'F'),
(5, 09, ' Rodríguez Aguirre, Gabriel', '1993-12-18', 'M'),
(5, 10, ' Sanjuán Gallego, Lucía', '1997-01-11', 'F'),
(5, 11, ' Álvarez Rey, Gonzalo', '1993-01-01', 'M'),
(5, 12, ' Castilla Arana, Juana', '1997-09-05', 'F'),
(6, 01, ' Gómez Aguirre, Juan Antonio', '1994-06-19', 'M'),
(6, 02, ' Cano Gil, Antonia', '1997-07-22', 'F'),
(6, 03, ' Castilla Rodríguez, Alejo', '1994-11-24', 'M'),
(6, 04, ' Sánchez Sánchez, Ángeles', '1993-05-10', 'F'),
(6, 05, ' López Ceballos, Fermín', '1997-06-03', 'M'),
(6, 06, ' Morales Aragonés, María José', '1997-04-25', 'F'),
(6, 07, ' Cano Carrasco, José Antonio', '1999-04-11', 'M'),
(6, 08, ' Rocha Gómez, Jacinta', '1990-12-02', 'F'),
(6, 09, ' Álvarez Rey, José Ramón', '1993-11-16', 'M'),
(6, 10, ' Gallego Vilanova, María del Valle', '1995-08-03', 'F'),
(6, 11, ' Cuenca Aguirre, Javier', '1999-08-18', 'M'),
(6, 12, ' Argudo Gómez, Clara', '1997-09-23', 'F'),
(7, 01, ' Domínguez Carrasco, Gonzalo', '1992-01-17', 'M'),
(7, 02, ' Rodríguez Gil, Josefa', '1997-03-23', 'F'),
(7, 03, ' Rocha Arana, Manuel', '1996-09-12', 'M'),
(7, 04, ' Lopez del Rio, Inmaculada', '1991-11-09', 'F'),
(7, 05, ' Fernández Aranda, Lorenzo', '1990-05-23', 'M'),
(7, 06, ' García Aguirre, Esperanza', '1997-03-16', 'F'),
(7, 07, ' Sánchez Aguirre, Juan Ángel', '1999-10-20', 'M'),
(7, 08, ' López Garrido, Ana María', '1991-08-07', 'F'),
(7, 09, ' Gallego Gallego, Iván', '1997-11-13', 'M'),
(7, 10, ' Lugo Aguirre, Cristina', '1993-04-21', 'F'),
(7, 11, ' Rodríguez Díaz, Juan Luis', '1999-06-24', 'M'),
(7, 12, ' Parrado Gallego, Maria', '1991-10-22', 'F'),
(8, 01, ' Argudo Aguirre, Juan', '1994-06-17', 'M'),
(8, 02, ' Álvarez Gomez, Manuela', '1997-11-15', 'F'),
(8, 03, ' Rocha Rey, Alberto', '1995-04-01', 'M'),
(8, 04, ' Lopez del Valle, Carmen', '1998-08-12', 'F'),
(8, 05, ' Alonso Fernández, José María', '1996-08-11', 'M'),
(8, 06, ' López Ceballos, Maria', '1997-03-07', 'F'),
(8, 07, ' Cano Arana, Elías', '1991-06-26', 'M'),
(8, 08, ' Castilla del Monte, Lidia', '1991-11-06', 'F'),
(8, 09, ' Hernández Aguirre, Ramon María', '1991-04-28', 'M'),
(8, 10, ' Garcia Carrasco, Almudena', '1990-07-07', 'F'),
(8, 11, ' Hernandez Aranda, Moisés', '1996-02-18', 'M'),
(8, 12, ' Lopez del Monte, Rocío', '1994-02-23', 'F');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instituto`
--

DROP TABLE IF EXISTS `instituto`;
CREATE TABLE `instituto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `representante` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `localidad_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `instituto`
--

INSERT INTO `instituto` (`id`, `nombre`, `representante`, `localidad_id`) VALUES
(1, 'Romero Vargas', 'Juana', 1),
(2, 'La Granja', 'Miguel', 1),
(3, 'Hozgarganta', 'Ana', 2),
(4, 'Bahia de Cadiz', 'Jaime', 3),
(5, 'San Valeriano', 'Alfonso', 5),
(6, 'Doñana', 'Fernando', 4),
(7, 'Kursaal', 'Alfonso', 6),
(8, 'Drago', 'María', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidad`
--

DROP TABLE IF EXISTS `localidad`;
CREATE TABLE `localidad` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `localidad`
--

INSERT INTO `localidad` (`id`, `nombre`) VALUES
(1, 'Jerez'),
(2, 'Jimena'),
(3, 'Cádiz'),
(4, 'Sanlúcar'),
(5, 'Algodonales'),
(6, 'Algeciras');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modalidad`
--

DROP TABLE IF EXISTS `modalidad`;
CREATE TABLE `modalidad` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `modalidad`
--

INSERT INTO `modalidad` (`id`, `nombre`) VALUES
(1, 'Administrativo'),
(2, 'Electrónica'),
(3, 'Informática');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `participante`
--

DROP TABLE IF EXISTS `participante`;
CREATE TABLE `participante` (
  `alumno_instituto_id` int(11) NOT NULL,
  `alumno_id` int(2) UNSIGNED ZEROFILL NOT NULL,
  `modalidad_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `participante`
--

INSERT INTO `participante` (`alumno_instituto_id`, `alumno_id`, `modalidad_id`) VALUES
(1, 01, 1),
(1, 02, 1),
(1, 03, 1),
(1, 04, 1),
(1, 05, 2),
(1, 06, 2),
(1, 07, 2),
(1, 08, 2),
(1, 09, 3),
(1, 10, 3),
(1, 11, 3),
(1, 12, 3),
(2, 01, 1),
(2, 02, 1),
(2, 03, 1),
(2, 04, 1),
(2, 05, 2),
(2, 06, 2),
(2, 07, 2),
(2, 08, 2),
(2, 09, 3),
(2, 10, 3),
(2, 11, 3),
(2, 12, 3),
(3, 01, 1),
(3, 02, 1),
(3, 03, 1),
(3, 04, 1),
(3, 05, 2),
(3, 06, 2),
(3, 07, 2),
(3, 08, 2),
(3, 09, 3),
(3, 10, 3),
(3, 11, 3),
(3, 12, 3),
(4, 01, 1),
(4, 02, 1),
(4, 03, 1),
(4, 04, 1),
(4, 05, 2),
(4, 06, 2),
(4, 07, 2),
(4, 08, 2),
(4, 09, 3),
(4, 10, 3),
(4, 11, 3),
(4, 12, 3),
(5, 01, 1),
(5, 02, 1),
(5, 03, 1),
(5, 04, 1),
(5, 05, 2),
(5, 06, 2),
(5, 07, 2),
(5, 08, 2),
(5, 09, 3),
(5, 10, 3),
(5, 11, 3),
(5, 12, 3),
(6, 01, 1),
(6, 02, 1),
(6, 03, 1),
(6, 04, 1),
(6, 05, 2),
(6, 06, 2),
(6, 07, 2),
(6, 08, 2),
(6, 09, 3),
(6, 10, 3),
(6, 11, 3),
(6, 12, 3),
(7, 01, 1),
(7, 02, 1),
(7, 03, 1),
(7, 04, 1),
(7, 05, 2),
(7, 06, 2),
(7, 07, 2),
(7, 08, 2),
(7, 09, 3),
(7, 10, 3),
(7, 11, 3),
(7, 12, 3),
(8, 01, 1),
(8, 02, 1),
(8, 03, 1),
(8, 04, 1),
(8, 05, 2),
(8, 06, 2),
(8, 07, 2),
(8, 08, 2),
(8, 09, 3),
(8, 10, 3),
(8, 11, 3),
(8, 12, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `premiado`
--

DROP TABLE IF EXISTS `premiado`;
CREATE TABLE `premiado` (
  `instituto_id` int(11) NOT NULL,
  `modalidad_id` int(11) NOT NULL,
  `puesto` enum('1','2','3') COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `premiado`
--

INSERT INTO `premiado` (`instituto_id`, `modalidad_id`, `puesto`) VALUES
(1, 1, '2'),
(1, 2, '1'),
(1, 3, '1'),
(2, 1, '3'),
(3, 1, '1'),
(3, 3, '3'),
(5, 2, '2'),
(6, 3, '2'),
(7, 2, '3');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`instituto_id`,`id`),
  ADD KEY `fk_alumno_instituto1` (`instituto_id`);

--
-- Indices de la tabla `instituto`
--
ALTER TABLE `instituto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_instituto_localidad1` (`localidad_id`);

--
-- Indices de la tabla `localidad`
--
ALTER TABLE `localidad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `modalidad`
--
ALTER TABLE `modalidad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `participante`
--
ALTER TABLE `participante`
  ADD PRIMARY KEY (`alumno_instituto_id`,`alumno_id`,`modalidad_id`),
  ADD KEY `fk_participante_alumno1` (`alumno_instituto_id`,`alumno_id`),
  ADD KEY `fk_participante_modalidad1` (`modalidad_id`);

--
-- Indices de la tabla `premiado`
--
ALTER TABLE `premiado`
  ADD PRIMARY KEY (`instituto_id`,`modalidad_id`,`puesto`),
  ADD KEY `fk_premiado_instituto1` (`instituto_id`),
  ADD KEY `fk_premiado_modalidad1` (`modalidad_id`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD CONSTRAINT `fk_alumno_instituto1` FOREIGN KEY (`instituto_id`) REFERENCES `instituto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `instituto`
--
ALTER TABLE `instituto`
  ADD CONSTRAINT `fk_instituto_localidad1` FOREIGN KEY (`localidad_id`) REFERENCES `localidad` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `participante`
--
ALTER TABLE `participante`
  ADD CONSTRAINT `fk_participante_alumno1` FOREIGN KEY (`alumno_instituto_id`,`alumno_id`) REFERENCES `alumno` (`instituto_id`, `id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_participante_modalidad1` FOREIGN KEY (`modalidad_id`) REFERENCES `modalidad` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `premiado`
--
ALTER TABLE `premiado`
  ADD CONSTRAINT `fk_premiado_instituto1` FOREIGN KEY (`instituto_id`) REFERENCES `instituto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_premiado_modalidad1` FOREIGN KEY (`modalidad_id`) REFERENCES `modalidad` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
