-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-03-2020 a las 10:52:44
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
-- Base de datos: `bomberos`
--
CREATE DATABASE IF NOT EXISTS `bomberos` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `bomberos`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bombero`
--

CREATE TABLE `bombero` (
  `id` int(10) UNSIGNED NOT NULL,
  `parque_id` int(10) UNSIGNED NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `dni` varchar(10) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono` varchar(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `bombero`
--

INSERT INTO `bombero` (`id`, `parque_id`, `apellidos`, `nombre`, `dni`, `fecha_nacimiento`, `direccion`, `telefono`) VALUES
(1, 1, 'Gil García', 'Juan', '31456654', '1965-08-11', 'C/Clavel, 45 1º B', '609343434'),
(2, 1, 'Tinoco Sánchez', 'Borja', '31777666', '1980-09-22', 'C/Bizcocheros, 4', '956111111'),
(3, 1, 'Hernádez González', 'María', '31424242', '1979-04-01', 'Urb. Zafer, Bq. 4, 4ºA', '856380138'),
(4, 1, 'Martínez De Tena', 'José', '31002304', '1970-11-08', 'C/Túnez, 27 Bajo', '956123456'),
(5, 1, 'Verdugo Benítez', 'Manuel', '31112233', '1972-12-31', 'C/Larga, 83', '628123456'),
(6, 1, 'Becerra Corchado', 'Eva María', '30760231', '1975-02-28', 'C/Porvenir, 3', '628921479'),
(7, 2, 'Aguilar Gil', 'Juan José', '31839932', '1963-03-04', 'C/Los Angeles, 40', '956640054'),
(8, 2, 'Piñero Fernández', 'José Ramón', '31453672', '1962-03-21', 'C/Sevilla, 32', '956640152'),
(9, 2, 'Quirós Pérez', 'Cristóbal', '31888888', '1967-08-20', 'C/Algeciras, 20', '956640627');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coche`
--

CREATE TABLE `coche` (
  `id` int(10) UNSIGNED NOT NULL,
  `parque_id` int(10) UNSIGNED DEFAULT NULL,
  `marca` varchar(20) NOT NULL,
  `modelo` varchar(20) NOT NULL,
  `matricula` varchar(15) NOT NULL,
  `fecha_compra` date DEFAULT NULL,
  `fecha_revision` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `coche`
--

INSERT INTO `coche` (`id`, `parque_id`, `marca`, `modelo`, `matricula`, `fecha_compra`, `fecha_revision`) VALUES
(1, 1, 'La Pava', 'Grande', 'CA-4343-CJ', '2004-11-03', '2015-12-03'),
(2, 1, 'Otra más', 'Mediano', '4444-FCH', '2009-03-27', '2016-03-27'),
(3, 2, 'La Pava', 'Chico', '6754-AAA', '2010-06-10', '2014-07-11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

CREATE TABLE `equipo` (
  `servicio_id` int(10) UNSIGNED NOT NULL,
  `bombero_id` int(10) UNSIGNED NOT NULL,
  `puesto` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `equipo`
--

INSERT INTO `equipo` (`servicio_id`, `bombero_id`, `puesto`) VALUES
(1, 1, 'Chofer'),
(1, 2, 'Jefe'),
(2, 3, 'Jefe'),
(2, 5, 'Chofer'),
(3, 7, 'Chofer'),
(3, 8, 'Chofer'),
(3, 9, 'Ayudante Manguera');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parque`
--

CREATE TABLE `parque` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `poblacion` varchar(30) NOT NULL,
  `telefono` varchar(9) DEFAULT NULL,
  `categoria` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `parque`
--

INSERT INTO `parque` (`id`, `nombre`, `direccion`, `poblacion`, `telefono`, `categoria`) VALUES
(1, 'Bomberos Jerez', 'Martín Ferrador, 3', 'Jerez', '956323232', 'A'),
(2, 'Los Alcornocales', 'Carretera Algeciras-Ronda, Km 40', 'Jimena', '956640021', 'B'),
(3, 'Parque Olvera', 'C/La Pava, 3', 'Olvera', NULL, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `id` int(10) UNSIGNED NOT NULL,
  `parque_id` int(10) UNSIGNED NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `tipo_servicio` varchar(100) NOT NULL,
  `urgencia` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`id`, `parque_id`, `fecha`, `hora`, `tipo_servicio`, `urgencia`) VALUES
(1, 1, '2015-09-12', '10:00:00', 'Inundación C/ Clavel', 7),
(2, 1, '2015-10-01', '12:45:00', 'Fuego en ático Plaza Aladro', 9),
(3, 2, '2015-08-21', '17:00:00', 'Fuego en el Castillo', 10);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bombero`
--
ALTER TABLE `bombero`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bombero_FKIndex1` (`parque_id`);

--
-- Indices de la tabla `coche`
--
ALTER TABLE `coche`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coche_FKIndex1` (`parque_id`);

--
-- Indices de la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD PRIMARY KEY (`servicio_id`,`bombero_id`),
  ADD KEY `equipo_FKIndex1` (`servicio_id`),
  ADD KEY `equipo_FKIndex2` (`bombero_id`);

--
-- Indices de la tabla `parque`
--
ALTER TABLE `parque`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `servicio_FKIndex1` (`parque_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bombero`
--
ALTER TABLE `bombero`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `coche`
--
ALTER TABLE `coche`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `parque`
--
ALTER TABLE `parque`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bombero`
--
ALTER TABLE `bombero`
  ADD CONSTRAINT `bombero_ibfk_1` FOREIGN KEY (`parque_id`) REFERENCES `parque` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `coche`
--
ALTER TABLE `coche`
  ADD CONSTRAINT `coche_ibfk_1` FOREIGN KEY (`parque_id`) REFERENCES `parque` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD CONSTRAINT `equipo_ibfk_1` FOREIGN KEY (`servicio_id`) REFERENCES `servicio` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `equipo_ibfk_2` FOREIGN KEY (`bombero_id`) REFERENCES `bombero` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD CONSTRAINT `servicio_ibfk_1` FOREIGN KEY (`parque_id`) REFERENCES `parque` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
