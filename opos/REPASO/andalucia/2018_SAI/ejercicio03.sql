-- Oposicion PFTP-SAI
-- Date: 201806
-- Autor: Juan Gago
-- File: ejercicio03

CREATE DATABASE IF NOT EXISTS oposiciones DEFAULT CHARACTER SET utf8;
USE oposiciones;

CREATE TABLE Opositor (
    DNI     CHAR(9) NOT NULL PRIMARY KEY,
    Nombre  VARCHAR(20),
    Tlfno   CHAR(9)
);

INSERT INTO Opositor VALUES ("112233", "Juan Gago", NULL);
INSERT INTO Opositor VALUES ("445566", "V. Benitez", NULL);

CREATE TABLE Convocatoria (
    Cod_C   CHAR(4) NOT NULL PRIMARY KEY,
    Sede    VARCHAR(20)
);

INSERT INTO Convocatoria VALUES ("2018", "Cadiz");
INSERT INTO Convocatoria VALUES ("2023", "Jerez");

CREATE TABLE Especialidad (
    Cod_E       INT NOT NULL PRIMARY KEY,
    Nombre      VARCHAR(20)
);

INSERT INTO Especialidad VALUES (590, "PES");
INSERT INTO Especialidad VALUES (591, "SAI");

CREATE TABLE Oferta(
    Cod_E   INT NOT NULL REFERENCES Especialidad(Cod_E),
    Cod_C   CHAR(4) NOT NULL REFERENCES Convocatoria(Cod_C),
    Num_Plazas  INT NOT NULL,
    PRIMARY KEY (Cod_E, Cod_C) 
);

INSERT INTO Oferta VALUES (590, "2018", 250);
INSERT INTO Oferta VALUES (591, "2018", 50);
INSERT INTO Oferta VALUES (590, "2023", 400);
INSERT INTO Oferta VALUES (591, "2023", 200);

-- Un opositor oposita a una especialidad
CREATE TABLE Oposita (
    DNI     CHAR(9) NOT NULL REFERENCES Opositor(DNI),
    Cod_E   INT NOT NULL REFERENCES Especialidad(Cod_E),
    Cod_C   CHAR(4) NOT NULL REFERENCES Convocatoria(Cod_C),
    Nota    REAL,
    PRIMARY KEY (DNI, Cod_E, Cod_C) 
)

INSERT INTO Oposita VALUES ("112233", 590, "2023", 9.99);
INSERT INTO Oposita VALUES ("445566", 591, "2023", 4.99);