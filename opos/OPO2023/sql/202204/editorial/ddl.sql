-- Editorial 
-- Date: 202204 (sesion 10)
-- Autor: Juan Gago
-- File: ddl.sql

CREATE TABLE Empleado (
    DNI_E       CHAR(9) NOT NULL,
    Nombre_E    VARCHAR(30) NOT NULL,
    Tlfno_E     CHAR(9),
    PRIMARY KEY (DNI_E)
);

CREATE TABLE Sucursal (
    Cod_S       INTEGER NOT NULL,
    Domicilio   VARCHAR(50) NOT NULL,
    Tlfno_S     CHAR(9),
    PRIMARY KEY (Cod_S)
);

CREATE TABLE Periodista (
    DNI_P       CHAR(9) NOT NULL,
    Nombre_P    VARCHAR(30) NOT NULL,
    Tlfno_P     CHAR(9),
    PRIMARY KEY (DNI_P)
);

CREATE TABLE Revista (
    NReg_R      INTEGER NOT NULL,
    Titulo_R    VARCHAR(20) NOT NULL,
    Periodo_R   CHAR(1) NOT NULL,
    Tipo_R      VARCHAR(20),
    Cod_S       INTEGER NOT NULL REFERENCES Sucursal(Cod_S),
    PRIMARY KEY (NReg_R)
);

CREATE TABLE Escribe_PR (
    NReg_R      INTEGER NOT NULL REFERENCES Revista (NReg_R),
    DNI_P       CHAR(9) NOT NULL REFERENCES Periodista (DNI_P),
    Pseudon_PR  VARCHAR(50),
    PRIMARY KEY (NReg_R, DNI_P)
);

CREATE TABLE Seecion_Fija (
    Titulo_S    VARCHAR(10) NOT NULL,
    NReg_R      INTEGER NOT NULL REFERENCES Revista (NReg_R) ON DELETE CASCADE ON UPDATE CASCADE,
    Extension_S INTEGER,
    PRIMARY KEY (Titulo_S, NReg_R)
); -- debil

CREATE TABLE Ejemplares (
    Fecha_E     DATE NOT NULL,
    NReg_R      INTEGER NOT NULL REFERENCES Revista (NReg_R) ON DELETE CASCADE ON UPDATE CASCADE,
    NPag_E      INTEGER,
    NVentas_E   INTEGER,
    PRIMARY KEY (NReg_R, Fecha_E)
); -- debil
