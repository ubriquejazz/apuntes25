-- Inserta los valores
INSERT INTO departamento VALUES
('01','Contabilidad-1','Almería'), 
('02','Ventas','Sevilla'), 
('03','I+D','Málaga'), 
('04','Gerencia','Córdoba'), 
('05','Administración','Córdoba'), 
('06','Contabilidad-2','Córdoba'),
('07','Marketing','Granada');

INSERT INTO empleado VALUES
('A11',"Esperanza Amarillo",'1993-09-23',3000,NULL,'04'),
('A03',"Pedro Rojo",'1995-03-07',2000,'A11','01'), 
('C01',"Juan Rojo",'1997-02-03',1800,'A03','01'),
('B02',"María Azul",'1996-01-09',1450,'A03','01'), 
('A07',"Elena Blanco",'1994-04-09',2000,'A11','02'), 
('B06',"Carmen Violeta",'1997-02-03',2200,'A07','02'), 
('C05',"Alfonso Amarillo",'1998-12-03',2000,'B06','02'), 
('B09',"Pablo Verde",'1998-10-12',1600,'A11','03'), 
('C04',"Ana Verde",NULL,2000,'A07','02'), 
('C08',"Javier Naranja",NULL,1680,'B09','03'), 
('A10',"Dolores Blanco",'1998-11-15',1900,'A11','04'), 
('B12',"Juan Negro",'1997-02-03',1900,'A11','05'), 
('A13',"Jesús Marrón",'1999-02-21',2200,'A11','05'),
('A14',"Manuel Amarillo",'2000-09-01',2000,'A11',NULL);

INSERT INTO proyecto VALUES
('GRE', "Gestion de residuos", '03'),
('DAG', "Depuracion de aguas", '03'),
('AEE', "Analisis economico", '04'),
('MES', "Marketing de energia solar", '02');

INSERT INTO trabaja VALUES
('C01','GRE',10),
('C08','GRE',54),
('C01','DAG',5),
('C08','DAG',150), 
('B09','DAG',100), 
('A14','DAG',10),
('A11','AEE',15),
('C04','AEE',20),
('A11','MES',0),
('A03','MES',0);

-- Comprobacion
select count(*) from departamento;
select count(*) from empleado;
select count(*) from proyecto;
select count(*) from trabaja;




