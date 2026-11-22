# Realiza un script que contenga un array de doce posiciones, 
# en cada posición el nombre de cada uno de los meses del año. 
# Que pida un número del 1 al 12 y que muestre el nombre

$mes = "enero","febrero","marzo","abril","mayo","junio","julio","agosto","septiembre","octubre","noviembre","diciembre"
$numeromes= Read-Host -Prompt "Elige un número del 1 al 12" 
Write-Host El numero $numeromes corresponde a $mes[$numeromes -1]
