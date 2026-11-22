# Mini Diccionario

Crea un mini-diccionario español-inglés que contenga, al menos, 20 palabras en un fichero CSV con el formato siguiente:

    hello:hola
    bye:adios
    who:quien
    why:porque

El programa pedirá una palabra en español y dará la correspondiente traducción en inglés.

    $ java -jar diccionario.java data/spanish.csv bye

## Clase Diccionario

Utiliza un objeto de la clase HashMap para almacenar las parejas de palabras. 

### Atributos, Constructor

- Diccionario(String filename)

### Metodos

- boolean contiene(String)
- String toString() devuelve el contenido del diccionario

