## Gestion de datos
1. El lenguaje de gestión de bases de datos
2. Elementos del lenguaje
3. Creacion de tablas (CREATE)                  <==> U4 10%
4. Actualizacion de datos (INSERT)              <==> U9 10%
9. 

## Consultas
5. Las consultas sencillas                      <==> U6 6%
6. Las funciones de grupo (GROUP BY)            ║
7. Subconsultas (IN, ANY, ALL)                  ╚══> U7 8%
8. Consultas multitabla (JOIN)                  <==> U8 6%

Aquellos departamentos que no tengan empleados no aparecerán porque para esos departamentos no se cumplirá la igualdad empleados.dep_no = departamentos.dep_no

Es aconsejable que la salida, obtenida por una consulta en la que se pudiera presentar esta posibilidad, muestre todas las filas, aunque algunas con falta de información. Para conseguir este resultado se utiliza la composición o combinación externa (OUTER JOIN)

---

El operador **ANY** con uno de los operadores aritméticos compara el valor de la expresión formada a partir de la consulta principal con valores producidos por la subconsulta. Si **alguna de las comparaciones** produce un resultado verdadero (TRUE), el operador ANY devuelve un resultado verdadero (TRUE).

El operador **ALL** también se utiliza con los operadores aritméticos para comparar un valor de la expresión formada a partir de la consulta principal con cada uno de los valores de datos producidos por la subconsulta. Si **todos** los resultados de las comparaciones son ciertos (TRUE), el operador ALL devuelve un valor cierto (TRUE).

Se utiliza cuando la condición de selección consiste exclusivamente en comprobar que la subconsulta devuelve alguna fila seleccionada según la condición incluida en la propia subconsulta. El operador EXISTS no necesita que la subconsulta devuelva alguna columna porque no utiliza ninguna expresión de comparación, justificando así la aceptación del * en el formato de la misma.

