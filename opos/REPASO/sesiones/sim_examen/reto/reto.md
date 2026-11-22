# Reto

Ejercicio de  auditoría sobre los ficheros /etc/passwd y /etc/shadow, dos archivos clave del sistema Linux para la gestión de usuarios. Vamos paso a paso y de como “ver si tienen contraseña, si está bloqueada, o si está vacía”, basándonos en el campo del hash en /etc/shadow.

## Objetivo

1. Leer /etc/passwd y filtrar usuarios: con shell nologin o con shell bash
1. Comprobar en /etc/shadow:

- si tienen contraseña válida (campo con hash)
- si está bloqueada (! o *)
- si no tienen contraseña (campo vacío)

## /etc/passwd 

En el fichero /etc/passwd se encuentra información de los usuarios que hay en el sistema.

    Columna 1: nombre de usuario para login.
    Columna 2: contraseña del usuario. 
    
Si se muestra una “x” la contraseña se sitúa en /etc/shadow. 
Si se muestra una cadena de números y letras, la contraseña está en /etc/passwd pero encriptada.

    Columna 3: número de identificado (UID).
    Columna 4: Numero de identificador del grupo (GID). 
    Columna 5: nombre completo de usuario, si lo hubiera. 
    Columna 6: Directorio de trabajo del usuario.
    Columna 7: Shell que utilizará el usuario en cuestión. 
    
Si es “nologin” significa que no tendrá shell propia.

## /etc/shadow

En el fichero /etc/shadow también hay información relativa al usuario...

## Se pide

Programar un script de linux en shell que obtenga la siguiente información en un fichero RESULTADO.TXT:

- Análisis básico de los usuarios del sistema leyendo filtrando usuarios según su shell ... primero los que no tienen shell(nologin), a continuación los que tienen asignada la shell bash.

- Combinación de los campos de ambos ficheros para hackear la password de los usuarios con shell
