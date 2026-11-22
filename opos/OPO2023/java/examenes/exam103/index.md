## Examen Final 1er Trimestre

Programación – Curso 2019-20		


1. Escribe la función **elementosComunes3** a la que le pasaremos tres arrays de enteros. La función será de tipo void y no devolverá nada. La función deberá imprimir por pantalla los elementos sean comunes a los tres arrays, es decir, que estén en el primero y también en el segundo y también en el tercero.

   ​		Ej.: a1=[1, 3, 5, 7], a2=[2, 3, 4, 5, 6, 7], a3=[1, 2, 3, 4, 5]

   ​		Escribirá por pantalla el 3 y el 5, que son los elementos comunes a los 3.

2. Escribe la función **separaNegativosPositivos** a la que le pasamos un array de enteros y nos devolverá otro array de enteros con el resultado. Esta función deberá separar los números negativos y positivos que hay dentro del array, de manera que los negativos queden al principio y los positivos queden al final, pero manteniendo el orden original de éstos. El array original no debe sufrir modificaciones. 

      Ej.: [5, 2, -1, -2] -> [-1, -2, 5, 2] ; [4, -5, 1, -8, 2, -1] -> [-5, -8, -1, 4, 1, 2]

3. Escribe la función **palabrasImpares** a la que le pasamos una cadena de caracteres y nos devuelve otra cadena de caracteres con el resultado. La función contará el número de letras de cada palabra y dejará dentro de la cadena sólo las palabras con un número de letras impar.

      Ej.: “El perro de San Roque” -> “perro San Roque”

4. Escribe la función **cuentaDiptongos** a la que le pasamos una cadena de caracteres y nos devuelve un entero, que será el número de diptongos que hay en la cadena. Para los que se saltaron la ESO, un diptongo es cuando hay dos vocales seguidas, siempre y cuando las dos vocales no sean fuertes (o sea, “ae”, “ea”, “ao”, “oa”, “eo” y “oe” no son diptongos).

      Ej.: “Puede caer una bien buena” -> 3 diptongos

    Para que el ejercicio esté completo, se han de tener en cuenta también:

    - Los acentos: comió -> sí, oído -> no
    - La semivocal ‘y’: voy -> sí, yo -> no
    - Opcional: para subir nota, podéis intentar hacerlo con estas excepciones:
      - La ‘u’ muda: queso -> no, guepardo -> no
      - La ‘u’ con diéresis: cigüeña -> sí
      - La ‘h’ intercalada: ahijado -> sí

5. Escribe la función **graficaBarras** a la que le pasamos un array de enteros y nos muestra una gráfica de barras por pantalla.

      Ej.: [4, 8, 9, 1, 5]

- Antes de pintar la gráfica, habrá que comprobar que todos los valores estén entre 0 y 9. Si hay valores incorrectos, no se pinta la gráfica y se muestra un mensaje de error.
- Usar el carácter ASCII 219 (█) para las barritas
- Dejar un espacio en blanco entre barra y barra para que quede bonito.
- Opcional: que los valores del 5 al 9 salgan en verde y los valores del 0 al 4 en rojo.

