-- Ejemplo 6.1 (pag 331)
-- Crea una tabla llamada tablaPrueba con dos campos, id y texto. 
-- Elabora un bloque que inserte 100 registros con el texto ‘Este es el registro número N’,  
-- donde N es un número que va desde 1 hasta 100.
create table tablaPrueba (id NUMBER, texto VARCHAR2(100));

declare
    vContador NUMBER := 1;
    vTexto VARCHAR2(100);
begin
    LOOP
        vTexto := 'Este es el registro numero ' || vContador;
        INSERT INTO tablaPrueba VALUES (vContador, vTexto);
        vContador := vContador + 1;
        EXIT WHEN vContador > 100;
    END LOOP;
end;

-- Ejemplo 6.4 (pag 350)
-- Elabora una función que devuelva una cadena sin los espacios en blanco innecesarios.
CREATE OR REPLACE FUNCTION EliminarEspacios (vCadOrigen VARCHAR2)
RETURN VARCHAR2 IS
    vCadSinEsp VARCHAR2(1024) := '';
BEGIN
    FOR i IN 1..LENGTH(vCadOrigen)-1 LOOP
        IF SUBSTR(vCadOrigen,i,2) = '  ' THEN
            vCadSinEsp := vCadSinEsp || SUBSTR(vCadOrigen,i,1);
        END IF;
    END LOOP;
    RETURN vCadSinEsp;
END;
/
execute DBMS_OUTPUT.PUT_LINE(EliminarEspacios('Hola     Juan!'));

-- Ejercicio 12.6 (pag 304)
-- Codifica un procedimiento que reciba como parametro el numero de departamento, un importe y un
-- porcentaje; y que suba el salario a todos los empleados del departamento. La subida sera el 
-- porcentaje o el importe que se indica en la llamada (el que sea mas beneficioso para empleado 
-- en cada caso).

    CREATE TABLE employees (id INT, name VARCHAR2(20), dpt_id INT, salary INT);
    CREATE TABLE departments (id INT, name VARCHAR2(20), city VARCHAR2(20));
    CREATE TABLE AuditIncrease (col1 VARCHAR2(200));

CREATE OR REPLACE PROCEDURE change_salary (dpt_no NUMBER, amount NUMBER, percetage NUMBER)
AS  
    v_factor NUMBER := percetage / 100;
    v_reg employees%ROWTYPE;
    CURSOR c1 IS 
        SELECT * FROM employees WHERE dpt_id = dpt_no;
BEGIN
    IF percetage > 100 THEN
        raise_application_error(-20010, 'Error');
    END IF;

    FOR v_reg IN c1 LOOP
        DBMS_OUTPUT.PUT_LINE(v_reg.id || ' * Anterior: ' || v_reg.salary);
        IF v_reg.salary * v_factor < amount THEN
            UPDATE employees SET salary = (v_reg.salary + amount) WHERE id = v_reg.id;
            DBMS_OUTPUT.PUT_LINE('Actual ' || (v_reg.salary + amount));
        ELSE
             UPDATE employees SET salary = (v_reg.salary * (1 + v_factor)) WHERE id = v_reg.id;
             DBMS_OUTPUT.PUT_LINE('Actual ' || (v_reg.salary * (1 + v_factor)));
        END IF;
    END LOOP;
END change_salary;
/
execute change_salary(10, 99 /*euros*/, 10);
insert into departments values (10, 'Finanzas', 'Aqui');
delete from employees;
insert into employees values (1, 'Ana', 10, 1000);
insert into employees values (2, 'Juan', 10, 1200);


-- Actividad (pag 311)
-- Crea un trigger que inserte en la tabla AuditIncrease (col1 VARCHAR2(200))
-- cualquier cambio que supere el 10% del salario de la tabla EMPLOYEE indicando 
-- fecha, hora, numero de empleado, nombre y salario actual
create or replace trigger audit_subida_salario
    after update on employees
    for each row
declare

begin
    if :NEW.salary > :OLD.salary * 1.1 then
        insert into AuditIncrease values (systimestamp || ' * ' || id || ' * ' || name ||
            ' * ' || :OLD.salary || ' * ' || :NEW.salary);
    end if;
end;