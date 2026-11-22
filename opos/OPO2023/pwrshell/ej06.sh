# Calcular el factorial de un número dado como argumento
$numero = $args[0]
function Get-Factorial([int]$numero) {
    if($numero -lt 0) {
        $resultado = 0
    } elseif($numero -le 1) {
        $resultado = 1
    } else {
        $resultado = $numero * (Get-Factorial($numero - 1))
    } 
    return $resultado
}

$resultado = Get-Factorial $numero 
Write-Output "El factorial de $numero es $resultado"
