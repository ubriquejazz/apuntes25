# Dados tres números como argumentos, obtener la suma y mostrarla en pantalla 
# junto con un mensaje que lo aclare: “La suma es...”.

$numero1 = $args[0]
$numero2 = $args[1]
$numero3 = $args[2]

$resultado = [int]$numero1+$numero2+$numero3
Write-Output "La suma es $resultado"