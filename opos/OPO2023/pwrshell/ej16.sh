# Obtener un listado en formato CSV de los procesos que se están ejecutando 
# en la máquina ordenados de forma descendente por el consumo de procesador. 
# Posteriormente abrir el fichero generado desde una aplicación como excel 

Get-process | Sort-Object - Property CPU -descending | Export-Csv procesos.csv -delimiter ';'