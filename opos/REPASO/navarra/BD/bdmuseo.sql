/*
  File: museos (ejercicio 1)
  Date: 202206 (sesion 23)
  Author: Juan Gago

*/

create table Museo (
    id_museo INTEGER NOT NULL PRIMARY KEY auto_increment,
    nombre VARCHAR(50),
    direccion VARCHAR(50)
);

-- Dependencia debil en identificacion
create table Sala (
    id_sala INTEGER NOT NULL auto_increment,
    id_museo INTEGER NOT NULL,
    PRIMARY KEY (id_museo, id_sala), -- weak key
    FOREIGN KEY (id_museo) REFERENCES Museo(id_museo) -- ON DELETE CASCADE, ON UPDATE CASCADE 
);

-- Herencia: vigilante, conservador, administrativo.. disyuntiva (no solapamiento)
create table Personal (
    nif VARCHAR(9) NOT NULL PRIMARY KEY,
    nss INTEGER NOT NULL,
    id_museo INTEGER NOT NULL,
    FOREIGN KEY (id_museo) REFERENCES Museo(id_museo)
);

create table Conservador is Personal (
    Funcion  VARCHAR(20),
);

create table Administrativo is Personal (
);

--
create table Publico (
    nif_public VARCHAR(9) NOT NULL PRIMARY KEY,
    nombre_public  VARCHAR(20)
    tlfno_public   VARCHAR(9)
);

-- cada vigilante tiene su propia sala (relacion 1:1)
create table Vigilante is Personal (
    id_sala INTEGER NOT NULL,
    num_arma INTEGER,
    FOREIGN KEY (id_sala) REFERENCES Sala(id_sala)
);

-- cada vigilante tiene un coordinador (relacion 1:n reflexiva)
create table Coord_Tiene_Subordinado(
    NIF_Coord VARCHAR(9) NOT NULL PRIMARY KEY,
    NIF_Subordinado VARCHAR(9),
    FOREIGN KEY (NIF_Coord) REFERENCES Personal(nif)
);

-- Agregacion, aparece instancia en Visita_Detalles (relacion n:m)
create table Visitante_Visita_Museo (
    nif_public VARCHAR(9) NOT NULL,
    id_museo INTEGER REFERENCES Museo(id_museo),
    PRIMARY KEY (nif_public, id_museo),
    FOREIGN KEY (nif_public) REFERENCES Publico(nif_public),
    FOREIGN KEY (id_museo) REFERENCES Museo(id_museo)
);

-- Un visitante puede visitar muchas veces el mismo.. weak, atributo discriminante la hora_visita
create table Visita_Detalles (
    nif_public VARCHAR(9) NOT NULL,
    id_museo INTEGER NOT NULL,
    fecha_visita DATE NOT NULL,
    hora_visita INT NOT NULL,
    PRIMARY KEY (nif_public, id_museo, fecha_visita, hora_visita),
    FOREIGN KEY (nif_public) REFERENCES Publico(nif_public),
    FOREIGN KEY (id_museo) REFERENCES Museo(id_museo)
);