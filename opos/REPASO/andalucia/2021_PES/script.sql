##############################################################################################################
# EXAMEN DE PES INFORMATIVA 2021 (ANDALUCÍA)                                                                 #
# Se consideran las siguientes tablas en una aplicación en la que se tienen los datos de una persona, de la  #
# empresa en la que trabaja y de los padres de la misma:                                                     #
#      PERSONA (dni, nombre, apellidos, empresa, salario)                                                    #
#      PK (dni)                                                                                              #
#      FK (empresa/Empresa(cif))                                                                             #
#                                                                                                            #
#      PADREMADRE(dniPadreMadre, dniHijo)                                                                    #
#      PK (dniPadreMadre, dniHijo)                                                                           #
#      FK (dniPadreMadre/Persona(dni))                                                                       #
#      FK(dniHijo/Pesona(dni))                                                                               #
#                                                                                                            #
#      EMPRESA(cif, nombre, direccion)                                                                       #
#      PK(cif)                                                                                               #
##############################################################################################################

##############################################################################################################
# Creamos las tablas y le insertamos datos                                                                   #
##############################################################################################################

CREATE DATABASE IF NOT EXISTS PES2021;

USE PES2021;

CREATE TABLE IF NOT EXISTS EMPRESA(
  CIF     CHARACTER(9) NOT NULL,
  NOMBRE    CHARACTER(50) NOT NULL,
  DIRECCION CHARACTER(50) NOT NULL,
  PRIMARY KEY(CIF));

CREATE TABLE IF NOT EXISTS PERSONA(
  DNI       CHARACTER(9) NOT NULL,
  NOMBRE    CHARACTER(50) NOT NULL,
  APELLIDOS CHARACTER(50) NOT NULL,
  EMPRESA   CHARACTER(9),
  SALARIO   FLOAT(6,2) DEFAULT 0.00,
  PRIMARY KEY(DNI),
  CONSTRAINT EMP_FK FOREIGN KEY(EMPRESA) REFERENCES EMPRESA(CIF) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT SALARIO_CH CHECK(SALARIO>=0));

CREATE TABLE IF NOT EXISTS PADREMADRE(
  DNIPADREMADRE CHARACTER(9),
  DNIHIJO       CHARACTER(9),
  PRIMARY KEY(DNIPADREMADRE,DNIHIJO),
  CONSTRAINT DNIPM_FK FOREIGN KEY (DNIPADREMADRE) REFERENCES PERSONA(DNI) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT DNIH_FK  FOREIGN KEY (DNIHIJO)       REFERENCES PERSONA(DNI) ON DELETE CASCADE ON UPDATE CASCADE);

INSERT INTO EMPRESA VALUES
    ("B04111111","EMPRESA1","DIRECCION1"),  -- Almeria
    ("B41222222","EMPRESA2","DIRECCION2"),  -- Sevilla
    ("B04333333","EMPRESA3","DIRECCION3");  -- Almeria

INSERT INTO PERSONA VALUES
    ("11111111A","MANUEL","MARTÍNEZ","B04111111",1500.32),
    ("22222222B","MERCEDES","LÓPEZ","B41222222",1200.32),
    ("33333333C","FRAN","MARTÍNEZ","B04333333",2500.32),
    ("44444444D","JOAQUÍN","GALLEGOS","B04111111",1500.32),
    ("55555555E","AMALIA","RUIZ","B41222222",1200.32),
    ("66666666F","AMALIA","GALLEGOS","B04333333",2500.32);

INSERT INTO PADREMADRE VALUES
    ("11111111A","33333333C"),  -- papa
    ("22222222B","33333333C"),  -- mama
    ("44444444D","66666666F"),
    ("55555555E","66666666F");

##############################################################################################################
# Escriba las sentencias SQL para realizar las siguientes consultas:                    #
# 1. Obtener el nombre y apellido del padre y de la madre de “FRAN MARTÍNEZ”            #
##############################################################################################################

SELECT NOMBRE, APELLIDOS FROM PERSONA P, PADREMADRE PM
WHERE P.DNI = PM.DNIPADREMADRE AND PM.DNIHIJO = "33333333C";

-- Subconsulta: Muestra DNI de “FRAN MARTÍNEZ”.
-- (SELECT DNI FROM PERSONA WHERE NOMBRE='FRAN' AND APELLIDOS = 'MARTÍNEZ');

+----------+-----------+
| NOMBRE   | APELLIDOS |
+----------+-----------+
| MANUEL   | MARTÍNEZ  |
| MERCEDES | LÓPEZ     |
+----------+-----------+
2 rows in set (0.00 sec)

##############################################################################################################
# 2.- Obtener un listado con el nombre de las empresas y el total de los salarios de todos los empleados de  #
# la empresa ordenados tal que las empresas que gasten más dinero en sus salarios se muestren al principio.                                                                                                 #
##############################################################################################################

SELECT E.CIF, E.NOMBRE, SUM(P.SALARIO) AS "SALARIOS TOTALES"
FROM EMPRESA E, PERSONA P
WHERE E.CIF = P.EMPRESA
GROUP BY E.CIF
ORDER BY SUM(P.SALARIO) DESC;

+-----------+----------+------------------+
| CIF       | NOMBRE   | SALARIOS TOTALES |
+-----------+----------+------------------+
| B04333333 | EMPRESA3 |          5000.64 |
| B04111111 | EMPRESA1 |          3000.64 |
| B41222222 | EMPRESA2 |          2400.64 |
+-----------+----------+------------------+
3 rows in set (0.00 sec)

##############################################################################################################
# 3.- Subir el salario un 10% a todas las personas que trabajen en las empresas de Sevilla    #
#     Considere que en el campo dirección se encuentra entre otros datos la provincia).       #
##############################################################################################################

UPDATE EMPRESA SET DIRECCION = CONCAT(DIRECCION," ALMERÍA") WHERE CIF LIKE 'B04%';
UPDATE EMPRESA SET DIRECCION = CONCAT(DIRECCION," SEVILLA") WHERE CIF LIKE 'B41%';

UPDATE PERSONA SET SALARIO = SALARIO*1.1
WHERE EMPRESA IN (SELECT CIF FROM EMPRESA WHERE UPPER(DIRECCION) LIKE '%SEVILLA%');

##############################################################################################################
# 4.- Mostrar el nombre y apellido de las personas que cobran más que la media del salario    #
#     de todas las personas recogidas en la base de datos.                                    #
##############################################################################################################

SELECT NOMBRE, APELLIDOS, SALARIO FROM PERSONA
WHERE SALARIO > (SELECT AVG(SALARIO) FROM PERSONA);