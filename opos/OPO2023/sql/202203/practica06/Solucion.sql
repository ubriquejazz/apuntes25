/* Crear los siguientes TRIGGERS sobre tablas de la BD pruebas_triggers_2021 */
-- ----------------------------------------------------------------------------

/* Ejemplo 1. Trigger 'nuevo_empleado' que inserta un registro en la tabla 
antiguedad cada vez que se inserte un registro en la tabla empleado.
La columna anios se pondrá a 0.
Se dispararía, por ejemplo, tras la orden 
INSERT empleado VALUES (7,'hagsdhgsd','111',20);*/

CREATE TRIGGER nuevo_empleado AFTER INSERT ON empleado FOR EACH ROW
    INSERT antiguedad VALUES (NEW.idempleado,0);


/* Ejemplo 2. Trigger 'borra_antiguedad' que borra el registro de la tabla 
antiguedad cuando se elimine el registro correspondiente de la tabla empleado.
Se dispararía tras la orden DELETE FROM empleado WHERE idempledo = 5; 
por ejemplo.*/

CREATE TRIGGER borra_antiguedad AFTER DELETE ON empleado FOR EACH ROW 
    DELETE FROM antiguedad WHERE idempleado = OLD.idempleado;


/* Ejemplo 3. Trigger 'actualizar_empleado' que incrementa el salario del 
empleado en 50 cada vez que se incremente en 1 el número de años de 
antigüedad. SI LA ACTUALIZACIÓN NO INCREMENTA EN 1 NO SE REALIZA LA 
ACTUALIZACIÓN !!
Se dispararía tras la orden 
UPDATE antiguedad SET anios = anios + 1 WHERE idempleado = 5; por ejemplo. */

DELIMITER //
CREATE TRIGGER actualizar_empleado BEFORE UPDATE ON antiguedad FOR EACH ROW
BEGIN
	DECLARE diferencia INT;
	SET diferencia = NEW.anios - OLD.anios;
	IF diferencia = 1 THEN
		UPDATE empleado SET salario = salario + 50 WHERE idempleado = OLD.idempleado;
        ELSE
           	SET NEW.anios = OLD.anios;
        END IF;
END //
DELIMITER ;


/* Ejemplo 4. Crear un trigger denominado 'actualizar_articulo' que reste de la columna stock de la tabla artículo 
las cantidades que se han vendido de ese artículo. Se debe realizar, por tanto, cada vez que se inserte un registro en la tabla venta.
Se dispararía tras la orden INSERT INTO venta VALUES (null, 1, 3); */

CREATE TRIGGER actualizar_articulo AFTER INSERT ON venta FOR EACH ROW
    UPDATE articulo SET stock = stock - NEW.cantidad WHERE id = NEW.articulo_id;


/* Ejemplo 5. Crear el trigger 'graba_historial' que cada vez que se borre un registro de la tabla articulo 
se grabe ese registro en la tabla historial_articulo (id, nombre, usuario que ha realizado el borrado y la fecha y hora del mismo).
Para que se active el trigger habría que hacer algo así:
DELETE FROM articulo WHERE precio < 20;
DELETE FROM articulo WHERE id = 2;
DELETE FROM articulo;*/

CREATE TRIGGER graba_historial BEFORE DELETE ON articulo FOR EACH ROW
    INSERT historial_articulo VALUES(OLD.id, OLD.nombre, USER(), NOW());


/* Ejemplo 6. Crear un trigger llamado 'despues_borrar' que inserte un registro en la tabla auditoria con toda 
la información del registro eliminado de la tabla t1.*/

CREATE TRIGGER despues_borrar AFTER DELETE ON t1 FOR EACH ROW
    INSERT auditoria VALUES (null, OLD.id, OLD.columna1, OLD.columna2, OLD.columna3, USER(), null);    




