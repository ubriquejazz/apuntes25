CREATE DATABASE 2eval_sanchez_rey_juana_2 CHARSET utf8;

USE 2eval_sanchez_rey_juana_2

CREATE TABLE tema(
    id TINYINT(2) UNSIGNED NOT NULL AUTO_INCREMENT,
    texto VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
)ENGINE innodb CHARSET utf8;

CREATE TABLE pregunta(
    id SMALLINT(4) UNSIGNED NOT NULL AUTO_INCREMENT,
    texto VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
    )engine innodb charset utf8;

CREATE TABLE opcion(
    id INT(7) UNSIGNED NOT NULL AUTO_INCREMENT,
    texto VARCHAR(255) NOT NULL,
    correcta ENUM('s','n') NOT NULL,
    pregunta_id SMALLINT(4) UNSIGNED NOT NULL,
    PRIMARY KEY (id)
    )
    CHARSET utf8 ENGINE InnoDB;

CREATE TABLE jugador(
    id INT(10) UNSIGNED NOT NULL,
    nick CHAR(10) NOT NULL,
    password VARCHAR(50) NOT NULL,
    ciudad VARCHAR(30),
    puntuacion INT(11) UNSIGNED NOT NULL DEFAULT 0,
    fecha_alta DATE NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY (nick)
    )CHARSET utf8 ENGINE InnoDB;

ALTER TABLE jugador ADD fecha_ultimo_acceso TIMESTAMP;

ALTER TABLE pregunta
    ADD tema_id TINYINT(2) UNSIGNED,
    ADD FOREIGN KEY (tema_id) REFERENCES tema (id) ON UPDATE CASCADE ON DELETE SET NULL;

