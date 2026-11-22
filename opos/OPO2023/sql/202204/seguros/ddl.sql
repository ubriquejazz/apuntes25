-- Compania de Seguros 
-- Date: 202204 (sesion 13)
-- Autor: Juan Gago
-- File: ddl.sql

CREATE TABLE Cliente (
    DNI_C   CHAR(9) NOT NULL,
    Nombre_C VARCHAR(50) NOT NULL,
    Tlfno_C CHAR(9),
    PRIMARY KEY (DNI_C)
);   -- suponemos que del cliente tengo q almacenar...

CREATE TABLE Vivienda (
    Domicilio   VARCHAR(50) NOT NULL,
    Tipo_V      VARCHAR(20) NOT NULL,
    PRIMARY KEY (Domicilio)
);

CREATE TABLE Extra (
    Extra_E     VARCHAR(20) NOT NULL,
    Desc_E      VARCHAR(50),
    Domicilio   VARCHAR(50) NOT NULL REFERENCES Vivienda(Domicilio),
    PRIMARY KEY (Extra_E, Domicilio)
); -- atributo multivaluado o relacion debil (1:M)

CREATE TABLE Poliza (
    Num_Poliza  INTEGER NOT NULL,
    Cober_Tipo  VARCHAR(12) NOT NULL,
    Cober_Max   REAL,
    DNI_C       CHAR(9) NOT NULL REFERENCES Cliente(DNI_C),
    Domicilio   VARCHAR(50) NOT NULL REFERENCES Vivienda(Domicilio),
    PRIMARY KEY (Num_P)
);

CREATE TABLE Perito (
    Num_Perito  INTEGER NOT NULL,
    Nombre_Pto  VARCHAR(50) NOT NULL,
    PRIMARY KEY (Num_Perito)
); -- un perito evalua M siniestros

CREATE TABLE Empresa_Reparacion (
    CIF_E       CHAR(9) NOT NULL,
    Nombre_E    VARCHAR(50) NOT NULL,
    PRIMARY KEY (CIF_E)
); -- suponemos los datos son ... 

CREATE TABLE Parte_Siniestro (
    Num_S       INTEGER NOT NULL,
    Fecha_S     DATE NOT NULL,
    Num_Poliza  INTEGER NOT NULL REFERENCES Poliza(Num_Poliza),
    Num_Perito  INTEGER NOT NULL REFERENCES Perito(Num_Perito),
    CIF_E       CHAR(9) NOT NULL REFERENCES Empresa_Reparacion(CIF_E),
    PRIMARY KEY (Num_S)
);