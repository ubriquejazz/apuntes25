REM   Script: Carnaval 2020
REM   Exercise for winter holidays

REM   Author: Juan GAGO


CREATE TABLE "Author" (
    id               INTEGER NOT NULL,
    city             VARCHAR2(20 CHAR) NOT NULL,
    name             VARCHAR2(40 CHAR) NOT NULL
);

CREATE TABLE "Group" (
    id              INTEGER NOT NULL,
    author_id       INTEGER NOT NULL,
    category        VARCHAR2(10) NOT NULL,
    name            VARCHAR2(80 CHAR) NOT NULL,
    result          VARCHAR2(10)
);

ALTER TABLE "Group"
    ADD CHECK ( category IN ( 'Chirigota', 'Comparsa', 'Coro', 'Cuarteto' ) );

ALTER TABLE "Group"
    ADD CHECK ( result IN ( '1st', '2nd', '3rd', '4th', 'other' ) );

ALTER TABLE "Group" ADD CONSTRAINT group_pk PRIMARY KEY ( id );

ALTER TABLE "Author" ADD CONSTRAINT author_pk PRIMARY KEY (id);


CREATE SEQUENCE cgrp START WITH 1 INCREMENT BY 1;



ALTER TABLE "Group"
    ADD CONSTRAINT group_author_fk FOREIGN KEY ( author_id )
    REFERENCES "Author" ( id );


