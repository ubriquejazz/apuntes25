-- PES Andalucía 2021  
-- Date: 202204 (sesion 11)
-- Autor: Juan Gago
-- File: ddl.sql

CREATE TABLE Compania (
    CIF_C       INTEGER PRIMARY KEY,
    Nombre_C    VARCHAR(30)
); 

CREATE TABLE Telefono_C (
    Tlfnos_C    VARCHAR(9) PRIMARY KEY,
    CIF_C       INTEGER FOREIGN KEY REFERENCES Compania(CIF_C),
); 


/* 
    Compania (CIF_C*, Nombre_C);
    Telefono_C (CIF_C?, Tlfno_C*);

    Hospital (Nombre_H*, Tlfno_H);
    Convenio_CH (CIF_C?, Nombre_H?, Fecha_C);

    Seguro (Nombre_S*, Desc_S, CIF_C?, DNI_A?);

    Asegurado (DNI_A*, Nombre_A, DNI_Depende?);
    Mutualista(DNI_A?, Mutua)
    Privado(DNI_A?, Cuota);
*/