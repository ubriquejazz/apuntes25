/* PRÁCTICA 4 DDL */

USE facturacion;

/* 1 */
CREATE TABLE cliente (
        id SMALLINT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
        nombre VARCHAR(50) NOT NULL,
        nif CHAR(9) NOT NULL,
        fecha_alta DATE DEFAULT NOW(),
        poblacion varchar(40) DEFAULT 'Jerez',
        email varchar(255),
        PRIMARY KEY (id)
);

/* 2 Por lo "bajini" pongo PRIMARY KEY en la deficinión del campo, pero .... NO ME GUSTA !! */
CREATE TABLE articulo (
        codigo VARCHAR(30) NOT NULL PRIMARY KEY,
        nombre VARCHAR(50) NOT NULL,
        descripcion TEXT,
        precio FLOAT NOT NULL
);

/* 3 */
CREATE TABLE factura(
        numero INT(7) UNSIGNED NOT NULL AUTO_INCREMENT,
        id_cliente SMALLINT(3) UNSIGNED NOT NULL,
        forma_pago ENUM('C','T') DEFAULT 'C',
        PRIMARY KEY (numero),
        FOREIGN KEY (id_cliente) REFERENCES cliente (id)
);

/* 4 */
CREATE TABLE detalle (
        numero_factura INT(7) UNSIGNED NOT NULL,
        id SMALLINT(3) UNSIGNED ZEROFILL NOT NULL,
        codigo_articulo VARCHAR(30) NOT NULL,
        cantidad TINYINT(2) UNSIGNED NOT NULL DEFAULT 1,
        precio INT NOT NULL,
        PRIMARY KEY (numero_factura,id),
        FOREIGN KEY (numero_factura) REFERENCES factura (numero)
                ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (codigo_articulo) REFERENCES articulo (codigo)
                ON UPDATE CASCADE ON DELETE NO ACTION
);

/* 5 */
ALTER TABLE factura ADD fecha DATE;

/* 6 */
ALTER TABLE detalle MODIFY precio FLOAT NOT NULL;

/* 7 */
DROP DATABASE facturacion;









    





	

