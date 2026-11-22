# T2. Elementos del lenguaje

Pregunta : 	Las restricciones (CONSTRAINTS) definidas en una tabla, pueden ser:
###	A nivel de columna y a nivel de tabla.

Pregunta : 	Con la siguiente definición de la tabla EMPLEADOS: CREATE TABLE empleados (dep_no NUMBER(4) CONSTRAINT FK_EMPLEADOS_DEPARTAMENTOS REFERENCES departamentos (dep_no) ON DELETE CASCADE); al borrar un departamento de la tabla DEPARTAMENTOS:
###	Se borrarán las filas de la tabla EMPLEADOS que hagan referencia a la fila que se acaba de borrar (se borran los empleados del departamento eliminado).

Pregunta : 	La diferencia entre declarar una variable como CHAR(6) o como VARCHAR(6) consiste en que:
###	Con CHAR(&) la variable siempre ocupará 6 bytes, mientras que con VARCHAR(6) dependerá del dato que almacenemos.

Pregunta : 	El administrador de la base de datos:
###	Las dos afirmaciones anteriores son correctas.

Pregunta : 	Si tenemos definida la tabla PIEZAS como: CREATE TABLE PIEZAS (num INT(2)_INCREMENT PRIMARY KEY, desc_pieza varchar (40)); ¿qué sentencia utilizamos para modificar la descripción de la pieza número 25 (num=25) para que pase a ser ESTANTERIA?
###	UPDATE PIEZAS SET desc_pieza="ESTANTERIA" WHERE num=25

Pregunta : 	La diferencia más relevante entre definir una restricción a nivel de tabla o a nivel de columna consiste en:
###	A nivel de tabla podemos asignar un nombre a la restricción.

Pregunta : 	Los tipos de datos alfanuméricos o de cadenas de caracteres pueden ser de tipo:
###	CHAR, VARCHAR, TEXT, LONGTEXT.

Pregunta : 	Los lenguajes que pueden utilizar los usuarios y administradores de la base de datos son:
###	De definición (DDL), manipulación (DML) y control de datos (DCL).

Pregunta : 	Si tenemos definida la tabla PIEZAS como: CREATE TABLE PIEZAS (num INT(2) AUTO_INCREMENT PRIMARY KEY, desc_pieza varchar (40)); la sentencia INSER INTO PIEZAS (num, desc_pieza) VALUES (25, "ARANDELA"):
###	No fallará si no existe ninguna pieza con el campo num igual a 25.

Pregunta : 	En un almacén de material, se dispone de la siguiente tabla para almacenar las piezas: CREATE TABLE PIEZAS (num INT(2) AUTO_INCREMENT PRIMARY KEY, desc_pieza varchar (40)). Se va a proceder a la eliminación de todo el material existente actualmente en el almacén, pero dejando constancia en la tabla. Para ello, debemos anteponer a la descripción de todas las piezas actuales la cadena MATERIAL ANTIGUO ¿Con qué sentencia podemos realizar esta operación?
###	UPDATE PIEZAS SET desc_pieza=CONCAT ("MATERIAL ANTIGUO-", desc_pieza).