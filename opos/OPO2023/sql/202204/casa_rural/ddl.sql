-- Casa Rurales 
-- Date: 202204 (sesion 12)
-- Autor: Juan Gago
-- File: ddl.sql

CREATE TABLE Alojamiento(
    Cod_Aloj    INTEGER NOT NULL,
    Nombre_Aloj VARCHAR(50) NOT NULL,
    Desc_Aloj   VARCHAR(50),
    Capacidad_A INTEGER,
    PRIMARY KEY (Cod_Aloj)
);

CREATE TABLE Equipamiento(
    Cod_E       INTEGER NOT NULL,
    Desc_E      CHARACTER(50),
    PRIMARY KEY (Cod_E)
);

CREATE TABLE Tiene(
    Cod_Aloj    INTEGER NOT NULL REFERENCES Alojamiento(Cod_Aloj) ON DELETE CASCADE ON UPDATE CASCADE,
    Cod_E       INTEGER NOT NULL REFERENCES Equipamiento(Cod_E) ON DELETE CASCADE ON UPDATE CASCADE,
    Cant_Eq_A   INTEGER,
    PRIMARY KEY (Cod_Aloj,Cod_E)
);

CREATE TABLE Clientes(
    DNI_Cli     CHARACTER(9) NOT NULL,
    Nombre_Cli  VARCHAR(50),
    PRIMARY KEY (DNI_Cli)
);

CREATE TABLE Regimen(
    Cod_Aloj    INTEGER NOT NULL REFERENCES Alojamiento(Cod_Aloj),
    Tipo_Reg    VARCHAR(50) NOT NULL,
    Precio_Reg  REAL,
    PRIMARY KEY (Cod_Aloj,Tipo_Reg)
);

CREATE TABLE Reservas(
    Cod_R       INTEGER NOT NULL,
    FEntrada_R  DATE NOT NULL,
    FSalida_R   DATE NOT NULL,
    NPersonas_R INTEGER NOT NULL,
    DNI_Cli     CHARACTER(9) NOT NULL REFERENCES Clientes(DNI_Cli) ON DELETE CASCADE ON UPDATE CASCADE,
    Cod_Aloj    INTEGER NOT NULL,
    Tipo_Reg    VARCHAR(50) NOT NULL,
    PRIMARY KEY (Cod_R),
    FOREIGN KEY (Cod_Aloj,Tipo_Reg) REFERENCES Regimen(Cod_Aloj,Tipo_Reg) ON DELETE CASCADE ON UPDATE CASCADE
);
