CREATE TABLE Alumno (
    Cod_Alu INT NOT NULL PRIMARY KEY auto_increment,
    Dni CHAR(9) UNIQUE NOT NULL,
    Nombre VARCHAR(25) NOT NULL,
    Apellidos VARCHAR(40) NOT NULL,
    Fecha_Nac DATE
);

CREATE TABLE Familia (
    Cod_Familia INT NOT NULL PRIMARY KEY auto_increment,
    Nombre VARCHAR(50) NOT NULL
);

-- 

CREATE TABLE Titulo (
    Cod_Titulo INT NOT NULL PRIMARY KEY auto_increment,
    Nombre VARCHAR(50) NOT NULL, 
    Grado CHAR(1) CHECK (Grado IN ('b', 'm', 's', 'e')) NOT NULL,
    Cod_Familia INT NOT NULL,
    FOREIGN KEY (Cod_Familia) REFERENCES Familia(Cod_Familia)
);

CREATE TABLE Modulo (
    Cod_Mod INT NOT NULL PRIMARY KEY auto_increment,
    Nombre VARCHAR(50) NOT NULL,
    Horas INT CHECK (Horas > 1),
    Cod_Titulo INT NOT NULL,
    FOREIGN KEY (Cod_Titulo) REFERENCES Titulo(Cod_Titulo)
);

CREATE TABLE Matriculado (
    Cod_Alu INT NOT NULL,
    Cod_Modulo INT NOT NULL,
    Anio INT NOT NULL,
    Nota_Final INT CHECK (Nota_Final BETWEEN 1 and 10),
    PRIMARY KEY (Cod_Alu, Cod_Modulo, Anio),
    FOREIGN KEY (Cod_Alu) REFERENCES Alumno (Cod_Alu),
    FOREIGN KEY (Cod_Modulo) REFERENCES Modulo (Cod_Mod)
);

