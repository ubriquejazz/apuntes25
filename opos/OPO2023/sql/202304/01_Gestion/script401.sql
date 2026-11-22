-- File: script401
-- Desc: Actualizacion de tablas (DML-I)
-- Date: 2023.02.08
-- Tbls: CLIENTES, PLATOS Y PEDIDOS

-- 1) Realizar las inserciones de las siguientes filas en la tabla CLIENTES: 
INSERT INTO CLIENTES VALUES 
    (151, "ANTONIO SOL GRANDE","PORVENIR, 12-3","ALICANTE",646678986,03009),
    (152,"LUIS MARTÍNEZ JUAN","GRAN VÍA, 32-4","VALENCIA",646234127,46001),
    (153,"MATEO RUIZ SEÑOR","OCASO, 21-21","ALICANTE",687565454,03008),
    (154,"ALBA LÁZARO PEDRÓS","ROMA,153-25","ALICANTE", 690343434,03008),
    (155,"MARÍA SERRA TORNER","ZARAGOZA,34-23","VALENCIA",696340929,46012),
    (156,"CARLOS TUSET BOADA","TORRES QUEVEDO, 15-30","TERUEL",623758940,44002);

-- 2) Realizar las inserciones de las siguientes filas en la tabla PEDIDOS: 
INSERT INTO PEDIDOS VALUES 
    (133,153,'2007-09-29',9.5),
    (237,154,'2007-11-12',2.5),
    (475,156,'2007-11-23',3.5),
    (334,156,'2007-10-12',2),
    (289,151,'2007-10-11',4);

-- 3) Realizar las inserciones de las siguientes filas en la tabla PLATOS: 
INSERT INTO PLATOS VALUES
    (1,"ARROZ AL HORNO","ARROZ, CARNE DE CERDO, AJO, etc.",2),
    (2,"PAELLA CONEJO","ARROZ, POLLO, CONEJO, VERDURA",2),
    (3,"PAELLA VERDURA","ARROZ, VERDURA",1.5),
    (4,"PAELLA MARISCO","ARROZ, GAMBAS, SEPIA, etc.",2.5),
    (5,"PAELLA MIXTA","ARROZ, POLLO, CON EJO, GAMBAS",2.5),
    (6,"ENSALADA","LECHUGA, TOMATE, ZANAHORIA, etc.",1.5),
    (7,"ENSALADA ESPECIAL","LECHUGA, TOMATE, QUESO, etc.",2),
    (8,"SALPICÓN DE MARISCO","PULPO, GAMBITAS, PIMIENTO, etc.",2);

-- 4) Realizar las inserciones de las siguientes filas en la tabla DETALLE_PEDIDO: 
INSERT INTO DETALLE_PEDIDO VALUES   
   (133	, 2	, 2),     	
   (133	, 6	, 1),
   (133	, 8	, 1), -- ejercico 8
   (237	, 4	, 1),
   (475	, 2	, 1),
   (475	, 3	, 1),
   (334	, 8	, 1), -- ejercico 8
   (289	, 1	, 1),
   (289	, 2	, 1);

-- 5) Intentar insertar una nueva fila en la tabla PLATOS con los siguientes valores:
INSERT INTO PLATOS VALUES (9,"MACARRONES","PASTA, TOMATE, JAMÓN, etc.", null);

-- ¿Ha sido posible realizar la inserción? ¿Qué ha sucedido? ¿Por qué?
No es posible porque debe esta definido como NOT NULL

-- 6) Incrementar el precio de los platos un 5%
UPDATE PLATOS SET precio = 1.05 * precio;

-- 7) Modificar los INGREDIENTES del plato con ID_PLATO = 7 (es la ENSALADA ESPECIAL), 
--    para que pasen a ser los siguientes: BROTES, TOMATE, QUESO, etc. 
UPDATE PLATOS SET INGREDIENTES = "BROTES, TOMATE, QUESO, etc " WHERE ID_PLATO = 7;
SELECT * FROM PLATOS WHERE ID_PLATO = 7;

-- 8) Indicar los pasos necesarios para modificar el código del PLATO con ID_PLATO=8 para 
--   que pase a ser ID_PLATO=9.

-- a foreign key constraint fails 
CONSTRAINT FK_DETALLE_ID_PLATO FOREIGN KEY (ID_PLATO) REFERENCES PLATOS(ID_PLATO) 

-- elimino la constraint que falla
ALTER TABLE DETALLE_PEDIDO DROP CONSTRAINT FK_DETALLE_ID_PLATO;

-- nueva constraint
ALTER TABLE DETALLE_PEDIDO ADD CONSTRAINT FK_DETALLE_ID_PLATO
    FOREIGN KEY (ID_PLATO) REFERENCES PLATOS(ID_PLATO) ON UPDATE CASCADE;

UPDATE PLATOS SET ID_PLATO=9 WHERE ID_PLATO=8;
SELECT ID_PLATO FROM DETALLE_PEDIDO WHERE ID_PLATO=8;