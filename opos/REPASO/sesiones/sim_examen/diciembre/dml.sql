-- Oposiciones PES Andalucía 1996: 202212

-- 1. Relación con los apellidos y nombres de los alumnos cuya fecha de
-- nacimiento sea anterior a cualquiera de las fechas de nacimiento de los
-- alumnos del grupo 1oF.

SELECT B.FNac_A FROM ALUMNOS B, ASISTEN S
WHERE B.DNI_A = S.DNI_A AND Cod_Grupo = "1oF";

SELECT Nombre_A, Apellido1_A, Apellido2_A
FROM ALUMNOS A
WHERE A.FNac_A >= ALL (SELECT B.FNac_A 
        FROM ALUMNOS B, ASISTEN S
        WHERE B.DNI_A = S.DNI_A AND Cod_Grupo = "1oF");

-- 2. Apellidos y nombre de los tutores así como el grupo que pertenecía de
-- los alumnos de la población de “Santa Fé”.
SELECT Nombre_P, Apellido1_P, Apellido2_P
FROM ALUMNOS A, TIENE TUTORIA T, PROFES P
WHERE A.DNI_A = T.DNI_A AND T.DNI_P = P.DNI_P AND A.Direcc_A LIKE '%Santa Fé%';

-- 3. Relación de jefes de seminario, seminario al que pertenece y número de
-- miembros de dicho seminario de los profesores que imparten en secundaria y fp.
SELECT S.Seminario, S.JefeSeminario, COUNT (*)
FROM PROFES P, SEMINARIOS S
WHERE P.SEMINARIO = S.SEMINARIO AND P.NRP_P IN 
    (SELECT NRP_P FROM GRUPO G, ASIGNATURAS A, ESTUDIOS E
    WHERE E.Cód_E = A.Cód_E AND A. Cód_A = G.Cód_A AND Nivel_E = "Sec")
INTERSECT
    (SELECT NRP_P FROM GRUPO G, ASIGNATURAS A, ESTUDIOS E
    WHERE E.Cód_E = A.Cód_E AND A.Cód_A = G.Cód_A AND Nivel_E = "FP")
GROUP BY S.Seminario;


-- PROBAR!