
fdisk -l 
# localizamos el dispositivo que buscamos (/dev/sdb)

fdisk /dev/sdb 
# comprobamos posteriormente con lslbk y vemos que existe una nueva partición: sdb1

mkfs -t vfat /dev/sdb1
# formateamos, si es un disquette>
# -t msdos /dev/fd0 1440

mount /dev/sdb1 ~/64GB
# directorio donde establecer el punto de montaje

# se podria haber hecho del tiron:
#       mount -t msdos /dev/fd0 /mnt/floppy
#       mount -t iso9660 /dev/sr0 /media/cdrom

lsblk -f
# comprobamos con blkid o 

df -h 
# para ver el espacio en uso y disponible en cada disco

Hay tres formas de nombrar una partición o dispositivo en /etc/fstab:
    (1) /dev/sda1 (por ejemplo) 
    (2) Por la etiqueta lsblk -f
    (3) Por el UUID ls-l /dev/disk/by-uuid
