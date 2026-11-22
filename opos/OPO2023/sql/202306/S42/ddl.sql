-- Crear una base de datos EMPRESA
DROP DATABASE IF EXISTS EMPRESA;
CREATE DATABASE EMPRESA CHARACTER SET utf8mb4;
USE EMPRESA;

-- Crear las tablas en orden
CREATE TABLE departamento (
    cddep CHAR(2) PRIMARY KEY,
    nombre VARCHAR(30),
    ciudad VARCHAR(20)
);

CREATE TABLE empleado (
    cdemp CHAR(3) PRIMARY KEY,
    nombre VARCHAR(30),
    fecha_ingreso DATE DEFAULT NULL,
    salario FLOAT(6,2),
    cdjefe CHAR(3) DEFAULT NULL,
    cddep CHAR(2),
    CONSTRAINT FK_E_Jefe FOREIGN KEY (cdjefe) REFERENCES empleado(cdemp),
    CONSTRAINT FK_E_Dpto FOREIGN KEY (cddep) REFERENCES departamento(cddep)
);

CREATE TABLE proyecto (
    cdpro CHAR(3) PRIMARY KEY,
    nombre VARCHAR(30),
    cddep CHAR(2),
    CONSTRAINT FK_Prj_Dpto FOREIGN KEY (cddep) REFERENCES departamento(cddep)
);

CREATE TABLE trabaja (
    cdemp CHAR(3),
    cdpro CHAR(3),
    nhoras INT(11),
    CONSTRAINT CK_NHoras CHECK (nhoras BETWEEN 0 AND 200),
    CONSTRAINT FK_T_Empo FOREIGN KEY (cdemp) REFERENCES empleado(cdemp),
    CONSTRAINT FK_T_Prjt FOREIGN KEY (cdpro) REFERENCES proyecto(cdpro),
    CONSTRAINT PK_Trabaja PRIMARY KEY (cdemp, cdpro)
);