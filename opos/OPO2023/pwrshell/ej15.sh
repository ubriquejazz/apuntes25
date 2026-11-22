# Obtener un listado a tres columnas de los archivos de c:\windows y sus subdirectorios 
# que tengan tamaño mayor de 2MB y la fecha de último acceso esté en los últimos 7 días.
# Obtener el resultado de la ejecución de este script en un fichero si se le pasa como 
# argumento. Si no hay argumentos la salida será por pantalla.

Get-ChildItem -Path $list_dir_path_recursive -Recurse -Force | 
    Where-Object {($_.Length -gt 2MB) -and ($_.LastAccessTime -lt (GetDate).AddDays(-7))} | 
    Select-Object Name | 
    Format-Wide -Column 3