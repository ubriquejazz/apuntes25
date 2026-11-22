# T6 Consultas con agrupamientos y funciones de grupo
CREATE TABLE PIEZAS (
    num INT(2) AUTO_INCREMENT PRIMARY KEY, 
    desc_pieza varchar(40)
    );

## Pregunta: Si tenemos definida la tabla PIEZAS como: CREATE.. para obtener un listado de todas las piezas con el encabezado de columna NÚMERO PIEZA para la columna num y encabezado NOMBRE PIEZA para desc_pieza, la sentencia será:
- 	SELECT num AS `NÚMERO PIEZA´, desc_pieza AS `NOMBRE PIEZA´FROM PIEZAS. 

## Pregunta: La composición o combinación natural de tablas se utiliza mediante:
- 	El producto cartesiano de las tablas.

## Pregunta: Los operadores lógicos que podemos utilizar al evaluar las subconsultas son:
- 	IN, ALL, ANY, EXISTS.

## Pregunta: Para ordenar la salida después de un GROUP BY mediante ORDER BY y una función de grupo:
- 	Referenciaremos la posición que la función de grupo ocupa en la select.

## Pregunta: Si tenemos definida la tabla PIEZAS como: CREATE .. la sentencia que utilizaremos para recuperar los nombres de las piezas cuyos números se encuentren entre el 1 y el 15 será:
- 	Las dos sentencias anterioes son válidas.

## Pregunta: Al crear una tabla a partir de otra, los nombres de las columnas resultantes:
- 	Las dos respuestas anteriores son ciertas.

## Pregunta: Para combinar tablas podemos utilizar:
- 	El producto cartesiano de las mismas.

## Pregunta: Si una subconsulta devuelve varios valores y posteriormente utilizamos operadores aritméticos de comparación con ellos:
- 	Se producirá un error.

## Pregunta: Los alias:
- 	Sí que los podemos utilizar en las cláusulas HAVING pero no en las GROUP BY.

## Pregunta: Cuando insertamos en una tabla a partir de una subconsulta, la lista de columnas:
- 	Es opcional, pero deberá especificarse cuando las columnas devueltas por la subconsulta no coincidan en número u orden con las columnas de la tabla destino.