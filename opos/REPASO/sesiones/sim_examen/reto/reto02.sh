#!/bin/bash

echo "=== Análisis de usuarios del sistema ==="
read -p "Introduce el directorio donde guardar el log: " ws

# Comprobar si existe el directorio, si no, crearlo
[ ! -d "$ws" ] && echo "Creando directorio..." && mkdir -p "$ws"

OUTPUT="$ws/logs.txt"
echo "Guardando resultados en: $OUTPUT"

echo ">> Usuarios con shell nologin ------------------------------" | tee "$OUTPUT"
grep 'nologin$' /etc/passwd | tee -a "$OUTPUT"

echo "" | tee -a "$OUTPUT"
echo ">> Usuarios con shell bash ---------------------------------" | tee -a "$OUTPUT"
grep 'bash$' /etc/passwd | tee -a "$OUTPUT"

echo "" | tee -a "$OUTPUT"
echo ">> Análisis de contraseñas desde /etc/shadow ---------------" | tee -a "$OUTPUT"
echo "(usuarios con shell y contraseña activa, bloqueada o vacía)" | tee -a "$OUTPUT"
echo "" | tee -a "$OUTPUT"

# Leer usuarios con shell válida (no nologin)
grep -v 'nologin$' /etc/passwd | while IFS=: read -r usuario x uid gid nombre home shell
do
    # Obtener línea de /etc/shadow correspondiente
    shadow_line=$(grep "^$usuario:" /etc/shadow)
    hash=$(echo "$shadow_line" | cut -d: -f2)

    estado=""
    case "$hash" in
        '!'*|'*')
            estado="Bloqueado"
            ;;
        '')
            estado="Sin contraseña"
            ;;
        *)
            estado="Contraseña activa (hash presente)"
            ;;
    esac

    printf "Usuario: %-15s | Estado: %s\n" "$usuario" "$estado" | tee -a "$OUTPUT"
done
