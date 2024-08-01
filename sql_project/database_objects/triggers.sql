USE OnlineCourses;

-- Tabla para almacenar los registros de cambios
CREATE TABLE 
    LOG_CAMBIOS (
        id_log          INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        tabla_afectada  VARCHAR(50),
        accion          VARCHAR(50),
        fecha           DATETIME,
        id_usuario      INT,
        usuario         VARCHAR(50)
    );

-- Trigger para almacenar registros cuando se inserta un nuevo usuario
DELIMITER //

CREATE TRIGGER after_insert_usuario
AFTER INSERT ON Usuario
FOR EACH ROW
BEGIN
    INSERT INTO LOG_CAMBIOS (tabla_afectada, accion, fecha, id_usuario, usuario)
    VALUES ('Usuario', 'INSERT', NOW(), NEW.ID_Usuario, USER());
END //

DELIMITER ;

-- Trigger para verificar si el correo electrónico de un usuario es único al insertar un nuevo usuario
DELIMITER //

CREATE TRIGGER before_insert_usuario
BEFORE INSERT ON Usuario
FOR EACH ROW
BEGIN
    DECLARE correo_count INT;
    
    SELECT COUNT(*) INTO correo_count
    FROM Usuario
    WHERE Correo_Electronico = NEW.Correo_Electronico;
    
    IF correo_count > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El correo electrónico ya está en uso.';
    END IF;
END //

DELIMITER ;

-- Trigger para verificar si un estudiante ya está inscrito en una comisión antes de insertar una nueva inscripción
DELIMITER //

CREATE TRIGGER before_insert_matricula
BEFORE INSERT ON Matricula
FOR EACH ROW
BEGIN
    DECLARE matricula_count INT;
    
    SELECT COUNT(*) INTO matricula_count
    FROM Matricula
    WHERE ID_Estudiante = NEW.ID_Estudiante
    AND ID_Comision = NEW.ID_Comision;
    
    IF matricula_count > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El estudiante ya está inscrito en esta comisión.';
    END IF;
END //

DELIMITER ;

-- Trigger para almacenar registros cuando se actualiza la calificación de un estudiante
DELIMITER //

CREATE TRIGGER after_update_calificacion
AFTER UPDATE ON Opinion_Estudiante
FOR EACH ROW
BEGIN
    IF OLD.Calificacion <> NEW.Calificacion THEN
        INSERT INTO LOG_CAMBIOS (tabla_afectada, accion, fecha, id_usuario, usuario)
        VALUES ('Opinion_Estudiante', 'UPDATE', NOW(), NEW.ID_Estudiante, USER());
    END IF;
END //

DELIMITER ;
