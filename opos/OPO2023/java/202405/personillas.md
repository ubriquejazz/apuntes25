# Corredores

Realizar una serie de programas para la gestión de un club de atletismo. El núcleo del programa será un objeto de la clase Corredores que gestiona la información de hasta 50 personas. La información de cada corredor incluye los siguientes campos:

- DNI: cadena que identifica al corredor
- Nombre: del corredor, de tipo cadena
- Fecha: día, mes y año de nacimiento

A parte del constructor y métodos getters como para consultar las propiedades de un corredor, implementar el método getCategoria que devuelva un valor según la tabla:

    0		Juvenil		16 ó 17 años (sub 18)
    1		Junior		18 ó 19 años (sub 20)
    2		Promesa		20, 21 ó 22 años (sub 23)
    3		Senior		23 años o mas

## Ejecutable

    $ java -jar listado.jar
    Uso: java -jar listado.jar <fichero_csv> <categoria>

La figura siguiente muestra un ejemplo de pantalla donde se observa los corredores menores de 18 años (juveniles)

    $ java -jar listado.jar data/corredores.csv 0
    Listado de corredores juveniles

    DNI     Nombre                  Nacimiento  Categoria   
    ------  ----------------------- ----------  —--------
    112233  Alex Cremento           12-05-2003  Promesa
    445566  Aitor Tilla             24-05-2004  Junior

En caso de que no existan corredores de la categoría solicitada se mostrará un mensaje de error explicativo.


## Ejecutable

    $ java -jar alta.jar
    Uso: java -jar alta.jar <fichero_csv>

    $ java -jar alta.jar data/corredores.csv     
    DNI: 334455
    Nombre: Armando Bronca Segura
    Día nacimiento: 24
    Mes nacimiento: 5
    Anio nacimiento: 2004
    Corredor 334455 creado

Antes que el usuario introduzca los campos de un corredor, se ha tenido en cuenta que el DNI del nuevo corredor es distinto de los DNIs de los corredores que ya han sido dados de alta. Si no es así, se informará de que ya hay un corredor con el mismo DNI y no se introduce el nuevo corredor.

## Ejecutable

    $ java -jar buscar.jar 
    Uso: java -jar buscar.jar <fichero_csv> <dni>

En caso de que el dni introducido no exista dentro del objeto Corredores, se informará de que no hay ningún corredor con ese dni. En caso contrario se muestra sus detalles:

    $ java -jar buscar.jar data/corredores.csv 334455

    DNI     Nombre                  Nacimiento  Categoria    
    ------  ----------------------- ----------  —--------
    334455  Armando Bronca Segura   24-05-2004  Junior

Nota: Se puede hacer con un array estático de 50 eventos pero se valorará positivamente el uso de colecciones vistas en clase: ArrayList o HashMap.
