-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 05-05-2020 a las 13:45:19
-- Versión del servidor: 10.1.35-MariaDB
-- Versión de PHP: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: feria
--
CREATE DATABASE IF NOT EXISTS feria DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE feria;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla calle
--

CREATE TABLE calle (
  idcalle int(11) NOT NULL,
  nombre varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla calle
--

INSERT INTO calle (idcalle, nombre) VALUES
(1, 'Paseo de las Palmeras'),
(2, 'Calle Lola Flores'),
(3, 'Calle \"Tio Borrico\"'),
(4, 'Calle El Sordera');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla caseta
--

CREATE TABLE caseta (
  numero int(3) UNSIGNED ZEROFILL NOT NULL DEFAULT '000',
  nombre varchar(45) NOT NULL,
  titular varchar(60) DEFAULT NULL,
  m2 float DEFAULT NULL,
  calle_idcalle int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla caseta
--

INSERT INTO caseta (numero, nombre, titular, m2, calle_idcalle) VALUES
(001, 'Los Pollitos', 'Pepe', 100.2, 1),
(074, 'La Vera Cruz', 'Antonio', 200, 2),
(102, 'El Cherokee', 'pepe perez', 90, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla caseta_has_consumicion
--

CREATE TABLE caseta_has_consumicion (
  caseta_numero int(3) UNSIGNED ZEROFILL NOT NULL,
  consumicion_idconsumicion int(11) NOT NULL,
  precio float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla caseta_has_consumicion
--

INSERT INTO caseta_has_consumicion (caseta_numero, consumicion_idconsumicion, precio) VALUES
(001, 1, 5.25),
(001, 2, 6),
(001, 3, 3.25),
(001, 4, 4),
(074, 1, 6),
(074, 2, 10),
(074, 3, 3.5),
(074, 4, 2.75);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla caseta_has_socio
--

CREATE TABLE caseta_has_socio (
  caseta_numero int(3) UNSIGNED ZEROFILL NOT NULL,
  socio_dni varchar(9) NOT NULL,
  numero_pases int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla caseta_has_socio
--

INSERT INTO caseta_has_socio (caseta_numero, socio_dni, numero_pases) VALUES
(001, '11111111A', 10),
(001, '22222222B', 20),
(074, '11111111A', 2),
(074, '33333333C', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla consumicion
--

CREATE TABLE consumicion (
  idconsumicion int(11) NOT NULL,
  nombre varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla consumicion
--

INSERT INTO consumicion (idconsumicion, nombre) VALUES
(1, 'Tortilla de Papas'),
(2, 'Media de Rebujito'),
(3, 'Pimientos fritos'),
(4, 'Serranito');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla premio
--

CREATE TABLE premio (
  descripcion varchar(45) NOT NULL,
  caseta_numero int(3) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla premio
--

INSERT INTO premio (descripcion, caseta_numero) VALUES
('Segundo Premio', 001),
('Primer Premio', 074),
('Tercer Premio', 102);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla socio
--

CREATE TABLE socio (
  dni varchar(9) NOT NULL,
  apellidos varchar(45) NOT NULL,
  nombre varchar(45) NOT NULL,
  tfno varchar(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla socio
--

INSERT INTO socio (dni, apellidos, nombre, tfno) VALUES
('11111111A', 'perez sanchez', 'pedro', '956478930'),
('22222222B', 'sanchez reina', 'jose', '956777777'),
('33333333C', 'pena sanchez', 'diana', '999999999');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla calle
--
ALTER TABLE calle
  ADD PRIMARY KEY (idcalle);

--
-- Indices de la tabla caseta
--
ALTER TABLE caseta
  ADD PRIMARY KEY (numero),
  ADD KEY fk_caseta_calle_idx (calle_idcalle);

--
-- Indices de la tabla caseta_has_consumicion
--
ALTER TABLE caseta_has_consumicion
  ADD PRIMARY KEY (caseta_numero,consumicion_idconsumicion),
  ADD KEY fk_caseta_has_consumicion_consumicion1_idx (consumicion_idconsumicion),
  ADD KEY fk_caseta_has_consumicion_caseta1_idx (caseta_numero);

--
-- Indices de la tabla caseta_has_socio
--
ALTER TABLE caseta_has_socio
  ADD PRIMARY KEY (caseta_numero,socio_dni),
  ADD KEY fk_caseta_has_socio_socio1_idx (socio_dni),
  ADD KEY fk_caseta_has_socio_caseta1_idx (caseta_numero);

--
-- Indices de la tabla consumicion
--
ALTER TABLE consumicion
  ADD PRIMARY KEY (idconsumicion);

--
-- Indices de la tabla premio
--
ALTER TABLE premio
  ADD PRIMARY KEY (caseta_numero);

--
-- Indices de la tabla socio
--
ALTER TABLE socio
  ADD PRIMARY KEY (dni);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla caseta
--
ALTER TABLE caseta
  ADD CONSTRAINT fk_caseta_calle FOREIGN KEY (calle_idcalle) REFERENCES `calle` (idcalle) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla caseta_has_consumicion
--
ALTER TABLE caseta_has_consumicion
  ADD CONSTRAINT fk_caseta_has_consumicion_caseta1 FOREIGN KEY (caseta_numero) REFERENCES caseta (numero) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT fk_caseta_has_consumicion_consumicion1 FOREIGN KEY (consumicion_idconsumicion) REFERENCES consumicion (idconsumicion) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla caseta_has_socio
--
ALTER TABLE caseta_has_socio
  ADD CONSTRAINT fk_caseta_has_socio_caseta1 FOREIGN KEY (caseta_numero) REFERENCES caseta (numero) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT fk_caseta_has_socio_socio1 FOREIGN KEY (socio_dni) REFERENCES socio (dni) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla premio
--
ALTER TABLE premio
  ADD CONSTRAINT fk_premio_caseta1 FOREIGN KEY (caseta_numero) REFERENCES caseta (numero) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
