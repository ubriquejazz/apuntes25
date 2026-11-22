# U04: Actualizacion de tablas 
ENUNCIADO: una vez creadas las tablas en el tema anterior, vamos a proceder a la inserción de datos. Si se quiere hacer pruebas y que las actualizaciones de las tablas no sean validadas, se puede trabajar con el parámetro AUTOCOMMIT = 0. Así, en cualquier momento, tendremos la posibilidad de hacer ROLLBACK para deshacer los cambios o COMMIT para validarlos.

# U03: Creacion de tablas
ENUNCIADO: consideramos la siguiente estructura de tablas, 
representando la información necesaria para una empresa de comidas rápidas:

## CLIENTES 
	ID_CLIENTE	alfanumérico de 10 caracteres
	NOM_CLI 	alfanumérico de 30 caracteres
	DIRECCION 	alfanumérico de 30 caracteres
	LOCALIDAD 	alfanumérico de 30 caracteres
	TELEFONO	numérico de 9 posiciones, no nulo

	151         ANTONIO SOL GRANDE      PORVENIR, 12-3 		ALICANTE	646678986	03009 	
	152         LUIS MARTÍNEZ JUAN      GRAN VÍA, 32-4 		VALENCIA	646234127	46001 	 
	153         MATEO RUIZ SEÑOR        OCASO, 21-21 		ALICANTE	687565454	03008 	 
	154         ALBA LÁZARO PEDRÓS      ROMA,153-25 		ALICANTE	690343434	03008 	 
	155         MARÍA SERRA TORNER      ZARAGOZA,34-23	 	VALENCIA	696340929	46012 	 
	156         CARLOS TUSET BOADA   	T QUEVEDO, 15-30    TERUEL		623758940	44002 	

## PEDIDOS
	ID_PEDIDO alfanumérico de 10 caracteres,
	ID_CLIENTE alfanumérico de 10 caracteres,
	FECHA fecha,
    IMPORTE numérico 10 posiciones con 2 decimales, no nulo

	133		153		2007-09-29      9.5
	237		154		2007-11-12      2.5
	475		156		2007-11-23      3.5
	334		156		2007-10-12      2
	289		151		2007-10-11      4

## PLATOS
	ID_PLATO alfanumérico de 10 caracteres ,
	DESC_PLATO alfanumérico de 100 caracteres,
	INGREDIENTES alfanumérico de 100 caracteres,
    PRECIO numérico 10 posiciones  con 2 decimales, no nulo

	1	ARROZ AL HORNO		ARROZ, CARNE DE CERDO, AJO, etc.	2
    2	PAELLA CONEJO		ARROZ, POLLO, CONEJO, VERDURA		2
    3	PAELLA VERDURA		ARROZ, VERDURA				  		1.5
    4	PAELLA MARISCO		ARROZ, GAMBAS, SEPIA, etc.		  	2.5
    5	PAELLA MIXTA		ARROZ, POLLO, CON EJO, GAMBAS		2.5
    6	ENSALADA			LECHUGA, TOMATE, ZANAHORIA, etc.	1.5
    7	ENSALADA ESPECIAL	LECHUGA, TOMATE, QUESO, etc.		2
    8	SALPICÓN DE MARISCO	PULPO, GAMBITAS, PIMIENTO, etc.		2

## DETALLE_PEDIDO
	ID_PEDIDO alfanumérico de 10 caracteres,
	ID_PLATO alfanumérico de 10 caracteres,
	NUM_PLATOS numérico de 2 posiciones, no nulo
         
	133		2			2
	133		6			1
	133		8			1
	237		4			1
	475		2			1
	475		3			1
	334		8			1
	289		1			1
	289		2			1
	 
Se recomienda la creación de una nueva base de datos, tal y como se describió en el tema 10 con la sentencia CREATE DATABASE tema3;
para, posteriormente, seleccionarla cuando necesitemos trabajar con ella mediante USE tema3;

Debemos tener en cuenta que no se pueden crear tablas con el mismo nombre que otras ya existentes en la misma base de datos. Si estuviesen ya creadas con ese nombre, es necesario borrarlas previamente

# U01: Introduccion
ENUNCIADO:con el objetivo de familiarizarse con las bases de datos relacionales, se propone que los alumnos observen la estructura de las tablas y sus relaciones para contestar a las siguientes cuestiones: 