USE TEST

CREATE TABLE IF NOT EXISTS personal( 
    dni int(10), 
    apellidos varchar(30), 
    funcion enum('PROFESOR','ADMINISTRATIVO','CONSERJE'), 
    salario float(6,2), 
    cod_centros int(5), 
CONSTRAINT pk_codigo PRIMARY KEY (dni));

LOAD DATA INFILE '/Users/juan/Repos/OPO2023/sql/202304/03_MySQL/dump/personal.txt' 
INTO TABLE personal 
FIELDS TERMINATED BY ';' ENCLOSED BY '"' 
LINES TERMINATED BY '\n';

SELECT * INTO OUTFILE '/Users/juan/Repos/OPO2023/sql/202304/03_MySQL/dump/personal2.txt'
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
FROM personal;
