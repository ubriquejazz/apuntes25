
-- g
SELECT D.nombre, COUNT(cdemp)
    FROM empleado E JOIN dpto D ON E.cddpt = D.cddpt
    WHERE salario > 1500
    GROUP BY D.nombre
    HAVING COUNT(cdemp) > 2