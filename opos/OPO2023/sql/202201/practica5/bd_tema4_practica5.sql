-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-02-2022 a las 13:57:23
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
-- Base de datos: `tema4_practica5`
--
CREATE DATABASE IF NOT EXISTS `tema4_practica5` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `tema4_practica5`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugador`
--

CREATE TABLE `jugador` (
  `id` int(10) UNSIGNED NOT NULL,
  `nick` char(10) NOT NULL,
  `password` varchar(50) NOT NULL,
  `ciudad` varchar(30) DEFAULT NULL,
  `puntuacion` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `fecha_alta` date NOT NULL,
  `fecha_ultimo_acceso` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opcion`
--

CREATE TABLE `opcion` (
  `id` mediumint(11) UNSIGNED NOT NULL,
  `texto` varchar(255) NOT NULL,
  `correcta` enum('s','n') NOT NULL,
  `pregunta_id` smallint(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `opcion`
--

INSERT INTO `opcion` (`id`, `texto`, `correcta`, `pregunta_id`) VALUES
(1, '1492', 's', 1),
(2, '1570', 'n', 1),
(3, '1482', 'n', 1),
(4, 'Ucrania', 'n', 2),
(5, 'Unión Soviética', 's', 2),
(6, 'Rusia', 'n', 2),
(7, 'España', 'n', 3),
(8, 'Italia', 'n', 3),
(9, 'Inglaterra', 's', 3),
(10, 'En el siglo XII', 'n', 4),
(11, 'En el siglo XIV', 's', 4),
(12, 'En el siglo XIII', 'n', 4),
(13, 'Fernando de Magallanes', 'n', 5),
(14, 'Sir Walter Raleigh', 'n', 5),
(15, 'Marco Polo', 's', 5),
(16, '6', 's', 6),
(17, '5', 'n', 6),
(18, '8', 'n', 6),
(19, '3', 'n', 6),
(20, 'Gato', 'n', 7),
(21, 'Hijo', 'n', 7),
(22, 'Caballo', 's', 7),
(23, 'Hermano', 'n', 7),
(24, 'La estatua de Zeus en Olimpia, Grecia', 'n', 8),
(25, 'La isla de la Atlántida', 'n', 8),
(26, 'El Templo de Artemisa', 'n', 8),
(27, 'Ermita de Guía de Jerez', 's', 8),
(28, 'Griego', 'n', 9),
(29, 'Mongol', 'n', 9),
(30, 'Vicentino', 'n', 9),
(31, 'Romano', 's', 9),
(32, 'Asturias', 'n', 10),
(33, 'Burgos', 'n', 10),
(34, 'Cantabria', 's', 10),
(35, 'Valencia', 'n', 10),
(36, 'Celtas', 'n', 11),
(37, 'Cartagineses', 'n', 11),
(38, 'Fenicios', 's', 11),
(39, 'Romanos', 'n', 11),
(40, 'Vikingos', 'n', 11),
(41, 'Isabel I de Castilla', 's', 12),
(42, 'Juana II de Castilla', 'n', 12),
(43, 'Felipe III', 's', 12),
(44, 'Felipe VII', 'n', 12),
(45, 'José I', 's', 12),
(46, 'Juana I de Castilla', 's', 12),
(47, 'Carlos IV', 's', 12),
(48, 'Isabel II', 's', 12),
(49, 'Alfonso XIII', 's', 12),
(50, 'Alfoso XIV', 'n', 12),
(51, 'George Washington', 's', 13),
(52, 'Canadá', 'n', 14),
(53, 'La Antartida', 's', 14),
(54, 'Polo Norte', 'n', 14),
(58, 'Barcelona', 's', 15),
(59, 'Andalucia', 'n', 15),
(60, 'Madrid', 'n', 15),
(61, 'Herbívoros', 'n', 16),
(62, 'Carnívoros', 'n', 16),
(63, 'Omnívoros', 's', 16),
(64, 'Suma de sumas', 'n', 17),
(65, 'Producto', 's', 17),
(66, 'Division de cocientes', 'n', 17),
(67, 'Europa', 'n', 18),
(68, 'Asia', 'n', 18),
(69, 'America', 's', 18),
(70, 'Oceania', 'n', 18),
(71, 'Italia', 'n', 19),
(72, 'España', 'n', 19),
(73, 'Inglaterra', 'n', 19),
(74, 'Grecia', 's', 19),
(75, '1492', 's', 20),
(76, '1792', 'n', 20),
(77, '1692', 'n', 20),
(78, '1892', 'n', 20),
(79, 'Coles', 'n', 21),
(80, 'Tomatoes', 'n', 21),
(81, 'Marihuana', 'n', 21),
(82, 'Café', 's', 21),
(83, 'Marruecos', 'n', 22),
(84, 'Rusia', 's', 22),
(85, 'Mongolia', 'n', 22),
(86, 'Inglaterra', 'n', 22),
(87, 'Marte', 'n', 23),
(88, 'Jupiter', 'n', 23),
(89, 'La Tierra', 's', 23),
(90, 'Vensus', 'n', 23),
(91, 'Saturno', 'n', 23),
(92, 'El envio de cartas', 'n', 24),
(93, 'Los mapas', 's', 24),
(94, 'Caligrafía', 'n', 24),
(95, 'El comportamiento de las plantas', 'n', 24),
(96, 'Los plásticos', 'n', 24),
(97, 'dulce', 's', 25),
(98, 'picante', 'n', 25),
(99, 'agridulce', 'n', 25),
(100, 'insipido', 'n', 25),
(101, 'azucarado', 'n', 25),
(102, 'umami', 's', 25),
(103, 'salado', 's', 25),
(104, 'acido', 's', 25),
(105, 'insipido', 'n', 25),
(106, 'agrio', 's', 25),
(107, 'India', 's', 26),
(108, '150', 'n', 27),
(109, '149', 'n', 27),
(110, '151', 's', 27),
(111, 'ET, el extraterrestre', 's', 28),
(112, 'Batman: Arkham Knight’ para PC', 'n', 28),
(113, 'Superman 64', 'n', 28),
(114, 'Pixar', 'n', 29),
(115, 'Atari', 's', 29),
(116, 'Sega', 'n', 29),
(117, 'Donkey Kong', 's', 30),
(118, 'Super Mario Bros', 'n', 30),
(119, 'Super Mario Land', 'n', 30),
(120, '1931', 'n', 31),
(121, '1945', 'n', 31),
(122, '1889', 's', 31),
(123, 'GTA 2', 'n', 32),
(124, 'GTA Vice City', 'n', 32),
(125, 'GTA III', 's', 32),
(126, 'GTA San Andreas', 'n', 32),
(131, 'Un personaje de Pókemon', 'n', 33),
(132, 'Wismichu', 'n', 33),
(133, 'Un jugador insoportable, por lo general de corta edad.', 's', 33),
(134, 'JBalvin', 'n', 33),
(135, 'Un personaje de Final Fantasy', 'n', 34),
(136, 'Una consola de Sega', 's', 34),
(137, 'La ciudad de origen de Resident Evil', 'n', 34),
(138, 'El nombre del castillo final de Mario', 'n', 34),
(139, 'Wizards', 'n', 35),
(140, 'LastShow', 'n', 35),
(141, 'x6tence', 's', 35),
(142, 'overGame', 'n', 35),
(143, 'xPeke', 'n', 36),
(144, 'Peanut', 'n', 36),
(145, 'elMillior', 'n', 36),
(146, 'Faker', 's', 36),
(147, 'guanage', 'n', 36),
(148, 'De_dust2', 's', 37),
(149, '-5', 'n', 38),
(150, '5', 'n', 38),
(151, '10', 's', 38),
(152, 'Un doceavo', 's', 39),
(153, 'La parte contratante de la tercera parte', 'n', 39),
(154, '3/4 partes', 'n', 39),
(155, 'Faltan datos', 'n', 40),
(156, '70 céntimos', 'n', 40),
(157, '65 céntimos', 's', 40),
(158, 'Un 25%', 'n', 41),
(159, 'Un 20%', 's', 41),
(160, 'Un 75%', 'n', 41),
(161, 'No se puede saber con esos Datos', 's', 42),
(162, '33 Años', 'n', 42),
(163, '30 Años', 'n', 42),
(164, '3150', 'n', 43),
(165, '31.5', 'n', 43),
(166, '315', 's', 43),
(167, '0.315', 'n', 43),
(168, 'Los tres lados diferentes', 'n', 44),
(169, '2 lados iguales', 'n', 44),
(170, ' Los 3 lados iguales', 's', 44),
(171, 'Un ánulo recto', 'n', 44),
(172, 'Ninguno de los anteriores', 'n', 44),
(173, '300 km', 'n', 45),
(174, '100 km', 'n', 45),
(175, '500 km', 'n', 45),
(176, '150 km', 's', 45),
(177, '15 años', 'n', 46),
(178, '7 años', 's', 46),
(179, '13 años', 'n', 46),
(180, '5 años', 'n', 46),
(181, '70 Lazos', 'n', 47),
(182, '100 Lazos', 'n', 47),
(183, '40 Lazos', 's', 47),
(184, '30 Lazos', 'n', 47),
(185, '100 gramos de hierro', 's', 48),
(186, '1 kilo de plumas', 'n', 48),
(187, '1 kilo de lana', 'n', 48),
(188, '1 kilo de algodón', 'n', 48),
(189, '100 gramos de hierro', 's', 49),
(190, '1 kilo de plumas', 'n', 49),
(191, '1 kilo de lana', 'n', 49),
(192, '1 kilo de algodón', 'n', 49),
(193, '6', 's', 50),
(194, 'América Central', 'n', 51),
(195, 'África', 'n', 51),
(196, 'Asía', 's', 51),
(197, 'Grecia', 's', 52),
(198, 'Italia', 'n', 52),
(199, 'España', 'n', 52),
(200, 'Verdad', 's', 53),
(201, 'Mentira', 'n', 53),
(202, 'A veces', 'n', 53),
(203, 'Chipre', 'n', 54),
(204, 'Serbia', 's', 54),
(205, 'Egipto', 'n', 54),
(206, 'Amazonas', 'n', 55),
(207, 'Yangtsé', 'n', 55),
(208, 'Nilo', 's', 55),
(209, 'Rusia', 'n', 56),
(210, 'Indonesia', 'n', 56),
(211, 'India', 's', 56),
(212, 'China', 'n', 56),
(213, 'Gran Bretaña', 's', 57),
(214, 'Rusia', 'n', 57),
(215, 'Canadá', 'n', 57),
(216, 'México', 'n', 57),
(217, '5', 'n', 58),
(218, '6', 's', 58),
(219, '11', 'n', 58),
(220, '7', 'n', 58),
(221, 'China e India', 'n', 59),
(222, 'Nepal e India', 'n', 59),
(223, 'China y Nepal', 's', 59),
(224, 'China y Rusia', 'n', 59),
(225, 'América del Norte', 'n', 60),
(226, 'La Antártida', 's', 60),
(227, 'América del Sur', 'n', 60),
(228, 'Asia', 'n', 60),
(229, 'China', 'n', 60),
(230, 'Barcelona', 's', 61),
(231, 'Cádiz', 'n', 61),
(232, 'Madrid', 's', 61),
(233, 'Valencia', 's', 61),
(234, 'Murcia', 'n', 61),
(235, 'Palma de Mallorca', 'n', 61),
(236, 'Sevilla', 's', 61),
(237, 'Bilbao', 'n', 61),
(238, 'Zaragoza', 's', 61),
(239, 'Malaga', 'n', 61),
(240, 'Baikal', 's', 62),
(241, 'Célula', 's', 63),
(242, 'Partícula', 'n', 63),
(243, 'Tejido', 'n', 63),
(244, 'Mitosis', 's', 64),
(245, 'Meiosis', 'n', 64),
(246, 'Segregación', 'n', 64),
(247, 'En la membrana', 'n', 65),
(248, 'En el citoplasma', 'n', 65),
(249, 'En el nucleo', 's', 65),
(250, 'Por la piel', 'n', 66),
(251, 'Pulmones', 's', 66),
(252, 'Branquias', 'n', 66),
(253, 'ARN (ácido ribonucleico)', 'n', 67),
(254, 'Proteínas', 'n', 67),
(255, 'ADN (ácido desoxirribonucleico)', 's', 67),
(256, 'Burro', 'n', 68),
(257, 'Asno', 'n', 68),
(258, 'Yegüita', 'n', 68),
(259, 'Mulo', 's', 68),
(260, 'Fruta', 's', 69),
(261, 'Hortaliza', 'n', 69),
(262, 'Verdura', 'n', 69),
(263, 'Legumbre', 'n', 69),
(264, 'Normal', 'n', 70),
(265, 'Gravedad', 's', 70),
(266, 'Rozamiento', 'n', 70),
(267, 'AntiGravitatoria', 'n', 70),
(268, 'Teorema Pitágoras', 'n', 71),
(269, 'Creacionismo', 'n', 71),
(270, 'Gradualismo', 'n', 71),
(271, 'Darwinismo', 's', 71),
(272, 'Haluros', 'n', 72),
(273, 'Gases nobles', 's', 72),
(274, 'Minerales', 'n', 72),
(275, 'Excepciones', 'n', 72),
(276, '300,000 Km/s', 's', 73),
(277, '300,000 m/s', 'n', 73),
(278, '30,000 km/h', 'n', 73),
(279, '3x10^2', 'n', 73),
(280, '30 km/h', 'n', 73),
(281, 'Ahogamiento', 'n', 74),
(282, 'Enf. Cardiovasculares', 's', 74),
(283, 'Demencia', 's', 74),
(284, 'Alcohol', 'n', 74),
(285, 'Parkinson', 'n', 74),
(286, 'Enf. Respiratorias', 's', 74),
(287, 'Homicidio', 'n', 74),
(288, 'Cáncer', 's', 74),
(289, 'Meningitis', 'n', 74),
(290, 'Diabetes', 's', 74),
(291, 'Ultravioleta', 's', 75),
(292, 'Ultravioleta', 'n', 76),
(293, 'papa', 'n', 76),
(294, 'manuel', 's', 76),
(295, 'Ninguno', 'n', 77),
(296, 'Todos', 'n', 77),
(297, 'Los que hayan estudiado y asistido a clase', 's', 77);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pregunta`
--

CREATE TABLE `pregunta` (
  `id` smallint(11) UNSIGNED NOT NULL,
  `texto` varchar(255) NOT NULL,
  `tema_id` tinyint(2) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pregunta`
--

INSERT INTO `pregunta` (`id`, `texto`, `tema_id`) VALUES
(1, '¿En qué año Cristóbal Colón descubrió América?', 1),
(2, '¿Qué país encabezaba Joseph Stalin?', 1),
(3, '¿En qué país se originó la Carta Magna?', 1),
(4, '¿En qué siglo la peste bubónica arrasó Europa?', 1),
(5, '¿Cuál es el nombre del primer explorador occidental en llegar a China?', 1),
(6, '¿Cuántas veces se casó Enrique VIII?', 1),
(7, 'El emperador Calígula nombró senador a su...', 1),
(8, '¿Cuál de estas no es una de las 7 maravillas del mundo antiguo?', 1),
(9, '¿El antiguo Egipto fue conquistado en el año 30 a.C. por cuál imperio?', 1),
(10, '¿En qué província española se encuentran ubicadas las cuevas de Altimira?', 1),
(11, '¿Quién fundó Gadir (la actual Cádiz), aproximadamente en el 1104 a.C.?', 1),
(12, '¿Reyes de España?', 1),
(13, '¿Cómo se llamaba el primer Presidente de los Estados Unidos?', 1),
(14, '¿Cuál es el lugar más frío de la tierra?', 2),
(15, '¿Dónde se encuentra la Sagrada Familia?', 2),
(16, '¿Qué son los humanos: omnívoros, herbívoros o carnívoros?', 2),
(17, '¿Cómo se denomina el resultado de la multiplicación?', 2),
(18, '¿En qué continente está Ecuador?', 2),
(19, '¿Dónde originaron los juegos olímpicos?', 2),
(20, '¿Qué año llegó Cristóbal Colón a América?', 2),
(21, '¿Qué producto cultiva más Guatemala?', 2),
(22, '¿Cuál es el país más grande del mundo?', 2),
(23, '¿Cuál es tercer planeta en el sistema solar con respecto al sol?', 2),
(24, '¿En qué se especializa la cartografía? Es la ciencia que estudia:', 2),
(25, '¿Sabores Primarios?', 2),
(26, '¿En qué país se encuentra el famoso monumento Taj Mahal?(Escribe solo el país)', 2),
(27, '¿Cuántos Pókemon tenían las versiones azul, roja y amarilla?', 3),
(28, '¿Cuál título ha sido proclamado como el ‘peor videojuego de la historia’?', 3),
(29, '¿Para qué compañía de videojuegos trabajó Steve Jobs de Apple?', 3),
(30, '¿En qué juego apareció por primera vez Mario Bros?', 3),
(31, '¿En qué año fue fundada la empresa Nintendo?', 3),
(32, '¿Cuál fue la primera versión en 3D de ‘Grand Theft Auto’?', 3),
(33, '¿Qué es un ‘niño rata’?', 3),
(34, 'Dreamcast es:', 3),
(35, 'Primer equipo Español en llegar lejos en una competición mundial de CS', 3),
(36, 'Jugador mas veces TOP 1 del mundo en League Of Legends', 3),
(37, 'Nombre del mapa mas jugado de CS en la historia. (Escribe de_)', 3),
(38, 'Si 10 + x es 5 más que 10, ¿cuál es el valor de 2x?', 4),
(39, '¿Cuánto es la cuarta parte de la tercera parte?', 4),
(40, 'Si compro un bolígrafo y un lápiz me cobran 1€. Si el bolígrafo cuesta 30 céntimos más que el lápiz, ¿cuánto cuesta el bolígrafo?', 4),
(41, '¿Cuánto habrá que rebajar un producto para que valga lo mismo que valía antes de que incrementase un 25% su precio?', 4),
(42, 'Hay 165 ovejas y 5 perros en un rebaño, ¿cuántos años tiene el pastor?', 4),
(43, '¿Cuál es el resultado de 3,15 X 100?', 4),
(44, 'Un triángulo equilátero tiene…', 4),
(45, '¿Qué distancia recorrerá un coche en tres horas si va a 50 Km/h?', 4),
(46, 'Juan tiene 10 años, Marcos tienes 5 más que Juan y Pepito tiene 3 menos que Juan. ¿Cuántos años tiene Pepito?', 4),
(47, 'Tengo 20 metros de cinta roja para hacer lazos en unos paquetes de regalo idénticos. Para cada lazo necesito 50 centímetros de cinta. ¿Cuántos lazos puedo hacer?', 4),
(48, '¿Qué es más ligero?', 4),
(49, '¿Qué es más ligero?', 4),
(50, '¿Cuántos lados tiene un hexágono? (Escriba un dígito)', 4),
(51, 'El gran desierto de Gobi se ubica en...', 5),
(52, '¿En qué país se ubican las ruinas de Esparta?', 5),
(53, 'En La Antártida no hay residentes permanentes.', 5),
(54, '¿Cuál de estos países no tiene acceso al Mar Mediterráneo?', 5),
(55, '¿Cuál es el rió más largo del mundo?', 5),
(56, '¿Qué país es el segundo más grande del mundo en términos de población?', 5),
(57, '¿Cuál de estos países es bañado únicamente por un océano?', 5),
(58, '¿Cuántos continentes hay en la Tierra?', 5),
(59, '¿En qué frontera se encuentra el Everest?', 5),
(60, '¿Cuál es la parte más seca de la Tierra?', 5),
(61, '¿Cuales son las 5 ciudades mas pobladas de España?', 5),
(62, '¿Cuál es el lago más profundo del mundo?', 5),
(63, '¿Cómo se llama el componente mínimo que forma a los seres vivos?', 6),
(64, 'El proceso por el que una célula se divide para formar dos células hijas se llama:', 6),
(65, 'La información genética en las células se localiza:', 6),
(66, '¿Con qué respira una ballena?', 6),
(67, 'Los cromosomas están formados por:', 6),
(68, 'Al descendiente del cruce de un asno y una yegua se le conoce como:', 6),
(69, 'Para los botánicos, el tomate es una:', 6),
(70, 'La fuerza física que la tierra ejerce sobre los cuerpos hacia su centro es la:', 6),
(71, '¿Cómo se llama la teoría que considera que todos los organismos descendemos del mismo ancestro?', 6),
(72, 'La columna más a la derecha de la tabla periódica esta compuesta por: x', 6),
(73, 'La velocidad a la que viaja la luz es', 6),
(74, 'Principales causas de muerte en el mundo', 6),
(75, '¿Qué tipo de radiación te produce quemaduras?', 6),
(76, '¿Como se llama mi padre', NULL),
(77, '¿Cuántos alumnos van a aprobar este examen', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tema`
--

CREATE TABLE `tema` (
  `id` tinyint(11) UNSIGNED NOT NULL,
  `texto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tema`
--

INSERT INTO `tema` (`id`, `texto`) VALUES
(1, 'Historia'),
(2, 'Cultura'),
(3, 'Gaming'),
(4, 'Matemáticas'),
(5, 'Geografía'),
(6, 'Ciencia');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `jugador`
--
ALTER TABLE `jugador`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `opcion`
--
ALTER TABLE `opcion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pregunta_id` (`pregunta_id`);

--
-- Indices de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tema_id` (`tema_id`);

--
-- Indices de la tabla `tema`
--
ALTER TABLE `tema`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `opcion`
--
ALTER TABLE `opcion`
  MODIFY `id` mediumint(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=298;

--
-- AUTO_INCREMENT de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  MODIFY `id` smallint(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT de la tabla `tema`
--
ALTER TABLE `tema`
  MODIFY `id` tinyint(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `opcion`
--
ALTER TABLE `opcion`
  ADD CONSTRAINT `opcion_ibfk_1` FOREIGN KEY (`pregunta_id`) REFERENCES `pregunta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD CONSTRAINT `pregunta_ibfk_1` FOREIGN KEY (`tema_id`) REFERENCES `tema` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
