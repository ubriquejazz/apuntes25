/* Tema 3 Práctica 6 */
/* Autor: Juana (Solución) */

-- -----------------------------------------------------
-- Squema series
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS series DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE series 

-- -----------------------------------------------------
-- Table series.serie
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS serie (
  id            INT(6) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  titulo        VARCHAR(100) NOT NULL,
  sinopsis      TEXT NOT NULL,
  anio          YEAR(4) NOT NULL,
  estado        SET('activa', 'terminada') NOT NULL,
--  imagen      VARCHAR(128) NOT NULL,
  imagen        BLOB,
  clasificacion ENUM('SC', 'TP', '7','10') NOT NULL
  PRIMARY KEY (id),
  UNIQUE INDEX titulo (titulo ASC)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8 COLLATE = utf8_spanish_ci;

-- -----------------------------------------------------
-- Table series.temporada
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS temporada (
  serie_id  INT(6) UNSIGNED ZEROFILL NOT NULL,
  ntemp     INT(2) UNSIGNED ZEROFILL NOT NULL,
  nombre    VARCHAR(20) NOT NULL,
  PRIMARY KEY (serie_id, ntemp),
  FOREIGN KEY (serie_id) REFERENCES serie (id)
    ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8 COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table series.capitulo
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS capitulo (
  serie_id        INT(6) UNSIGNED ZEROFILL NOT NULL,
  temporada_ntemp INT(2) UNSIGNED ZEROFILL NOT NULL,
  ncap            INT(3) UNSIGNED ZEROFILL NOT NULL,
  titulo          VARCHAR(50) NOT NULL,
  fecha           DATE NOT NULL,
  PRIMARY KEY (serie_id, temporada_ntemp, ncap),
    FOREIGN KEY (serie_id , temporada_ntemp) REFERENCES series.temporada (serie_id , ntemp)
    ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8 COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table series.usuario
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS series.usuario (
  id        INT(6) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  nombre    VARCHAR(64) NOT NULL,
  email     VARCHAR(64) NOT NULL,
  password  VARCHAR(128) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE INDEX user (nombre, email)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8 COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table series.usuariosigueserie
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS series.usuariosigueserie (
  usuario_id  INT(6) UNSIGNED ZEROFILL NOT NULL,
  serie_id    INT(6) UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (usuario_id, serie_id),
  FOREIGN KEY (serie_id) REFERENCES series.serie (id)
    ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (usuario_id) REFERENCES series.usuario (id)
    ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8 COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table series.usuariovecapitulo
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS series.usuariovecapitulo (
  usuario_id      INT(6) UNSIGNED ZEROFILL NOT NULL,
  serie_id        INT(6) UNSIGNED ZEROFILL NOT NULL,
  temporada_ntemp INT(2) UNSIGNED ZEROFILL NOT NULL,
  capitulo_ncap   INT(3) UNSIGNED ZEROFILL NOT NULL,
  nota            INT(2) NULL DEFAULT NULL,
  PRIMARY KEY (usuario_id, serie_id, temporada_ntemp, capitulo_ncap),
  FOREIGN KEY (serie_id , temporada_ntemp , capitulo_ncap) REFERENCES series.capitulo (serie_id , temporada_ntemp , ncap)
    ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (usuario_id) REFERENCES series.usuario (id)
    ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8 COLLATE = utf8_spanish_ci;
