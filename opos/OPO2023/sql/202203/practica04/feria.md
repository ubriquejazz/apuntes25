
You want to store information regarding an edition of the Feria del Caballo de Jerez.

## Requirements

- The space of the fair is made up of several walks or streets. You want to know the name of each one (for instance, Paseo de las Palmeras, Calle La Paquera de Jerez, ...)

- The booths are located in one of these streets. Although some can be located on a corner only the street where the booth has more meters of frontage is of interest. Each booth is identified by a consecutive number (eg from 001 to 213 in the last edition).

- For each stand, we also want to know the name of the owner and the number of square meters it occupies.

- Some booths have members, of whom you want to know their full name (surname and first name), their ID, telephone number and the number of guest passes they have. We cannot exclude that the same person may be a member of more than one booth.

- For each booth, you want to know the number of members it has.

- Finally, and for statistical purposes, we want to know the price in euros of the typical drinks of the fair on different booths (for instance, a pot of rebujito, potato omelet, ...).

- It is known that, internally, there is a kind of “brotherhood” between booths that facilitates their promotion, so we want to know which booths are twinned with each other. A booth can be twinned with none or many booths.


## Exercise:

E/R model and tables (DDL) 
Create some functions and views (PL/SQL)

1. Create a function that receives as a parameter the number of a booth and returns the number of members of it

2. Create a procedure that displays a list of all booths indicating the following fields: name of the booth, street where it is located and the booth number (id). It will receive as a parameter a character to indicate how to order the list: alphabetically ('a') or by booth number ('n')

3. Create a view that shows the description of the prize (prize), the name of the booth (booth) and its location, indicating street and number separated by a comma (location)

4. Create a view of prices that contains the different drinks (id) and the average price of that drink in the different booths of the fair (average).

Note: There is not a specific word for ‘caseta’ in English. We use “booth or stand” here but the context is different as you might guess.

# SPANISH

Se desea almacenar información referente a una edición de la Feria del Caballo de Jerez. Para ello se sabe que

- El real de la feria está compuesto por varios paseos o calles. De cada uno se quiere conocer su nombre (p.ej. Paseo de las Palmeras, Calle La Paquera de Jerez, ...)

- Las casetas están ubicadas en una de estas calles, aunque algunas pueden dar a dos, pero sólo interesa la calle donde la caseta tenga más metros de fachada. Cada caseta se identifica por un número consecutivo (p.ej. del 001 al 213 en la última edición).

- De cada caseta se quiere conocer, además, el nombre del titular y la cantidad de metros cuadrados que ocupa.

- Algunas casetas tienen socios, de los que se quiere conocer su nombre completo (apellidos y nombre), su dni, hasta dos teléfonos de contacto y el número de pases para invitados que posee. No podemos excluir que una misma persona sea socio de más de una caseta.

- De cada caseta se quiere conocer el número de socios que tiene.

- El Ayuntamiento otorga premios a tres casetas en cada edición (Primer, Segundo y Tercer Premio) de los cuales se quiere tener constancia.

- Finalmente, y con fines estadísticos, se quiere conocer el precio en euros de las distintas casetas sobre consumiciones típicas de la feria (p.ej. maceta de rebujito, tortilla de papas, media de fino, ...).

- Se conoce que, internamente, existe una especie de “hermandad” entre casetas que facilitan su promoción, por lo que se quiere conocer qué casetas están hermanadas entre sí. Una caseta puede estar hermanada con ninguna o con muchas caseta.

1. Crear funcion F1 que reciba como parametro el numero de una caseta y devuelva el numero de socios de la misma  

2. Crear procedure P1 que muestre un listado de todas las casetas indicando los siguientes campos:
nombre de la caseta, calle en la que se ubica y el numero de caseta (id). 
Recibira como parametro un caracter que valdra 'a', si el listado que se quiere es alfabetico, y 'n' si el listado es por numero de caseta.

3. Crear VISTA premiados que muestre la descripcioN del premio (premio), el nombre de la caseta (caseta) y la localizacion de la misma indicando calle y numero separados por una coma (localizacion) 

4. Crear VISTA precios que contenga las diferentes consumiciones (id) y el precio medio que tiene esa consumicioN en las diferentes casetas de la feria (precio_medio). 