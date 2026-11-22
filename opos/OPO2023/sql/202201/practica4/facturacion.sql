-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-02-2018 a las 10:09:09
-- Versión del servidor: 10.1.16-MariaDB
-- Versión de PHP: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: facturacion
--
CREATE DATABASE IF NOT EXISTS facturacion DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE facturacion;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla articulo
--

CREATE TABLE articulo (
  `codigo` varchar(30) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text,
  `precio` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncar tablas antes de insertar articulo
--

TRUNCATE TABLE articulo;
--
-- Volcado de datos para la tabla articulo
--

INSERT INTO articulo (codigo, nombre, descripcion, precio) VALUES
('A1', 'Artículo 1', 'Bla bla 1', 10),
('A2', 'Artículo 2', 'Bla bla 2', 20),
('A3', 'Artículo 3', 'Bla bla 3', 30),
('A4', 'Artículo 4', 'Bla bla 4', 40),
('A5', 'Artículo 5', 'Bla bla 5', 50),
('A6', 'Artículo 6', 'Bla bla 6', 60),
('A7', 'Artículo 7', 'Bla bla 7', 70);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla cliente
--

CREATE TABLE cliente (
  `id` smallint(3) UNSIGNED NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `nif` char(9) NOT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `poblacion` varchar(40) DEFAULT 'Jerez',
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncar tablas antes de insertar cliente
--

TRUNCATE TABLE cliente;
--
-- Volcado de datos para la tabla cliente
--

INSERT INTO cliente (id, nombre, nif, fecha_alta, poblacion, email) VALUES
(1, 'Cliente1', 'nif1', '2018-02-18 15:16:56', 'Jerez', 'cliente1@hotmail.com'),
(2, 'Cliente2', 'nif2', '2018-02-18 15:16:56', 'Cádiz', NULL),
(3, 'Cliente3', 'nif3', '2018-02-18 15:17:22', 'Jerez', 'cliente3@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla detalle
--

CREATE TABLE detalle (
  `numero_factura` mediumint(7) NOT NULL,
  `id` smallint(3) UNSIGNED NOT NULL,
  `codigo_articulo` varchar(30) NOT NULL,
  `cantidad` tinyint(2) UNSIGNED NOT NULL,
  `precio` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncar tablas antes de insertar detalle
--

TRUNCATE TABLE detalle;
--
-- Volcado de datos para la tabla detalle
--

INSERT INTO detalle (numero_factura, id, codigo_articulo, cantidad, precio) VALUES
(1, 1, 'A1', 2, 10),
(1, 2, 'A4', 1, 40),
(2, 1, 'A4', 10, 40),
(3, 1, 'A2', 1, 20),
(3, 2, 'A4', 2, 40),
(4, 1, 'A1', 1, 10),
(4, 2, 'A3', 3, 30),
(4, 3, 'A5', 1, 50),
(4, 4, 'A6', 2, 60);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla factura
--

CREATE TABLE factura (
  `numero` mediumint(7) NOT NULL,
  `id_cliente` smallint(3) UNSIGNED NOT NULL,
  `forma_pago` enum('C','T') DEFAULT 'C',
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncar tablas antes de insertar factura
--

TRUNCATE TABLE factura;
--
-- Volcado de datos para la tabla factura
--

INSERT INTO factura (numero, id_cliente, forma_pago, fecha) VALUES
(1, 1, 'C', '2018-01-18'),
(2, 1, 'C', '2018-02-02'),
(3, 2, 'C', '2018-02-03'),
(4, 3, 'T', '2018-02-20');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla articulo
--
ALTER TABLE articulo
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla cliente
--
ALTER TABLE cliente
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla detalle
--
ALTER TABLE detalle
  ADD PRIMARY KEY (`numero_factura`,`id`),
  ADD KEY `codigo_articulo` (`codigo_articulo`);

--
-- Indices de la tabla factura
--
ALTER TABLE factura
  ADD PRIMARY KEY (`numero`),
  ADD KEY `factura_ibfk_1` (`id_cliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla cliente
--
ALTER TABLE cliente
  MODIFY `id` smallint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla factura
--
ALTER TABLE factura
  MODIFY `numero` mediumint(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla detalle
--
ALTER TABLE detalle
  ADD CONSTRAINT `detalle_ibfk_1` FOREIGN KEY (`numero_factura`) REFERENCES factura (`numero`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_ibfk_2` FOREIGN KEY (`codigo_articulo`) REFERENCES articulo (`CODIGO`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla factura
--
ALTER TABLE factura
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
