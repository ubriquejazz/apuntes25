# 08.- Pedir un número por teclado y mostrar en pantalla la tabla de multiplicar de ese número
# pero al revés: comenzando por “N x 10 = …”

$j = Read-Host "¿Qué tabla de multiplicar quieres?"
$i = 0
for ($i=0;$i -lt 11;$i++) { 
    $m=$i*$j 
    echo "$i x $j = $m" 
}