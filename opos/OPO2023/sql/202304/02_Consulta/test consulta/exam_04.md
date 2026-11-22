# T8 Consultas multitabla

## Pregunta 1: 
La función de grupo SUM(expr):
    Devuelve el número de filas que cumplen expr.
    Calcula qué filas coinciden con expr.
    Calcula la suma de expr.
## Pregunta 2: 
Indicar qué sentencia es la correcta:
    En el LEFT JOIN obtenemos todas las filas de la izquierda aunque no tengan correspondencia en las filas de la derecha.
    En el RIGHT JOIN obtenemos todas las filas de la derecha aunque no tengan correspondencia en las filas de la izquierda.
    Las dos sentencias anteriores son correctas.
## Pregunta 3: 
El Outer Join (Left - Right) se utiliza cuando:
    Queremos unir columnas de la izquierda con la derecha.
    Queremos unir columnas de la derecha con la izquierda.
    No queremos perder ningún valor que no esté emparejado.
## Pregunta 4: 
En las consultas correlacionadas:
    Siempre necesitaremos utilizar ALIAS.
    Debemos utilizar ALIAS cuando coincida el nombre de una columna de la subconsulta con el nombre de alguna columna de la SELECT.
    Siempre utilizaremos ALIAS para los nombres de las tablas de la subconsulta.
## Pregunta 5: 
En las subconsultas con más de una expresión:
    Utilizaremos el operador = cuando la subconsulta devuelva un valor único.
    Utilizaremos el operador IN cuando la subconsulta devuelva varios valores.
    Las dos respuestas anteriores son ciertas.
## Pregunta 6: 
Con subconsultas, el operador EXISTS:
    Necesita que la subconsulta devuelva el número de columnas necesarias para evaluar la expresión.
    Siempre retornará valor TRUE.
    Permite la utilización de * en la subconsulta porque el número de columnas devuelto en la subconsulta puede ser cualquiera.
## Pregunta 7: 
La utilización de LIMIT junto con GROUP BY:
    No está permitida en ningún caso.
    Limitará el número de registros devueltos por la sentencia.
    Limita los grupos procesados por la sentencia.
## Pregunta 8: 
Señalar la opción correcta:
La cláusula WHERE realiza un primer filtrado y agrupación, GROUP BY separará en filas la agrupación anterior y para finalizar HAVING filtrará todo.
    La cláusula WHERE filtra con su condición, la cláusula GROUP BY agrupa el resultado anterior creando una nueva tabla y HAVING realiza un filtrado del mismo.
    La cláusula WHERE realiza un primer filtrado y si no encuentra filas fque cumplan la condición entonces se verifica el GROUP BY o el HAVING.
## Pregunta 9: 
Las funciones de grupo:
    Siempre se utilizan conjuntamente con GROUP BY.
    Nunca se utilizan con GROUP BY para agrupar.
    Pueden utilizarse sin GROUP BY considerando un único grupo.
## Pregunta 10: 
Cuando una consulta pueda ser resuelta mediante join (composición) o subconsulta, por eficiencia escogeremos:
    Hacerla mediante join, mucho más eficiente.
    Realizar una subconsulta, es la opción óptima.
    Es indiferente realizar una u otra.
