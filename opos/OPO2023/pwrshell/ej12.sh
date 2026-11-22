#12.- Obtener en un fichero el nombre de todos los ficheros con extensión .txt 
# que se encuentre en toda la estructura de directorios de disco C:\

Get-ChildItem -path "C:\\" -include "*.txt" -Recurse > ficherostxt.txt

# Este script tarda un poco en completarse.