# Comandos

    find . name linux*
    -name <nombreFichero>
    -user <usuario>
    -perm -777 # que tengan todos los permisos
    -atime +100 # no usados durante más de 100 días
    -mtime -10 # ficheros modificados durante los últimos
    -type      # f para ficheros d para directorios

# Regexp

    Intervalo entre corchetes [a-z] [a-fn-z] que puede sustituir al comodín ? (interrogación) 
    También para una lista de valores [abc]
    [!a-z] → cualquier carácter excepto estos
    *[!e] → Representa cualquier archivo que no termine con la letra minúscula “e”

# Actividades

    # ciclos

    Crear estructura de directorios compatible con módulos ciclos formativos como se ha mostrado en las diapositivas.
    Crear los ficheros correspondientes a los temas dentro del directorio del módulo profesional al que pertenece.
    Copiar el contenido del directorio “daw/si” al directorio “dam/si”
    Obtener las diferencias de los directorios daw y dam

        diff dam.txt daw.txt -y | cat -n | tee compara.txt

    # multiplicar

    Script que nos pregunte un número por teclado e imprima en pantalla la tabla de multiplicar de ese número.
    Implementantarlo con bucles for, while & until


