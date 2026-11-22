# T4. Actualizacion de datos (INSERT)

## Pregunta 1: 
La función CONCAT (cad1, cad2) devuelve:
    El número de veces que cad2 aparece en cad1.
    La concatenación de cad1 con cad2.
    La cadena resultante de quitar cad2 a cad1.
## Pregunta 2: 
En nuestro sistema disponemos de una tabla de EMPLEADOS y otra de OFICINAS, estando establecida una restricción de integridad referencial desde EMPLEADOS hacia OFICINAS, de tal forma que todo empleado debe estar vinculado a una oficina. Por lo tanto:
    No podremos eliminar una oficina si tiene empleados.
    No podremos eliminar un empleado sin eliminar la oficina.
    No tenemos ninguna restricción para eliminar empleados u oficianas.
## Pregunta 3: 
Necesitamos relacionar las tablas CLIENTES y FACTURAS mediante una clave ajena, para que toda factura tenga un cliente válido. Para ello:
    Añadiremos un campo en la tabla CLIENTES con la clave primaria de la tabla FACTURAS.
    Añadiremos un campo en la tabla FACTURAS con la clave primaria de la tabla CLIENTES.
    Añadiremos un campo en la tabla CLIENTES con la clave primaria de la tabla FACTURAS y otro campo en la tabla FACTURAS con la clave primaria de la tabla CLIENTES.
## Pregunta 4: 
Dada la siguiente definición de la tabla PRODUCTOS: CREATE TABLE PRODUCTOS (PRODUCTO_NO INT(4), DESCRIPCIÓN VARCHAR(30), PRECIO_ACTUAL FLOAT(8,2), STOCK_DISPONIBLE INT(9), CONSTRAINT PK_PRODUCTO_NO PRIMARY KEY (PRODUCTO_NO)ENGINE=INNODB, queremos eliminar aquellos productos de los que no tengamos STOCK_DISPONIBLE. ¿Con qué sentencia eliminamos estos productos?
    DELETE FROM PRODUCTOS WHERE STOCK_DISPONIBLE=0 OR ISNULL (STOCK_DISPONIBLE)
    DELETE FROM PRODUCTOS WHERE NOT STOCK_DISPONIBLE.
    Las dos sentencias anteriores son válidas.
## Pregunta 5: 
Para renunciar la tabla ESTUDIANTES a BECARIOS utilizaríamos:
    DROP TABLE ESTUDIANTES; CREATE TABLE BECARIOS.
    ALTER TABLE ESTUDIANTES RENAME TO BECARIOS.
    RENAME TABLE ESTUDIANTES TO BECARIOS.
## Pregunta 6: 
La diferencia entre las sentencias: DROP TABLE CLIENTES y DROP TABLE IF EXISTS CLIENTES; es que:
    La segunda no falla si CLIENTES no existe.
    La segunda falla si CLIENTES existe.
    La primera nunca fallará.
## Pregunta 7: 
Para borrar la tabla EMPLEADOS ejecutaremos la sentencia:
    DELETE TABLE EMPLEADOS.
    ELIMINATE TABLE EMPLEADOS.
    DROP TABLE EMPLEADOS.
## Pregunta 8: 
La tabla FACTURAS tiene una clave ajena hacia la tabla CLIENTES. Para borrar la tabla clientes debemos ejecutar:
    DROP TABLE CLIENTES.
    DROP TABLE FACTURAS; DROP TABLE CLIENTES.
    DROP TABLE CLIENTES; DROP TABLE FACTURAS.
## Pregunta 9: 
La función DATEDIFF (fecha1, fecha2):
    Devuelve el número de días entre fecha1 y fecha2.
    Devuelve la fecha resultante a quitarle fecha2 a fecha1.
    Devuelve la fecha resultante a quitarle fecha1 a fecha2.
## Pregunta 10: 
ROLLBACK nos permite:
    Deshacer cambios en la base de datos.
    Confiar cambios en la base de datos.
    Acelerar el procesamiento de la base de datos.
