# Oposiciones 2021 Andalucia

## Ejercicio Bash

Disenar un script que permita comproba las caracteristicas de un fichero o directorio

    ./supuesto.sh --help supuesto.sh
    introduzca nombre de usuario:
    supuesto.sh [opciones] fichero|directorio
    -l | --legible el fichero o directorio se puede leer
    -m | --modificable el fichero o directorio se puede modificar
    -x | --ejecutable el fichero o directorio se puede ejecutar
    -h | --help muestra esta ayuda

    ./supuesto.sh --legible -m supuesto.sh 
    introduzca nombre de usuario:
    el fichero es legible modificable

---

    ./supuesto.sh --hlp
    introduzca nombre de usuario:
    opcion no valida - 3
    ./supuesto.sh --help
    introduzca nombre de usuario:
    no tiene acceso - 2
    ./supuesto.sh --legible -m <inexistente> 
    introduzca nombre de usuario:
    directorio o fichero no valido - 1

## Ejercicio E/R

Una gran multinacional ha comprado varias compañías de salud y desea diseñar una base de datos que recoja la información relativa a las distintas compañías y a los asegurados.

Para el diseño de dicha base de datos se debe tener en cuenta lo siguiente:

- Existen varias compañías de salud de las que nos interesa almacenar el cif, un nombre y un conjunto de teléfonos que estarán disponible para que los clientes contacten con ellos. Además, cada compañía dispone de un conjunto de seguros que ofrecerá a sus asegurados.

- Las compañías de salud contratan convenios con determinados hospitales, al menos con uno, aunque a las compañías les interesa tener muchos hospitales para poder convencer a los clientes. Los distintos hospitales podrán trabajar con varias compañías (al menos una) y de los hospitales se debe almacenar el nombre, que será único, y la razón social o dirección, así como la fecha en la que contrató el convenio con cada una de las compañías de salud con las que las que tenga convenio.

- De los asegurados se debe almacenar su dni o cif, el nombre, apellidos y la dirección. Los asegurados podrán contratar varios seguros (salud, dental, con copago, etc), y cada seguro será de una única compañía. De los distintos seguros se deberá almacenar un nombre, que será único, y una descripción de las condiciones. Cada seguro es contratado por un único asegurado.

- Existen dos tipos de asegurados, los que disponen de una mutualidad, de los que interesa saber el nombre de la mutua y los clientes que han contratado el seguro de forma privada, de los que necesitaremos conocer su número de cuenta y el coste de la mensualidad. Además, podemos tener asegurados que dependen de otro asegurado y por lo tanto tendrán los mismos seguros, por ejemplo, los hijos que están incluido en el seguro de uno de sus progenitores.

**Diseñar el esquema E/R empleando el modelo extendido**

## Ejercicio SQL

Se consideran las siguientes tablas en una aplicación en la que se tienen los datos de una persona, de la empresa en la que trabaja y de los padres de la misma:

    PERSONA (dni, nombre, apellidos, empresa, salario) 
    PK(dni) 
    FK(empresa/Empresa(cif))

    PADREMADRE(dniPadreMadre, dniHijo) 
    PK(dniPadreMadre, dniHijo) 
    FK(dniPadreMadre/Persona(dni) 
    FK(dniHijo/Persona(dni)

**Escriba las sentencias SQL para realizar las siguientes consultas:**

1. Obtener el nombre y apellido del padre y de la madre de “Pepe Pérez Pérez”

2. Obtener un listado con el nombre de las empresas y el total de los salarios de todos los empleados de la empresa ordenados de forma que las empresas que gasten más dinero en sus salarios se muestren al principio.

3. Subir el salario un 10% a todas las personas que trabajen en las empresas de Sevilla (Considere que en el campo dirección se encuentra entre otros datos la provincia).

4. Mostrar el nombre y apellido de las personas que cobran más que la media del salario de todas personas que están recogidas en la base de datos.