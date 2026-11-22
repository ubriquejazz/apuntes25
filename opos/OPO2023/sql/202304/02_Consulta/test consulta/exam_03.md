# T7 Subconsultas
CREATE TABLE PIEZAS (
    num INT(2) AUTO_INCREMENT PRIMARY KEY, 
    desc_pieza varchar(40)
    );

## Pregunta 1: 
Si tenemos definida la tabla PIEZAS como: CREATE ..la sentencia que utilizaremos para recuperar los datos de las piezas que empiecen por la letra T será:
SELECT num, desc_pieza FROM piezas WHERE desc_pieza LIKE `T%.
SELECT num, desc_pieza FROM piezas WHERE desc_pieza LIKE `T*´.
SELECT num, desc_pieza FROM piezas WHERE desc_pieza LIKE `T´.
## Pregunta 2: 
Cuando combinemos una tabla consigo misma:
Normalmente no hace falta utilizar alias de la tabla.
Siempre utilizaremos alias.
No podremos utilizar alias.
## Pregunta 3: 
Las subconsultas:
Únicamente se pueden ubicar en la cláusula WHERE.
Sólo pueden aparecer en la cláusula HAVING.
Pueden utilizarse tanto en la cláusula HAVING como en la WHERE.
## Pregunta 4: 
La función de grupo COUNT(expr):
Devuelve el número de valores no nulos de expr.
Devuelve el valor acumulado de expr.
Devuelve el mayor valor que verifica expr.
## Pregunta 5: 
Si tenemos definida la tabla PIEZAS como: CREATE .. para obtener los datos de las piezas cuya descripción tenga una longitud superior a 10 carácteres utilizaríamos la sentencia:
SELECT num, desc_pieza FROM PIEZAS WHERE LOWER (desc_pieza) >10.
SELECT num, desc_pieza FROM PIEZAS WHERE LENGTH(desc_pieza) >10.
SELECT num, desc_pieza FROM PIEZAS WHERE LOCATE(desc_pieza) >10.
## Pregunta 6: 
Cuando pretendamos modificar una tabla a partir de una subconsulta, deberemos tener en cuenta que:
La tabla destino no puede aparecer en la consulta.
No se puede incluir ORDER BY en la consulta.
Las dos respuestas anteriores son ciertas.
## Pregunta 7: 
Para recuperar los empleados que no pertenecen al departamento de CONTABILIDAD, completaremos SELECT e.emp_no, e.apellido FROM empleados e,departamentos d con la siguiente condición wHERE:
WHERE d.dnombre=`CONTABILIDAD´AND e.dep_no != d.dep_no.
WHERE d.nombre != `CONTABILIDAD¨AND e.dep_no = d.dep_no.
Cualquiera de las dos anteriores nos sirve.
## Pregunta 8: 
En subconsultas, los operadores ALL y ANY:
Se pueden utilizar sin ningún otro operador aritmético de comparación.
Dependiendo del resultado se pueden utilizar sin o con operadores aritméticos de comparación.
Se utilizan conjuntamente con operadores aritméticos de comparación.
## Pregunta 9: 
La función de grupo AVG (expr):
Devuelve el valor máximo de expr.
Devuelve el valor medio de expr ignorando los valores nulos.
Devuelve el número de valores no nulos de expr.
## Pregunta 10: 
Cuando se quiera eliminar filas de una tabla en una tabla a partir de subconsultas:
La tabla destino puede aparecer en la consulta.
Podemos incluir ORDER BY o LIMIT en la consulta.
Las dos respuestas anteriores son falsas.
Adjuntar ArchivosNombre del fichero: Descripción del fichero: Si necesitas Adjuntar algún archivo selecciónalo aquíTen en cuenta que:
- El tamaño de los archivos está limitado a: 20.0 Mb
- La transferencia puede durar unos segundos
- Si son varios archivos comprímelos en unoEnvíe la actividad

