# Presentar en forma de lista los archivos de c:\windows\sytem32 que sean ejecutables (exe, com) 
# mostrando el nombre, tamaño, extensión y si es de solo lectura.

Get-ChildItem C:\Windows\System32\*.exe | 
    Select-Object Name, CreationTime, Length, extension, IsReadOnly | Format-List

Get-ChildItem C:\Windows\System32\*.com | 
    Select-Object Name, CreationTime, Length, extension, IsReadOnly | Format-List

# Otra forma:
$script:execute_files = 'C:\Windows\System32\*'
$script:files_extensions = '*.exe', '*.com'
Get-ChildItem -Path $execute_files -Include ($files_extensions) | 
    Select-Object Name,Mode,Length
