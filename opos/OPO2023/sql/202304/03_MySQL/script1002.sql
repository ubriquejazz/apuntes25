-- File: script1002
-- Desc: Triggers, Cursores
-- Date: 2023.03.23

-- Calcula automáticamente la edad de los usuarios
-- en el mismo momento en el que se dan de alta
-- a partir de la fecha de nacimiento que introduzca 
-- el usuario
CREATE TRIGGER nuevo_usuario BEFORE INSERT ON usuarios
FOR EACH ROW
BEGIN
    IF NEW.fecha_nacimiento IS NOT NULL THEN
        SET NEW.edad = YEAR(CURRENT_DATE()) - YEAR(NEW.fecha_nacimiento);
    END IF;
END;

-- Actualiza la fecha de última reserva de una pista
-- cada vez que ésta se reserva
CREATE TRIGGER anota_ultima_reserva AFTER INSERT ON reservas
FOR EACH ROW
BEGIN
    UPDATE pistas_abiertas
        SET fecha_ultima_reserva = CURRENT_TIMESTAMP()
        WHERE id_pista = NEW.id_pista;
END;

-- Registra una pista como pista clausurada al público cuando 
-- ésta se elimina de la Base de Datos
CREATE TRIGGER retira_pista AFTER DELETE ON pistas_abiertas
FOR EACH ROW
BEGIN
    INSERT INTO pistas_cerradas (id_pista, fecha_clausura, motivo)
        VALUES (OLD.id_pista, CURRENT_TIMESTAMP(), 'Eliminada');
END;