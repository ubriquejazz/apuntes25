-- Feria del Caballo 
-- Date: 202204
-- Autor: Juan Gago
-- File: ddl.sql

CREATE TABLE Calle (
    id INTEGER NOT NULL PRIMARY KEY,
    nombre VARCHAR2(30) NOT NULL
);

CREATE TABLE Caseta (
    id          INTEGER NOT NULL PRIMARY KEY,
    nombre      VARCHAR2(30),
    titular     VARCHAR2(30),
    espacio_m2  INTEGER,
    calle_id    INTEGER REFERENCES Calle(id)
);

CREATE TABLE Socio (
    dni         CHAR(9) NOT NULL PRIMARY KEY,
    nombre      VARCHAR2(30) NOT NULL,
    apellidos   VARCHAR2(30) NOT NULL,
    telefono1   CHAR(9) NOT NULL,
    telefono2   CHAR(9)
);  

CREATE TABLE Caseta_Has_Socio (
    caseta_id   INTEGER NOT NULL REFERENCES Caseta(id),
    socio_dni   CHAR(9) NOT NULL REFERENCES Socio(dni),
    num_pases   INTEGER,
    PRIMARY KEY (caseta_id, socio_dni)
);

CREATE TABLE Caseta_hermanada_Caseta (
    caseta_a    INTEGER NOT NULL REFERENCES Caseta(id),
    caseta_b    INTEGER NOT NULL REFERENCES Caseta(id),
    PRIMARY KEY (caseta_a, caseta_b)
);

CREATE TABLE Consumicion (
    id          INTEGER NOT NULL PRIMARY KEY,
    nombre      VARCHAR2(30) NOT NULL
);

CREATE TABLE Caseta_Has_Consumicion (
    caseta_id   INTEGER NOT NULL REFERENCES Caseta(id),
    consumicion_id INTEGER NOT NULL REFERENCES Consumicion(id),
    precio      INTEGER,
    PRIMARY KEY (caseta_id, consumicion_id)
);

CREATE TABLE Premio (
    id          INTEGER NOT NULL PRIMARY KEY,
    nombre      VARCHAR2(30) NOT NULL,
    caseta_id   INTEGER NOT NULL REFERENCES Caseta(id)
};