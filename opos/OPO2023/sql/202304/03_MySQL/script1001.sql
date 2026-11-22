-- File: script1001
-- Desc: Procedures
-- Date: 2023.03.23

CREATE PROCEDURE ver_clientes()
BEGIN
    SELECT * FROM clientes;
END;

-- Control de errores
CREATE PROCEDURE nueva_pista(p_codigo VARCHAR(10), p_tipo VARCHAR(255), 
    p_precio FLOAT, p_id_polideportivo INT)
procedimiento: BEGIN
    DECLARE existe_polideportivo TINYINT(1);
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;
 
    SET existe_polideportivo = (SELECT COUNT(*) FROM polideportivos
                                WHERE id = p_id_polideportivo);
    IF existe_polideportivo = 0 THEN
        LEAVE procedimiento;
    END IF;
 
    START TRANSACTION;
 
        INSERT INTO pistas (codigo, tipo, precio, id_polideportivo)
            VALUES (p_codigo, p_tipo, p_precio, p_id_polideportivo);
        INSERT INTO pistas_abiertas (id_pista, operativa)
            VALUES (LAST_INSERT_ID(), TRUE);
 
    COMMIT;
END procedimiento;

-- Cursores