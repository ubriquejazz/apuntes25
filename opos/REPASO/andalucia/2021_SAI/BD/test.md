# Examen de 2021

***Para las siguientes tres preguntas tipo test se presuponen creadas las tablas y atributos referenciados***

19. ¿Qué sentencia permite listar los departamentos en los que trabajan más de 50 empleados?
a) SELECT num_dept FROM empleado GROUP BY num_dept HAVING COUNT (*) > 50; **<------**
b) SELECT num_dept FROM empleado                GROUP BY num_dept WHERE COUNT (*) > 50;
c) SELECT num_dept, COUNT (*) FROM empleado     GROUP BY num_dept, COUNT (*) > 50;

20. ¿Qué sentencias permiten modificar una tabla para añadir una columna a, 
eliminar una columna b y cambiar el nombre a otra columna c?
a)  ALTER TABLE mi_tabla ADD COLUMN a; 
    ALTER TABLE mi_tabla DROP COLUMN b; 
    ALTER TABLE mi_tabla RENAME COLUMN c to mi_c;

b)  ALTER TABLE mi_tabla ADD COLUMN a DATE; **<------**
    ALTER TABLE mi_tabla DROP COLUMN b;
    ALTER TABLE mi_tabla CHANGE COLUMN c mi_c INT;

c)  ALTER TABLE mi_tabla ADD COLUMN a DATE; 
    ALTER TABLE mi_tabla DROP COLUMN b;
    ALTER TABLE mi_tabla RENAME COLUMN c into mi_c;

21. ¿Qué sentencia permite crear una vista de la tabla empleado donde el número del departamento
 sea igual a 5?
a) CREATE VIEW vista SELECT nombre, direccion FROM empleado WHERE num_dept=5;
b) CREATE VIEW vista FROM SELECT nombre, direccion FROM empleado WHERE num_dept=5;
c) CREATE VIEW vista AS SELECT nombre, direccion FROM empleado WHERE num_dept=5;  **<------**

