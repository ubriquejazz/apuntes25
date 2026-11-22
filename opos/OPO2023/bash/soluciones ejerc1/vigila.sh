#!/bin/bash
while true
do
	date >> /tmp/usuarios
	who | cut -d ' ' -f 1 | sort -u | wc -l >> /tmp/usuarios
	sleep 120
done

