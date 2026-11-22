# T9 Consultas dentro de otras instrucciones. Vistas
CREATE TABLE PRODUCTOS (
    PRODUCTO_NO INT(4), DESCRIPCION VARCHAR(30), 
    PRECIO_ACTUAL FLOAT(8,2), STOCK_DISPONIBLE INT(9), 
    CONSTRANT PK_PRODUCTO_NO PRIMARY KEY (PRODUCTO_NO)
);

CREATE TABLE EMPLEADOS (
    EMP_NO INT(4), APELLIDO VARCHAR(8), 
    OFICIO VARCHAR(10), DIRECTOR INT(4), 
    FECHA_ALTA DATE, SALARIO FLOAT(6,2), 
    COMISION FLOAT(6,2), DEP_NO INT(2)
); 

CREATE TABLE PRODUCTOS (
    PRODUCTO_NO INT(4), DESCRIPCION VARCHAR(30), 
    PRECIO_ACTUAL FLOAT(8,2), STOCK_DISPONIBLE INT(9), 
    CONSTRAINT PK_PRODUCTO_NO PRIMARY KEY (PRODUCTO_NO) 
)ENGINE=INNODB;

## Pregunta 1: 
Cuando realicemos una SELECT mediante composición de varias tablas:
    Podemos utilizar todas las cláusulas existentes para la SELECT.
    Existe limitación en el uso de ORDER BY y LIMIT.
    Tenemos una limitación importante en el uso de GROUP BY.
## Pregunta 2: 
Dada la siguiente definición de la tabla PRODUCTOS: CREATE indicar con qué sentencia recuperamos el número de producto y la descripción de los productos ordenados por la longitud de su DESCRIPCIÓN, empezando por el de menor longitud y acabando en el más largo:
    SELECT PRODUCTO_NO, DESCRIPCION FROM PRODUCTOS ORDER BY LENGTH(descripcion) DESC.
    SELECT PRODUCTO_NO, DESCRIPCION FROM PRODUCTOS ORDER BY LENGTH(descripcion) ASC.
    SELECT PRODUCTO_NO, DESCRIPCION FROM PRODUCTOS ORDER BY LONG(descripcion) ASC.
## Pregunta 3: 
Dada esta definición de la tabla EMPLEADOS: para recuperar los 5 empleados que tienen mayor SALARIO, lo haremos con la sentencia:
    SELECT * FROM empleados ORDER BY salario LIMIT 5.
    SELECT * FROM empleados ORDER BY salario DESC LIMIT 5.
    SELECT * FROM empleados LIMIT 5 DESC.
## Pregunta 4: 
Dada la definición de la tabla EMPLEADOS: para recuperar en qué día del mes se incorporaron a la empresa, lo haremos con la sentencia:
    SELECT EMP_NO, APELLIDO, DAYOFMONTH(fecha_alta) FROM EMPLEADOS.
    SELECT EMP_NO, APELLIDO, DAYNAME(fecha_alta) FROM EMPLEADOS.
    SELECT EMP_NO, APELLIDO, DATEDIFF(fecha_alta) FROM EMPLEADOS.
## Pregunta 5: 
Dada la siguiente definición de la tabla PRODUCTOS indicar con qué sentencia recuperamos los datos de los productos que contengan la cadena MESA:
    SELECT * FROM PRODUCTOS WHERE LOCATE (`MESA´, descripcion) <>0.
    SELECT * FROM PRODUCTOS WHERE LENGTH (`MESA´, descripcion) <>0.
    SELECT * FROM PRODUCTOS WHERE CONCAT (`MESA´, descripcion) <>0.
## Pregunta 6: 
Para borrar la vista MI_VISTA, utilizaremos la sentencia:
    DELETE VIEW MI_VISTA.
    DROP VIEW MI_VISTA.
    DELETE TABLE MI_VISTA.
## Pregunta 7: 
Los datos que recuperamos en una vista:
    Son actualizables directamente en la vista.
    Se actualizarán sobre las tablas que intervienen en la vista.
    No se pueden actualizar de ninguna forma.
## Pregunta 8: 
Una vista es:
    Una instantánea que almacena el estado de una o varias tablas en un momento determinado.
    Una tabla virtual y dinámica generada a partir de una consulta almacenada.
    Una selección de filas que almacenamos en una tabla estática.
## Pregunta 9: 
Cuando para eliminar filas de una tabla utilizamos subconsultas anidadas:
    La tabla destino no puede aparecer en el FROM de ninguna de las subconsultas.
    La tabla destino debe aparecer en el FROM de las subconsultas.
    La tabla destino se vinculará con las subconsultas mediante alias.
## Pregunta 10: 
En una sentencia SELECT, la cláusula DISTINCT establece:
    Que distinguiremos los valores obtenidos.
    Que recuperaremos los valores no repetidos de todos los elementos.
    Que recuperaremos todos los valores.
