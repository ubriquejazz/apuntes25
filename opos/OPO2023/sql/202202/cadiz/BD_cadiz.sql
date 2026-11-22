--
-- Estructura de tabla para la tabla `comarca`
--

CREATE TABLE comarca (
  id      INT PRIMARY KEY,
  nombre  VARCHAR2(40) NOT NULL
);

--
-- Volcado de datos para la tabla `comarca`
--

INSERT INTO comarca VALUES (1, 'La Janda');
INSERT INTO comarca VALUES (2, 'Sierra de Cádiz');
INSERT INTO comarca VALUES (3, 'Campo de Gibraltar');
INSERT INTO comarca VALUES (4, 'Bahía de Cádiz');
INSERT INTO comarca VALUES (5, 'Costa Noroeste');
INSERT INTO comarca VALUES (6, 'Campiña de Jerez');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipio`
--

CREATE TABLE municipio (
  id          INT PRIMARY KEY,
  nombre      VARCHAR2(50) NOT NULL,
  comarca_id  INT,
  poblacion   INT,
  superficie  FLOAT,
  densidad    FLOAT,
  altitud     INT,
  distancia   INT,
  gentilicio  VARCHAR2(50),
  FOREIGN KEY (comarca_id) REFERENCES comarca(id) 
);

--
-- Volcado de datos para la tabla `municipio`
--
INSERT INTO municipio VALUES (1, 'Alcalá de los Gazules', 1, 5326, 479.59, 11.21, 165, 79, 'Alcalaíno, na');
INSERT INTO municipio VALUES (2, 'Alcalá del Valle', 2, 5224, 46.89, 111.35, 628, 155, 'Alcalareño, ña');
INSERT INTO municipio VALUES (3, 'Algar', 2, 1448, 26.6, 55.71, 212, 87, 'Algareño, ña');
INSERT INTO municipio VALUES (4, 'Algeciras', 3, 118920, 85.9, 1373.39, 20, 127, 'Algecireño, ña');
INSERT INTO municipio VALUES (5, 'Algodonales', 2, 5649, 134.16, 42.32, 370, 118, 'Algodonaleño, ña');
INSERT INTO municipio VALUES (6, 'Arcos de la Frontera', 2, 31193, 527.54, 59.24, 185, 67, 'Arcense');
INSERT INTO municipio VALUES (7, 'Barbate', 1, 22808, 143.36, 159.47, 14, 64, 'Barbateño, ña');
INSERT INTO municipio VALUES (8, 'Benalup-Casas Viejas', 1, 7000, 60.7, 114.78, 112, 62, 'Benalupense');
INSERT INTO municipio VALUES (9, 'Benaocaz', 2, 720, 69.39, 10.36, 790, 113, 'Benaocaceño, ña');
INSERT INTO municipio VALUES (10, 'Bornos', 2, 7934, 54.31, 147.71, 182, 79, 'Bornicho, cha');
INSERT INTO municipio VALUES (11, 'Cádiz', 4, 120468, 12.1, 10061, 11, 0, 'Gaditano, na');
INSERT INTO municipio VALUES (12, 'Castellar de la Frontera', 3, 3045, 178.84, 17.24, 47, 137, 'Castellarense');
INSERT INTO municipio VALUES (13, 'Chiclana de la Frontera', 4, 82777, 205.45, 400.57, 11, 24, 'Chiclanero, ra');
INSERT INTO municipio VALUES (14, 'Chipiona', 5, 19062, 32.92, 577.28, 6, 60, 'Chipionero, ra');
INSERT INTO municipio VALUES (15, 'Conil de la Frontera', 1, 22136, 88.51, 249.27, 41, 40, 'Conileño, ña');
INSERT INTO municipio VALUES (16, 'El Bosque', 2, 2067, 30.75, 67.28, 285, 96, 'Bosqueño, ña');
INSERT INTO municipio VALUES (17, 'El Gastor', 2, 1809, 27.55, 65.44, 590, 131, 'Gastoreño, ña');
INSERT INTO municipio VALUES (18, 'El Puerto de Santa María', 4, 88335, 159.34, 556.67, 0, 22, 'Portuense');
INSERT INTO municipio VALUES (19, 'Espera', 2, 3915, 123.44, 31.69, 164, 82, 'Espereño, ña');
INSERT INTO municipio VALUES (20, 'Grazalema', 2, 2165, 122.41, 17.69, 812, 142, 'Grazalemeño, ña');
INSERT INTO municipio VALUES (21, 'Jerez de la Frontera', 6, 212876, 1188.23, 178.61, 56, 6, 'Jerezano, na');
INSERT INTO municipio VALUES (22, 'Jimena de la Frontera', 3, 9772, 345.66, 28.09, 99, 157, 'Jimenato, ta');
INSERT INTO municipio VALUES (23, 'La Línea de la Concepción', 3, 63352, 19.27, 3276.18, 5, 137, 'Linense');
INSERT INTO municipio VALUES (24, 'Los Barrios', 3, 23167, 331.33, 69.39, 23, 117, 'Barreño, ña');
INSERT INTO municipio VALUES (25, 'Medina-Sidonia', 1, 11749, 487, 24.22, 400, 45, 'Asidonenses');
INSERT INTO municipio VALUES (26, 'Olvera', 2, 8298, 193.57, 43.14, 643, 130, 'Olvereño, ña');
INSERT INTO municipio VALUES (27, 'Paterna de Rivera', 1, 5585, 14.01, 400.36, 127, 45, 'Paternero, ra');
INSERT INTO municipio VALUES (28, 'Prado del Rey', 2, 5819, 48.58, 121.14, 440, 105, 'Pradense');
INSERT INTO municipio VALUES (29, 'Puerto Real', 4, 41509, 195.96, 211.71, 3, 15, 'Puertorrealeño, ña');
INSERT INTO municipio VALUES (30, 'Puerto Serrano', 2, 7145, 79.85, 89.25, 168, 105, 'Portoserranense');
INSERT INTO municipio VALUES (31, 'Rota', 5, 29123, 84.01, 347.33, 9, 51, 'Roteño, ña');
INSERT INTO municipio VALUES (32, 'San Fernando', 4, 96131, 30.65, 3143.07, 25, 14, 'Isleño, ña');
INSERT INTO municipio VALUES (33, 'San José del Valle', 6, 4427, 223.87, 19.91, 143, 62, 'Vallense');
INSERT INTO municipio VALUES (34, 'San Roque', 3, 29373, 140, 210.65, 109, 130, 'Sanroqueño, ña');
INSERT INTO municipio VALUES (35, 'Sanlúcar de Barrameda', 5, 67433, 170.9, 394.29, 30, 53, 'Sanluqueño, ña');
INSERT INTO municipio VALUES (36, 'Setenil de las Bodegas', 2, 2845, 82.15, 34.77, 640, 157, 'Setenileño, ña');
INSERT INTO municipio VALUES (37, 'Tarifa', 3, 18011, 419.67, 42.67, 7, 105, 'Tarifeño, ña');
INSERT INTO municipio VALUES (38, 'Torre Alháquime', 2, 779, 17.36, 44.7, 495, 145, 'Torreño, ña');
INSERT INTO municipio VALUES (39, 'Trebujena', 5, 7072, 70, 101.29, 69, 57, 'Trebujenero, ra');
INSERT INTO municipio VALUES (40, 'Ubrique', 2, 16836, 69.75, 242.06, 330, 118, 'Ubriqueño, ña');
INSERT INTO municipio VALUES (41, 'Vejer de la Frontera', 1, 12812, 262.88, 49.06, 168, 56, 'Vejeriego, ga');
INSERT INTO municipio VALUES (42, 'Villaluenga del Rosario', 2, 471, 59.46, 7.67, 858, 128, 'Villaluenguense');
INSERT INTO municipio VALUES (43, 'Villamartín', 2, 12271, 210.3, 58.5, 167, 85, 'Villamartinense');
INSERT INTO municipio VALUES (44, 'Zahara de la Sierra', 2, 1436, 72.48, 20.14, 500, 124, 'Zahareño, ña');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedania`
--

CREATE TABLE pedania (
  id            INT PRIMARY KEY,
  nombre        VARCHAR2(50) NOT NULL,
  municipio_id  INT,
  FOREIGN KEY (municipio_id) REFERENCES municipio(id) 
);

--
-- Volcado de datos para la tabla `pedania`
--

INSERT INTO pedania VALUES (1, 'Los Albarizones', 21);
INSERT INTO pedania VALUES (2, 'La Barca de la Florida', 21);
INSERT INTO pedania VALUES (3, 'La Corta', 21);
INSERT INTO pedania VALUES (4, 'Cuartillos', 21);
INSERT INTO pedania VALUES (5, 'El Mojo-Baldío de Gallardo', 21);
INSERT INTO pedania VALUES (6, 'El Portal del Guadalete', 21);
INSERT INTO pedania VALUES (7, 'Estella del Marqués', 21);
INSERT INTO pedania VALUES (8, 'Gibalbín', 21);
INSERT INTO pedania VALUES (9, 'Guadalcacín', 21);
INSERT INTO pedania VALUES (10, 'Puente de La Guareña', 21);
INSERT INTO pedania VALUES (11, 'La Ina', 21);
INSERT INTO pedania VALUES (12, 'Las Pachecas', 21);
INSERT INTO pedania VALUES (13, 'Lomopardo', 21);
INSERT INTO pedania VALUES (14, 'Majarromaque', 21);
INSERT INTO pedania VALUES (15, 'Mesas de Asta', 21);
INSERT INTO pedania VALUES (16, 'Mesas de Santa Rosa', 21);
INSERT INTO pedania VALUES (17, 'Mesas del Corral', 21);
INSERT INTO pedania VALUES (18, 'Mimbral', 21);
INSERT INTO pedania VALUES (19, 'Nueva Jarilla', 21);
INSERT INTO pedania VALUES (20, 'El Portal', 21);
INSERT INTO pedania VALUES (21, 'Rajamancera', 21);
INSERT INTO pedania VALUES (22, 'San Isidro del Guadalete', 21);
INSERT INTO pedania VALUES (23, 'Las Tablas, Polila y Añina', 21);
INSERT INTO pedania VALUES (24, 'El Torno', 21);
INSERT INTO pedania VALUES (25, 'Tahivilla', 37);
INSERT INTO pedania VALUES (26, 'Torrecera', 21);
INSERT INTO pedania VALUES (27, 'Torremelgarejo', 21);
INSERT INTO pedania VALUES (28, 'Los Ángeles', 22);
INSERT INTO pedania VALUES (29, 'San Pablo de Buceite', 22);
INSERT INTO pedania VALUES (30, 'San Martín del Tesorillo', 22);
INSERT INTO pedania VALUES (31, 'Benamahoma', 20);
INSERT INTO pedania VALUES (32, 'Pozo Amargo', 30);
INSERT INTO pedania VALUES (33, 'La Muela', 5);
INSERT INTO pedania VALUES (34, 'La Almoraima', 12);
INSERT INTO pedania VALUES (35, 'La Muela', 41);
INSERT INTO pedania VALUES (36, 'Zahara de los Atunes', 7);
INSERT INTO pedania VALUES (37, 'Estación de San Roque', 34);
INSERT INTO pedania VALUES (38, 'Palmones', 24);
INSERT INTO pedania VALUES (39, 'El Bujeo', 37);
INSERT INTO pedania VALUES (40, 'El Colmenar', 12);
INSERT INTO pedania VALUES (41, 'Los Cortijillos', 24);
INSERT INTO pedania VALUES (42, 'San Enrique de Guadiaro', 34);
INSERT INTO pedania VALUES (43, 'Poblado de Doña Blanca', 18);
INSERT INTO pedania VALUES (44, 'Las Abiertas', 6);
INSERT INTO pedania VALUES (45, 'Jédula', 6);
INSERT INTO pedania VALUES (46, 'Junta de los Ríos', 6);
INSERT INTO pedania VALUES (47, 'La Pedrosa', 6);
INSERT INTO pedania VALUES (48, 'Guadacorte', 24);
INSERT INTO pedania VALUES (49, 'Campamento', 34);
INSERT INTO pedania VALUES (50, 'La Colonia', 34);
INSERT INTO pedania VALUES (51, 'Guadarranque', 34);
INSERT INTO pedania VALUES (52, 'Guadiaro', 34);
INSERT INTO pedania VALUES (53, 'Miraflores', 34);
INSERT INTO pedania VALUES (54, 'Pueblo Nuevo de Guadiaro', 34);
INSERT INTO pedania VALUES (55, 'Puente Mayorga', 34);
INSERT INTO pedania VALUES (56, 'San Diego', 34);
INSERT INTO pedania VALUES (57, 'Sotogrande', 34);
INSERT INTO pedania VALUES (58, 'Taraguilla', 34);
INSERT INTO pedania VALUES (59, 'Torreguadiaro', 34);
INSERT INTO pedania VALUES (60, 'La Alcaidesa', 23);
INSERT INTO pedania VALUES (61, 'Los Caños de Meca', 7);
INSERT INTO pedania VALUES (62, 'Novo Sancti Petri', 13);
INSERT INTO pedania VALUES (63, 'Río San Pedro', 29);
INSERT INTO pedania VALUES (64, 'El Palmar', 41);
INSERT INTO pedania VALUES (65, 'El Cuartón', 37);
INSERT INTO pedania VALUES (66, 'Facinas', 37);
INSERT INTO pedania VALUES (67, 'La Zarzuela', 37);
INSERT INTO pedania VALUES (68, 'Bolonia', 37);
