DROP DATABASE IF EXISTS fct; CREATE DATABASE IF NOT EXISTS fct; USE fct;
-- Tabla Ciclos
DROP TABLE IF EXISTS Ciclos;
CREATE TABLE IF NOT EXISTS Ciclos (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    ciclo VARCHAR(100) NOT NULL,
    descripcion TEXT
);
-- Tabla Centros
DROP TABLE IF EXISTS Centros;
CREATE TABLE IF NOT EXISTS Centros (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono CHAR(13),
    direccion TEXT
);
-- Tabla Empresas
DROP TABLE IF EXISTS Empresas;
CREATE TABLE IF NOT EXISTS Empresas (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    cif CHAR(9) UNIQUE NOT NULL,
    direccion TEXT,
    sector VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    telefono CHAR(13),
    representante_legal VARCHAR(100),
    dni_representante_legal CHAR(9)
);
-- Tabla Modulos
DROP TABLE IF EXISTS Modulos;
CREATE TABLE IF NOT EXISTS Modulos (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    horas INT NOT NULL,
    descripcion TEXT,
    ciclo_id INT UNSIGNED NOT NULL
);
-- Tabla Alumnos
DROP TABLE IF EXISTS Alumnos;
CREATE TABLE IF NOT EXISTS Alumnos (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    dni CHAR(9) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    fecha_nacimiento DATE,
    curso VARCHAR(50),
    ciclo_id INT UNSIGNED NOT NULL,
    centro_id INT UNSIGNED NOT NULL
);
-- Tabla Convenios
DROP TABLE IF EXISTS Convenios;
CREATE TABLE IF NOT EXISTS Convenios (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    descripcion TEXT,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    jornadas INT NOT NULL,
    horas_por_jornada INT NOT NULL,
    horas_totales INT NOT NULL,
    calendario TEXT,
    evaluaciones TEXT,
    centro_id INT UNSIGNED NOT NULL,
    tutor_docente_id INT UNSIGNED NOT NULL,
    tutor_laboral_id INT UNSIGNED NOT NULL,
    empresa_id INT UNSIGNED NOT NULL
);
-- Tabla Alumnos Convenio
DROP TABLE IF EXISTS Alumnos_convenio;
CREATE TABLE IF NOT EXISTS Alumnos_convenio (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    alumno_id INT UNSIGNED NOT NULL,
    convenio_id INT UNSIGNED NOT NULL,
    evaluacion TEXT,
    fecha DATE,
    encuesta TEXT,
    observaciones TEXT
);
-- Tabla Asistencia
DROP TABLE IF EXISTS Asistencia;
CREATE TABLE IF NOT EXISTS Asistencia (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    alumno_id INT UNSIGNED NOT NULL,
    convenio_id INT UNSIGNED NOT NULL,
    fecha DATE NOT NULL,
    actividades TEXT,
    h_llegado TIME,
    h_salida TIME
);
-- Tabla Plan de Actividades
DROP TABLE IF EXISTS Plan_actividades;
CREATE TABLE IF NOT EXISTS Plan_actividades (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    modulo_id INT UNSIGNED NOT NULL,
    convenio_id INT UNSIGNED NOT NULL,
    ra TEXT,
    actividades TEXT
);

