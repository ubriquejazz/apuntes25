# DNS

Un supuesto dominio llamado **undominio.com** está gestionado por dos servidores DNS, el servidor maestro o autoridad es ns1.undominio.com (192.168.20.100) y el servidor DNS secundario es ns2.undominio.com (192.168.20.200). Sus servidores de correo son: ns1.undominio.com y e2.otrodominio.com siendo ns1.undominio.com, el más prioritario. Este servidor de correo tiene un alias llamado: mail.undominio.com.

Se pide, escribir el fragmento del archivo de zona directa para el dominio anterior con los registros de recursos correspondientes a los datos expresados en el enunciado. El TTL establecido para todos los registros es de 86400 segundos y para el **servidor autoridad** del dominio se tendrán en cuentan los siguientes valores:

a. Dirección de correo del administrador del dominio: admin@undominio.com

b. Nº de serie: 1

c. Actualización en segundos: 86400

d. Reintento en segundos: 7200

e. Caducidad en segundos: 3456000

f. TTL mínimo en segundos: 1728000 

