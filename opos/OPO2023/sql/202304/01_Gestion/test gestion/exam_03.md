# T3. Creacion de tablas (CREATE)

## Pregunta 1: 
Un usuario definido en una base de datos:
    Siempre puede crear tablas o consultar las de los demás.
    Nunca puede crear nuevas tablas.
    Dependiendo de sus privilegios podrá acceder a las tablas permitidas en los mismos.
## Pregunta 2: 
La expresión SALARIO BETWEEN valor1 AND valor2:
    Devuelve VERDADERO si el SALARIO es menor que valor1.
    Devuelve VERDADERO si el SALARIO es mayor que valor1.
    Devuelve VERDADERO si el SALARIO se encuentra entre el valor1 y el valor2.
## Pregunta 3: 
En la notación utilizada en el curso para describir los elementos del lenguaje SQL, los corchetes () nos indican:
    Que en su interior se encuentra una palabra reservada.
    Que no podemos utilizar su contenido.
    Que ese elemento es opcional.
## Pregunta 4: 
La sentencia utilizada para recuperar información es:
    SELECT.
    RETRIEVE.
    UPDATE.
## Pregunta 5: 
Para relacionar dos tablas en el modelo relacional utilizamos:
    FOREIGN KEY.
    PRIMARY KEY.
    CHECK.
## Pregunta 6: 
Las tablas:
    Relacionarán los objetos de la base de datos relacionales.
    Almacenarán los datos de la base de datos.
    No existe en el modelo relacional.
## Pregunta 7: 
En un almacén de material, se dispone de la siguiente tabla para almacenar piezas: CREATE TABLE PIEZAS (num INT(2) AUTO_INCREMENT PRIMARY KEY, desc_pieza varchar (40)). Se va a proceder a la eliminación de todas las piezas cuyo número se encuentre entre el 20 y el 29, ambos incluídos. ¿Con qué sentencia eliminamos estas piezas?
    DELETE FROM PIEZAS WHERE num=20 OR num=29.
    DELETE FROM PIEZAS WHERE num<20 OR num>29.
    DELETE FROM PIEZAS WHERE num BETWEEN 20 AND 29.
## Pregunta 8: 
Para cambiar el tamaño del campo DESCRIPCION en la tabla PRODUCTOS para que pase a tener 40 posiciones lo hacemos con:
    ALTER TABLE PRODUCTOS SET DESCRIPCION VARCHAR (40).
    ALTER TABLE PRODUCTOS NEW DESCRIPCION VARCHAR (40).
    ALTER TABLE PRODUCTOS MODIFY DESCRIPCION VARCHAR (40).
## Pregunta 9: 
El operador aritmético DIV:
    Realiza la división entre dos valores.
    Extrae la parte entera de la división de dos valores.
    Divide un valor en dos mitades idénticas.
## Pregunta 10: 
La expresión APELLIDO LIKE "%Z" devolverá:
    Los apellidos que no contengan Z.
    Los apellidos que acaben en Z.
    Los apellidos que contengan una Z en cualquier posición.