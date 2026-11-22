/*
    Date: 2022-05 -27
    Exam: EVALUATION 3
*/


/* 3 Points */

    CREATE TABLE employees (id INT, name VARCHAR2(20), dpt_id INT, salary INT);
    CREATE TABLE departments (id INT, name VARCHAR2(20), city VARCHAR2(20));
    CREATE TABLE AuditaEmple (col1 VARCHAR2(200));

    insert into departments values (10, 'Marketing', 'Madrid');
    insert into departments values (11, 'Desarrollo', 'Barcelona');

    insert into employees values (1, 'David', 10, 2000);
    insert into employees values (2, 'Pepe', 11, 2000);
    insert into employees values (3, 'Paco', 10, 1000);
    insert into employees values (4, 'Manolo', 11, 1000);

    -- Create a view that contains the data of the employees of department 10 with salary > 1200.
    CREATE OR REPLACE VIEW  DEP10 (id, name, dpt_id, salary)
    AS SELECT * FROM employees WHERE dpt_id = 10 AND salary > 1200;

    -- Then execute an UPDATE and DELETE operations on the view.
    INSERT INTO DEP10 VALUES (5, 'Luisa', 11, 2000);
    UPDATE DEP10 SET name = 'Luis' WHERE id = 5;
    DELETE FROM DEP10 WHERE id = 5;

    -- Write a procedure that modifies the city of a department. The procedure will receive the department number and the new city as parameters.
    CREATE OR REPLACE PROCEDURE change_city (dpt_no NUMBER, new_city VARCHAR2)
    AS  
        v_previous_city   departments.city%TYPE;
    BEGIN
        SELECT city INTO v_previous_city FROM departments WHERE id=dpt_no;
        UPDATE departments SET city=new_city WHERE id=dpt_no;
        DBMS_OUTPUT.PUT_LINE(dpt_no || '*Ciudad Anterior: ' || v_previous_city ||
            '*Nuevo Ciudad: ' || new_city);
    END change_city;
    /
    execute change_city(10, 'Sevilla');

    -- Write a program/block to show all the employee names ordered by salary
    DECLARE
        CURSOR c1 IS
            SELECT id, name FROM employees ORDER BY salary;
    BEGIN
        FOR v_reg IN c1 LOOP
            DBMS_OUTPUT.PUT_LINE(v_reg.name);
        END LOOP;
    END;

/* 1.5 POINTs */

/*  Write a trigger that allows you to audit data insertion or deletion operations performed on the employee table according to the following specifications.
    The AuditaEmple table will be created with the column col1 VARCHAR2(200)
    When any manipulation occurs, a row will be inserted in that table that will contain date, time, employee number, name
    and the update operation (INSERT or DELETE)
*/
CREATE OR REPLACE TRIGGER audit_insert_delete
    AFTER INSERT -- OR BEFORE DELETE
    ON employees
    FOR EACH ROW
BEGIN   
    IF inserting THEN
        INSERT INTO AuditaEmple VALUES (systimestamp || ' * ' || :NEW.id || ' * ' || :NEW.name || ' * ' || 'INSERT');
    END IF;
    IF deleting THEN
        INSERT INTO AuditaEmple VALUES (systimestamp || ' * ' || :OLD.id || ' * ' || :OLD.name || ' * ' || 'DELETE');
    END IF;

END;
/

/* 1.5 POINTs -  David's version */

/*  Write a trigger that allows you to audit the changes in the table employees, inserting in the AuditaEmple table:
    SYSTIMESTAMP, employee number or name, update operation (UPDATE)
    old value and new value of each modified column (only for modified columns)
*/
create or replace trigger on_update_employees
before update on employees
for each row
declare
    v_base_record varchar(200);
begin
    
    v_base_record := systimestamp || ' * ' || :OLD.id || ' * ' || :OLD.name || ' * ' || 'UPDATE';
    
    if :OLD.id != :NEW.id then
        v_base_record := v_base_record || 'old_id: ' || :OLD.id || ' new_id: ' || :NEW.id;
    end if;
    
    if :OLD.name != :NEW.name then
        v_base_record := v_base_record || 'old_name: ' || :OLD.name || ' new_name: ' || :NEW.name;
    end if;
    
    if :OLD.dpt_id != :NEW.dpt_id then
        v_base_record := v_base_record || 'old_dpt_id: ' || :OLD.dpt_id || ' new_dpt_id: ' || :NEW.dpt_id;
    end if;
    
    if :OLD.salary != :NEW.salary then
        v_base_record := v_base_record || 'old_salary: ' || :OLD.salary || ' new_salary: ' || :NEW.salary;
    end if;
    
    insert into auditaemple values(v_base_record);

end;
/

/* 4 POINTs - based on David's version */

CREATE TABLE orders (id INT, customer_id INT, product_id INT, units INT);
CREATE TABLE products (id INT, price INT, available INT);
CREATE TABLE customer (id INT, max_credit INT, owed INT);

/*  Write a program to register new orders according to the following specifications:
    It will receive as parameters ORDER_ID, CUSTOMER_ID, PRODUCT_ID, UNITS. 
    It will validate all this data, as well as the AVAILABLE units of the product and 
    the customer's credit limit (it will fail by sending an error message if anything is wrong)
*/

create or replace procedure new_order (order_id integer, customer_id integer, product_id integer, units integer)
is
    v_available char(1);
    v_price number(7, 2);
    v_total number(7, 2);
    v_customer_owed number(7, 2);
    v_credit_limit number(7, 2);
begin
    -- Get credit and owed from customer
    select 
        max_credit, owed into v_credit_limit, v_customer_owed
    from customer 
    where id = customer_id;

    -- Get avaiable and unit price from product
    select 
        available, price into v_available, v_price
    from products
    where id = product_id;

    -- Check available    
    if v_available < units then
        raise_application_error(-20010, 'Product not available');
    end if;
    
    -- Check if total is below max_credit
    v_total := v_price * units;
    
    if v_total > v_credit_limit then
        raise_application_error(-20010, 'Credit limit reached');
    end if;
    
    -- If application doesn't raise any exception make the insert
    insert into orders values(order_id, customer_id, product_id, units);
    
    -- Update the owned column with the total of the price.
    update customer
    set owed = v_customer_owed + v_total
    where id = customer_id;

    -- Update the available units of the product. 
    update products
    set available = v_available - units
    where id = product_id;
end;
/
