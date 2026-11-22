# Realiza un script que contenga un array de doce posiciones, 
# en cada posición el nombre de cada uno de los meses del año. 
# Que pida un número como argumento en la llamada al script.

$mes = "Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"
$numeromes = $args[0]
Write-Host Has introducido el número $numeromes, que se corresponde con $mes[$numeromes - 1]