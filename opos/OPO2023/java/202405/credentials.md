# Credentials

Write a login form for to enter your username and password

    $ java -jar credentials.jar data/users.txt
    Username: juan
    Password: 1234

The database is stored in a file with the following format

    juan@1234
    pepe@none
    ana@12345

If the user exists and his/her password is correct, the content of the file is shown. Otherwise, an error message is displayed:

    The username and/or password are incorrect
    $ _

There will be a helper message about how to use the program:

     $ java -jar credentials.jar
     Usage: java -jar credentials.jar <file>

## Clase Diccionario

### Atributos, Constructor

- Utiliza un objeto de la clase HashMap para almacenar las parejas usuario / contrasena.
- El nombre del fichero tambien sera una variable de la instancia
- El constructor sera algo como Diccionario(String filename) y cargara su contenido en el HashMap

### Metodos

- boolean check(String user, String password) -> Devuelve true si el usuario existe y la contrasena es correcta

- String toString() -> Muestra todas las contrasenas almacenadas en el fichero.