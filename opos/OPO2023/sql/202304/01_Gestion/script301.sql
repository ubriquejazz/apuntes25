-- File: script301
-- Desc: Creacion de tablas (DDL)
-- Date: 2023.02.17
-- Tbls: CLIENTES, PLATOS Y PEDIDOS

-- 1) Se propone la creación de las tablas con las siguientes restricciones:
--  Crear la tabla CLIENTES con la columna ID_CLIENTE como clave primaria con nombre 
--  PK_CLIENTES_ID_CLIENTE, y la columna TELEFONO como única con nombre UQ_CLIENTES_TELEFONO. 
--  El campo TELEFONO no puede ser nulo en ningún caso.
CREATE TABLE CLIENTES (
	ID_CLIENTE VARCHAR(10),
	NOM_CLI VARCHAR(30),
	DIRECCION VARCHAR(30),
	LOCALIDAD VARCHAR(30),
	TELEFONO INT(9) NOT NULL,
    CONSTRAINT PK_CLIENTES_ID_CLIENTE PRIMARY KEY(ID_CLIENTE),
    CONSTRAINT UQ_CLIENTES_TELEFONO UNIQUE (TELEFONO)
);

--  Crear la tabla PEDIDOS con la columna ID_PEDIDO como clave primaria con nombre PK_PEDIDOS_ID_PEDIDO. 
--  El campo IMPORTE no puede ser nulo. 
CREATE TABLE PEDIDOS (
	ID_PEDIDO   VARCHAR(10),
	ID_CLIENTE  VARCHAR(10),
	FECHA       DATE,
    IMPORTE     NUMERIC(10,2) NOT NULL, -- 10 posiciones con 2 decimales, no nulo
    CONSTRAINT PK_PEDIDOS_ID_PEDIDO PRIMARY KEY (ID_PEDIDO),
    CONSTRAINT FK_PEDIDOS_ID_CLIENTE FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTES(ID_CLIENTE)
);

--  Crear una tabla PLATOS con clave primaria PK_PLATOS_ID_PLATO sobre la columna ID_PLATO. 
--  El campo precio no puede ser nulo.
CREATE TABLE PLATOS (
	ID_PLATO VARCHAR(10),
	DESC_PLATO VARCHAR(100),
	INGREDIENTES VARCHAR(100),
    PRECIO NUMERIC(10,2) NOT NULL,
    CONSTRAINT PK_PLATOS_ID_PLATO PRIMARY KEY (ID_PLATO)
);

--  Crear la tabla DETALLE_PEDIDO; en este caso la tabla debe tener una clave primaria compuesta 
--  Con nombre PK_DETALLE_PEDIDOS sobre las columnas ID_PEDIDO e ID_PLATO. 
-- A su vez, ID_PEDIDO es clave ajena a la tabla PEDIDOS e ID_PLATO es clave ajena a la tabla PLATOS. 
CREATE TABLE DETALLE_PEDIDO (
	ID_PEDIDO   VARCHAR(10),
	ID_PLATO    VARCHAR(10),
	NUM_PLATOS  INT(2) NOT NULL,
    CONSTRAINT FK_DETALLE_ID_PEDIDO FOREIGN KEY (ID_PEDIDO) REFERENCES PEDIDOS(ID_PEDIDO),
    CONSTRAINT FK_DETALLE_ID_PLATO FOREIGN KEY (ID_PLATO) REFERENCES PLATOS(ID_PLATO),
    CONSTRAINT PK_DETALLE_PEDIDOS PRIMARY KEY (ID_PEDIDO, ID_PLATO)
);

-- 2) Añadir a la tabla CLIENTES el campo C_POSTAL de tipo INT(5), representará el código postal del cliente.
ALTER TABLE CLIENTES ADD C_POSTAL INT(5);

-- 3) Añadir en la tabla PEDIDOS una CLAVE AJENA (FOREIGN KEY) con nombre FK_PEDIDOS_ID_CLIENTE sobre la columna ID_CLIENTE,  referenciando la columna ID_CLIENTE de la tabla CLIENTES.
ALTER TABLE PEDIDOS ADD CONSTRAINT 
    FK_PEDIDOS_ID_CLIENTE FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTES(ID_CLIENTE);

-- 4) Cambiar en la tabla clientes el campo C_POSTAL renombrándolo a CODIGO_POSTAL
ALTER TABLE CLIENTES CHANGE C_POSTAL CODIGO_POSTAL INT(5);

-- 5) Añadir a la columna PRECIO de la tabla PLATOS la comprobación de estar entre 1 y 1000
ALTER TABLE PLATOS ADD CONSTRAINT
    CK_PRECIO CHECK (PRECIO BETWEEN 1 AND 1000);