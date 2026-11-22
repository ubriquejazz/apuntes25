-- En el examen gedit, o nano

/*Borramos, si existe, una base de datos anterior */
DROP DATABASE IF EXISTS extremadura2018;

/*Creamos la base de datos llamada extremadura2018 */
CREATE DATABASE IF NOT EXISTS extremadura2018;

/*Uso la base de datos extremadura2018 */
USE extremadura2018;

/***********************/
/* TABLA: alojamiento */
/***********************/
CREATE TABLE IF NOT EXISTS alojamiento (
  nombre_a VARCHAR(30) PRIMARY KEY,
  direccion_a VARCHAR(30) NOT NULL,
  telefono_a VARCHAR(9) NOT NULL,
  numero_habitaciones_a INTEGER,
  contacto_a INTEGER);

/***********************/
/* TABLA: personal     */
/***********************/
CREATE TABLE IF NOT EXISTS personal(
  cod_p INTEGER PRIMARY KEY auto_increment,
  nombre_p VARCHAR(30) NOT NULL,
  direccion_p CHAR(30),
  NIF_p CHAR(9) NOT NULL,
  nombre_a VARCHAR(30) NOT NULL,
  FOREIGN KEY (nombre_a) REFERENCES alojamiento(nombre_a) ON DELETE CASCADE ON UPDATE CASCADE);

/*********************************************************/
/* Añado la restricción del FOREIGN KEY de contact_a     */
/*********************************************************/
ALTER TABLE alojamiento ADD CONSTRAINT fk_Contacto 
  FOREIGN KEY (contacto_a) REFERENCES personal(cod_p) ON DELETE SET NULL ON UPDATE CASCADE;

/***************************/
/* TABLA: habitaciones     */
/***************************/
CREATE TABLE IF NOT EXISTS habitaciones(
  nombre_a VARCHAR(30) NOT NULL,
  numero_h INTEGER NOT NULL,
  tipo_h VARCHAR(15) NOT NULL,
  banyo_h INTEGER,
  precio_h FLOAT NOT NULL,
  PRIMARY KEY(nombre_a,numero_h),
  FOREIGN KEY (nombre_a) REFERENCES alojamiento(nombre_a) ON DELETE CASCADE ON UPDATE CASCADE);

/***************************/
/* TABLA: actividades      */
/***************************/
CREATE TABLE IF NOT EXISTS actividades (
  cod_act INTEGER PRIMARY KEY auto_increment,
  nombre_act CHAR(20) NOT NULL,
  descripcion_act CHAR(50),
  dificultad_act INTEGER);

/***************************/
/* TABLA: organiza         */
/***************************/
CREATE TABLE IF NOT EXISTS organiza(
  nombre_a VARCHAR(30) NOT NULL,
  cod_act INTEGER NOT NULL,
  dia_act SET('lunes','martes','miércoles','jueves','viernes','sábado','domingo'),
  PRIMARY KEY(nombre_a,cod_act),
  FOREIGN KEY (nombre_a) REFERENCES alojamiento(nombre_a) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (cod_act) REFERENCES actividades(cod_act) ON DELETE CASCADE ON UPDATE CASCADE);

/***********************/
/* TABLA: alojamiento  */
/***********************/
INSERT INTO alojamiento
(nombre_a,direccion_a,telefono_a,numero_habitaciones_a) VALUES
    ('Las Fuentes de Ágata','Calle Fuentes','950111111',8),
    ('La Sierra de Monfragüe','Calle ABCDE','950222222',4);

/***********************/
/* TABLA: habitaciones */
/***********************/
INSERT INTO habitaciones VALUES
  ('Las Fuentes de Ágata',1,'simple',1, 12.0),
  ('Las Fuentes de Ágata',2,'doble', 3, 23.0), 
  ('Las Fuentes de Ágata',3,'doble', 2, 22.0),
  ('La Sierra de Monfragüe',1,'simple',1, 12.0),
  ('La Sierra de Monfragüe',2,'simple',1, 84.0),
  ('La Sierra de Monfragüe',3,'doble', 2, 21.0),
  ('La Sierra de Monfragüe',4,'doble', 3, 18.0);

/************************************************************************************************/
/* Consula 1: Precio medio de las habitaciones del alojamiento "La Sierra de Monfragüe, si el   */
/* precio es superior a 20 euros                                                               **/
/************************************************************************************************/
SELECT AVG(precio_h) FROM habitaciones 
WHERE nombre_a='La Sierra de Monfragüe' AND precio_h>20;

/************************************************************************************************/
/* Consulta 2: Incrementar un 5% al precio de las habitaciones dobles                          **/
/************************************************************************************************/
UPDATE habitaciones SET precio_h=precio_h*1.05 WHERE tipo_h='doble';