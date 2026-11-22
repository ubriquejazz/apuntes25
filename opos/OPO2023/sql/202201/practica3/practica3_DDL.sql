/* Práctica 3 DDL */
/* 1. Crear la tabla componente */
CREATE TABLE componente (
   dni CHAR(9) NOT NULL,
   nombre VARCHAR(80) NOT NULL,
   fecha_nacimiento DATE,
   cargo ENUM('PR','V1','V2) NOT NULL,
   lugar_nacimiento VARCHAR(50) DEFAULT 'Jimena'
   sexo ENUM('H','M') DEFAULT 'H'
   );

/* 2. Modificar su estructura añadiendo dni como clave */  
ALTER TABLE componente ADD PRIMARY KEY (dni);

/* 3. Modificar su estructura añadiendo el campo idiomas */
ALTER TABLE componente ADD idiomas SET('en','fr',de');

/* 4. Modificar sy estructura aladiendo un índice */
ALTER TABLE componente ADD INDEX (nombre);

/* 5. Eliminar la tabla */
DROP TABLE componente;