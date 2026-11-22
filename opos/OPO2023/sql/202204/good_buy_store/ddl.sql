-- Good Buy Store  
-- Date: 202204 ()
-- Autor: Juan Gago
-- File: ddl.sql

-- seller

CREATE TABLE seller (
    id              INTEGER NOT NULL PRIMARY KEY,
    name            VARCHAR2(20 CHAR) NOT NULL,
    dateofbirth     DATE NOT NULL,
    typeofseller    CHAR(6) NOT NULL,
    salary          NUMBER(6, 2) NOT NULL,
    sellerid        INTEGER 
);

ALTER TABLE seller
    ADD CHECK ( typeofseller IN ( 'Junior', 'Senior' ) );

ALTER TABLE seller
    ADD CONSTRAINT seller_seller_fk FOREIGN KEY ( sellerid )
        REFERENCES seller ( id );

-- customer

CREATE TABLE customer (
    id              INTEGER NOT NULL PRIMARY KEY,
    name            VARCHAR2(20 CHAR) NOT NULL,
    dateofbirth     DATE NOT NULL,
    age             INTEGER NOT NULL,
    address         VARCHAR2(100) NOT NULL,
    telephonenumber CHAR(9) NOT NULL
);

-- PRODUCT

CREATE TABLE supplier (
    id              INTEGER NOT NULL PRIMARY KEY,
    name            VARCHAR2(20 CHAR) NOT NULL
);

CREATE TABLE product (
    supplierid      INTEGER NOT NULL REFERENCES supplier ( id ) ON DELETE CASCADE,
    id              INTEGER NOT NULL,
    brand           VARCHAR2(20 CHAR) NOT NULL,
    type            CHAR(2) NOT NULL,
    model           VARCHAR2(20 CHAR) NOT NULL,
    saleprice       NUMBER(6, 2) NOT NULL,
    stock           INTEGER NOT NULL
);

ALTER TABLE product
    ADD CHECK ( type IN ( 'BR', 'GR', 'PR', 'WB' ) );

ALTER TABLE product ADD CONSTRAINT product_pk PRIMARY KEY ( id, supplierid );

-- related_to
-- PRODUCT_ID, SUPPLIER_ID, SPARE_ID, SUPPLIER_SPARE_ID 

CREATE TABLE relatedto (
    productid       INTEGER NOT NULL,
    supplierid      INTEGER NOT NULL,
    productid1      INTEGER NOT NULL,
    supplierid1     INTEGER NOT NULL
);

ALTER TABLE relatedto
    ADD CONSTRAINT relatedto_pk PRIMARY KEY ( productid, supplierid,
                                              productid1, supplierid1 );

ALTER TABLE relatedto
    ADD CONSTRAINT relatedto_product_fk FOREIGN KEY ( productid, supplierid )
        REFERENCES product ( id, supplierid );

ALTER TABLE relatedto
    ADD CONSTRAINT relatedto_product_fkv1 FOREIGN KEY ( productid1, supplierid1 )
        REFERENCES product ( id, supplierid );

-- PURCHASE

CREATE TABLE purchase (
    id              INTEGER NOT NULL PRIMARY KEY,
    "Date"          DATE NOT NULL,
    customerid      INTEGER NOT NULL REFERENCES customer ( id ),
    sellerid        INTEGER NOT NULL REFERENCES seller ( id )
);

-- contains
-- PURCHASE_ID, PRODUCT_ID, SUPPLIER_ID, QUANTITY, SALEPRICE

CREATE TABLE contains (
    purchaseid      INTEGER NOT NULL REFERENCES purchase ( id ),
    productid       INTEGER NOT NULL,
    supplierid      INTEGER NOT NULL,
    quantity        INTEGER NOT NULL,
    saleprice       NUMBER(6, 2) NOT NULL
);
       
ALTER TABLE contains
    ADD CONSTRAINT contains_product_fk FOREIGN KEY ( productid, supplierid )
        REFERENCES product ( id, supplierid );

ALTER TABLE contains
    ADD CONSTRAINT contains_pk PRIMARY KEY ( purchaseid, productid, supplierid );