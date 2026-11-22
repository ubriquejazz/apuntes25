-- Alumnos del curso Anio = 2021 cuya Nota_Final >= 5 de al menos un modulo de la familia Nombre = 'Informatica'
-- Una linea por cada alumno sin repeticiones (DISTINCT), debe aparecer Dni, Nombre y Apellidos

-- Imaginemos que el codigo es el 23
SELECT Cod_Familia FROM Familia WHERE Nombre = "Informatica"

-- Titulos de la familia 'Informatica y comunicaciones': DAW, DAM, SMR
SELECT Cod_Titulo FROM Titulo Ti
WHERE Ti.Cod_Familia = 23;

-- Modulos de esos titulos: SI, PRG, EDS, FHW
SELECT Cod_Modulo, Nombre FROM Modulo Mo
WHERE Mo.Cod_Titulo IN (SELECT Cod_Titulo FROM Titulo T WHERE T.Cod_Familia = 23)

SELECT DISTINCT a.Dni, a.Nombre, a.Apellidos
    FROM Alumno a, 
    JOIN Matriculado Ma ON Ma.Cod_alu = a.Cod_Alu
    JOIN Modulo Mo ON Mo.Cod_Modulo = Ma.Cod_Modulo
    JOIN Titulo Ti ON Mo.Cod_Titulo = Ti.Cod_Titulo
    WHERE Ma.Anio = 2021 AND Ma.Nota_Final >= 5
    AND Ti.Cod_Familia = (SELECT Cod_Familia FROM Familia WHERE Nombre = "Informatica");
    