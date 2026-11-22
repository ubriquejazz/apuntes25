# T6 Consultas con agrupamientos y funciones de grupo
CREATE TABLE PIEZAS (
    num INT(2) AUTO_INCREMENT PRIMARY KEY, 
    desc_pieza varchar(40)
    );

## Pregunta 1: 
Si tenemos definida la tabla PIEZAS como: CREATE .. para obtener un listado de todas las piezas con el encabezado de columna NÚMERO PIEZA para la columna num y encabezado NOMBRE PIEZA para desc_pieza, la sentencia será:
    SELECT NÚMERO PIEZA, NOMBRE PIEZA FROM PIEZAS.
    SELECT `NÚMERO PIEZA´, `NOMBRE PIEZA´FROM PIEZAS.
    SELECT num AS `NÚMERO PIEZA´, desc_pieza AS `NOMBRE PIEZA´FROM PIEZAS. 

## Pregunta 2: 
La composición o combinación natural de tablas se utiliza mediante:
    El producto cartesiano de las tablas.
    La desigualdad entre las columnas de las tablas.
    El operador de igualdad entre las columnas que deban coincidir.
## Pregunta 3: 
Los operadores lógicos que podemos utilizar al evaluar las subconsultas son:
    IN, OUT, TRUE, FALSE.
    IN, ALL, ANY, EXISTS.
    ANY, SOME, EXISTS, NONE.
## Pregunta 4: 
Para ordenar la salida después de un GROUP BY mediante ORDER BY y una función de grupo:
    Referenciaremos el nombre de la columna requerida.
    Utilizaremos la función que precisemos.
    Referenciaremos la posición que la función de grupo ocupa en la select.
## Pregunta 5: 
Si tenemos definida la tabla PIEZAS como: CREATE.. la sentencia que utilizaremos para recuperar los nombres de las piezas cuyos números se encuentren entre el 1 y el 15 será:
    SELECT desc_pieza FROM piezas WHERE num <15.
    SELECT desc_pieza FROM piezas WHERE num BETWEEN 1 AND 15.
    Las dos sentencias anterioes son válidas.
## Pregunta 6: 
Al crear una tabla a partir de otra, los nombres de las columnas resultantes:
    Serán los mismos si no se especifican alias.
    No se podrán referenciar si son expresiones o funciones.
    Las dos respuestas anteriores son ciertas.
## Pregunta 7: 
Para combinar tablas podemos utilizar:
    La unión de las mismas.
    La composición natural y la composición basada en desigualdad.
    El producto cartesiano de las mismas.
## Pregunta 8: 
Si una subconsulta devuelve varios valores y posteriormente utilizamos operadores aritméticos de comparación con ellos:
    Se producirá un error.
    Si no coincide con ninguno devolverá FALSE.
    Si no coincide con alguno devolverá TRUE.
## Pregunta 9: 
Los alias:
    Sí que los podemos utilizar en las cláusulas HAVING pero no en las GROUP BY.
    Sí que los podemos utilizar en las cláusulas GROUP BY pero no en las HAVING.
    No los podemos utilizar ni en las cláusulas HAVING ni en las GROUP BY.
## Pregunta 10: 
Cuando insertamos en una tabla a partir de una subconsulta, la lista de columnas:
    Es opcional.
    Es opcional, pero deberá especificarse cuando las columnas devueltas por la subconsulta no coincidan en número u orden con las columnas de la tabla destino.
    No hace falta especificarla.