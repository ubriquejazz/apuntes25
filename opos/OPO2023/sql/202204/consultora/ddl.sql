-- Consultora 
-- Date: 202204 (sesion 9)
-- Autor: Juan Gago
-- File: ddl.sql

CREATE TABLE Dpto (
    Cod_D       INTEGER NOT NULL,
    Nombre_D    VARCHAR(30) NOT NULL,
    PRIMARY KEY (Cod_D)
); -- Dpto (Cod_D, Nombre_D)

CREATE TABLE Empleado (
    NIF_E       CHAR(9) NOT NULL,
    Nombre_E    VARCHAR(30) NOT NULL,
    Tlfno_E     CHAR(9),
    Cod_Dpto    INTEGER NOT NULL REFERENCES Dpto(Cod_D),
    PRIMARY KEY (NIF_E)
); -- Empleado (NIF_E*, Tlfno_E, ...)
  
CREATE TABLE Titulos (
    Nombre_T    VARCHAR(50) NOT NULL,
    NIF_E       CHAR(9) NOT NULL REFERENCES Empleado(NIF_E) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (Nombre_T, NIF_E),
); --  Titulos (Nombre_T, NIF_E?)

CREATE TABLE Proyecto (
    Cod_P       INTEGER NOT NULL,
    Desc_P      VARCHAR(50),
    PRIMARY KEY (Cod_D)
); -- Proyecto (Cod_P, Desc_P)

CREATE TABLE Trabaja_EP (
    NIF_E       CHAR(9) NOT NULL REFERENCES Empleado(NIF_E) ON DELETE CASCADE ON UPDATE CASCADE,
    Cod_P       INTEGER NOT NULL REFERENCES Proyecto(Cod_P) ON DELETE CASCADE ON UPDATE CASCADE,
    FInc_EP     DATE NOT NULL,
    Coord_EP    CHAR(1),
    PRIMARY KEY (NIF_E, Cod_P)
); -- Trabaja_EP (FInc_EP, Coord_EP)