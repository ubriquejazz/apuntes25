# Listar en forma de tabla el número de archivos de cada tipo de extensión que hay 
# en el directorio c:\windows\sytem32 ordenados por la extensión.

Get-ChildItem C:\Windows\System32\*.* | 
    Sort-Object extension | 
    Select-Object Name, CreationTime, Length, extension, IsReadOnly | 
    Format-Table
