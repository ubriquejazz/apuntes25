-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-04-2021 a las 20:48:16
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: videoclub
--
CREATE DATABASE IF NOT EXISTS videoclub DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE videoclub;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla alquiler
--

CREATE TABLE alquiler (
  socio_id int(11) NOT NULL,
  pelicula_id int(11) NOT NULL,
  fecha_alquiler date DEFAULT NULL,
  fecha_devolucion date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla alquiler
--

INSERT INTO alquiler (socio_id, pelicula_id, fecha_alquiler, fecha_devolucion) VALUES
(1, 4, '2010-07-12', '2010-07-13'),
(1, 7, '2011-01-22', '2011-01-23'),
(2, 2, '2011-01-21', NULL),
(3, 7, '2010-09-11', '2010-09-13'),
(4, 3, '2011-01-24', NULL),
(4, 5, '2011-01-01', '2011-01-03'),
(5, 1, '2011-01-24', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla pelicula
--

CREATE TABLE pelicula (
  id int(11) NOT NULL,
  nombre varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  tema varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  anio year(4) DEFAULT NULL,
  pais varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  precio float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla pelicula
--

INSERT INTO pelicula (id, nombre, tema, anio, pais, precio) VALUES
(1, 'Felpudo Maldito', 'Comedia', 1995, 'Francia', 4),
(2, 'Two Much', 'Comedia', 1995, 'España', 3.5),
(3, 'El día de la bestia', 'Comedia', 1995, 'España', 3),
(4, 'Éxtasis', 'Drama', 1996, 'España', 4),
(5, 'Tesis', 'Suspense', 1995, 'España', 4.5),
(6, 'Apolo 13', 'Acción', 1995, 'España', 3),
(7, 'Desperado', 'Acción', 1995, 'EEUU', 3),
(8, 'Pena de muerte', 'Drama', 1996, 'EEUU', 2.5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla socio
--

CREATE TABLE socio (
  id int(11) NOT NULL,
  nombre varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  fecha_alta date DEFAULT NULL,
  telefono varchar(9) CHARACTER SET latin1 DEFAULT NULL,
  nif varchar(9) CHARACTER SET latin1 DEFAULT NULL,
  direccion varchar(100) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla socio
--

INSERT INTO socio (id, nombre, fecha_alta, telefono, nif, direccion) VALUES
(1, 'Antonio Olmo García', '2010-01-20', '645277415', '27711498D', 'Baeza 12 5A'),
(2, 'Miguel Armas Ruíz', '2010-05-23', '655232367', '28565225C', 'La Veleta, 25'),
(3, 'Antonio López Carmona', '2009-04-13', '645234562', '23106595D', 'Álamos, 23 2ºB'),
(4, 'Teresa Sánchez López', '2009-08-22', '645237648', '27148934G', 'Cerón, 3'),
(5, 'María Mármol López', '2010-12-12', '655404145', '27003478W', 'Avda. Madrid, 9, 7ºA'),
(6, 'Rafael Montoto Hoz', '2009-05-11', '655908070', '23785632G', 'La luna, 2'),
(7, 'Nuria Pérez Cano', '2010-11-02', '645121978', '23451267Q', 'Almería, 12 2ºA');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla alquiler
--
ALTER TABLE alquiler
  ADD PRIMARY KEY (socio_id,pelicula_id),
  ADD KEY pelicula_id (pelicula_id);

--
-- Indices de la tabla pelicula
--
ALTER TABLE pelicula
  ADD PRIMARY KEY (id);

--
-- Indices de la tabla socio
--
ALTER TABLE socio
  ADD PRIMARY KEY (id);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla alquiler
--
ALTER TABLE alquiler
  ADD CONSTRAINT alquiler_ibfk_1 FOREIGN KEY (socio_id) REFERENCES socio (id) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT alquiler_ibfk_2 FOREIGN KEY (pelicula_id) REFERENCES pelicula (id) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
