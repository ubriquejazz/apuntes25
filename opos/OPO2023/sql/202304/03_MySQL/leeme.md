# CONCESIONARIO

A partir del fichero ASCII concesionario.txt (con carácter delimitador # y con campos entrecomillados) con la siguiente información "MARCA"#"MODELO"#"MATRICULA"#PRECIO

Necesitamos importar a MySQL la información en él contenida, pero optimizando el almacenamiento, estructurando la información de la siguiente manera:

## TABLA MARCAS
+----------+------------+
| ID_MARCA | MARCA      |
+----------+------------+
|        1 | CITROEN    |
|        2 | FORD       |
|        3 | HONDA      |
|        4 | MERCEDES   |
|        5 | SAAB       |
|        6 | SEAT       |
|        7 | PEUGEOT    |
|        8 | RENAULT    |
|        9 | VOLKSWAGEN |
+----------+------------+

## TABLA MODELOS
+--------+----------+---------+
| ID_MOD | ID_MARCA | MODELO  |
+--------+----------+---------+
|      1 |        1 | C2      |
|      2 |        1 | C3      |
|      3 |        1 | C4      |
|      4 |        1 | PICASSA |
|      5 |        2 | MONDEO  |
|      6 |        2 | S-MAX   |
|      7 |        3 | ACCORD  |
|      8 |        3 | CIVIC   |
|      9 |        4 | CLS     |
|     10 |        5 | 900     |
|     11 |        6 | IBIZA   |
|     12 |        6 | LEON    |
|     13 |        7 | 307     |
|     14 |        7 | 308     |
|     15 |        7 | 407     |
|     16 |        7 | 408     |
|     17 |        8 | MEGANE  |
|     18 |        9 | GOLF    |
|     19 |        9 | PASSAT  |
|     20 |        9 | TOUAREG |
+--------+----------+---------+

## TABLA COCHES
+----------+--------+-----------+--------+
| ID_COCHE | ID_MOD | MATRICULA | PRECIO |
+----------+--------+-----------+--------+
|        1 |      4 | CPG-2044  |  12000 |
|        2 |      4 | CPR-1762  |  12500 |
|        3 |      3 | FPP-1464  |  13500 |
|        4 |      3 | FDR-4563  |  13000 |
|        5 |      2 | BDF-8856  |   8000 |
|        6 |      2 | BPZ-7878  |   7500 |
|        7 |      1 | CDR-1515  |   5000 |
|        8 |      1 | BCC-3434  |   4500 |
|        9 |      5 | BTG-3267  |   8000 |
|       10 |      5 | BPP-6792  |   8200 |
|       11 |      6 | FDR-1564  |  20000 |
|       12 |      6 | FCE-9327  |  21000 |
|       13 |      8 | FCC-7764  |  16000 |
|       14 |      8 | FBC-4567  |  14000 |
|       15 |      7 | FFC-6768  |  22000 |
|       17 |      9 | FDR-2265  |  31000 |
|       18 |     10 | FPG-1165  |  21000 |
|       19 |     12 | DVB-1119  |  14500 |
|       20 |     12 | DCR-5634  |  13500 |
|       21 |     11 | DPR-3434  |   9500 |
|       22 |     11 | DPP-8756  |  10000 |
|       23 |     13 | DGX-4598  |   5500 |
|       24 |     13 | DGG-2098  |   5000 |
|       25 |     14 | DPK-3859  |   5500 |
|       26 |     14 | DVK-4987  |   6000 |
|       27 |     15 | FFK-1513  |   7500 |
|       28 |     15 | FPP-3768  |   8000 |
|       29 |     16 | CPG-7879  |  10000 |
|       30 |     16 | CRC-9738  |   9500 |
|       31 |     17 | CQC-4298  |  11000 |
|       32 |     17 | FNZ-7688  |   6000 |
|       33 |     19 | FNR-3987  |  16000 |
|       34 |     19 | FQK-3987  |  18000 |
|       35 |     18 | FCJ-0909  |  22500 |
|       36 |     18 | FCK-3989  |  21000 |
|       37 |     20 | DGG-0937  |  42000 |
+----------+--------+-----------+--------+

## Estructura interna
 1. Localización del directorio de datos
 2. Estructura del directorio de datos
 3. Arquitecturas de almacenamiento de las tablas

## Configuración
 1. Usar opciones de configuración a través de la línea de comandos
 2. Usar ficheros de opciones (ficheros de configuración)

## Administración de cuentas de usuario y seguridad
 1. Introducción a las sentencias GRANT y REVOKE
 2. Sintaxis de la sentencia GRANT
 3. Sintaxis de la sentencia REVOKE
 4. Algunos ejemplos de la sentencia GRANT
 5. Eliminar una cuenta de usuario.

## Índices
 1. Tipos de índices y su creación
 2. Eliminar o cambiar un índice
 3. Uso eficiente de los índices

## Backup
 1. mysqldump, mysqlhotcopy
 3. Importar tablas desde ficheros de texto delimitado

## Ficheros Log
 1. El log de error (error log)
 2. El fichero log general (query log file)
 3. El fichero log de modificaciones (update log )
 4. El fichero de log binario (binary log)

## Ejecutar varios servidores MySQL en la misma máquina
 1. Ejecutar varios servidores MySQL en Windows
 2. Ejecutar varios servidores MySQL en Linux

## Replicación
 1. Ventajas de la replicación
 2. Implantación del servicio de replicación
 3. Otros datos útiles en el proceso de replicación
 4. Posibles arquitecturas de replicación