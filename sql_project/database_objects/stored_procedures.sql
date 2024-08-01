USE OnlineCourses;

DROP PROCEDURE IF EXISTS actualizar_calificacion;
DROP PROCEDURE IF EXISTS agregar_leccion;
DROP PROCEDURE IF EXISTS inscribir_estudiante;

-- Procedimiento para actualizar la calificación de un estudiante en un curso
DELIMITER //

CREATE PROCEDURE actualizar_calificacion(
    IN p_estudiante_id INT,
    IN p_comision_id INT,
    IN p_nueva_calificacion INT
)
BEGIN
    DECLARE calificacion_id INT;
    
    -- Verificar si la calificación existe
    SELECT ID_Opinion_Estudiante INTO calificacion_id
    FROM Opinion_Estudiante
    WHERE ID_Estudiante = p_estudiante_id
    AND ID_Comision = p_comision_id;
    
    -- Actualizar la calificación si existe, de lo contrario insertar una nueva
    IF calificacion_id IS NOT NULL THEN
        UPDATE Opinion_Estudiante
        SET Calificacion = p_nueva_calificacion,
            Fecha = NOW()
        WHERE ID_Opinion_Estudiante = calificacion_id;
        
        SELECT 'Calificación actualizada exitosamente.';
    ELSE
        INSERT INTO Opinion_Estudiante (ID_Estudiante, ID_Comision, Fecha, Calificacion, Comentario)
        VALUES (p_estudiante_id, p_comision_id, NOW(), p_nueva_calificacion, 'Calificación añadida.');
        
        SELECT 'Calificación añadida exitosamente.';
    END IF;
END //

DELIMITER ;

-- Procedimiento para agregar una nueva lección a un curso
DELIMITER //

CREATE PROCEDURE agregar_leccion(
    IN p_curso_id INT,
    IN p_titulo VARCHAR(255),
    IN p_descripcion TEXT
)
BEGIN
    -- Insertar la nueva lección
    INSERT INTO Leccion (ID_Curso, Titulo, Descripcion, Fecha_Creacion)
    VALUES (p_curso_id, p_titulo, p_descripcion, NOW());
    
    SELECT 'Lección agregada exitosamente.';
END //

DELIMITER ;

-- Procedimiento para inscribir un estudiante en un curso
DELIMITER //

CREATE PROCEDURE inscribir_estudiante(
    IN p_estudiante_id INT,
    IN p_comision_id INT,
    IN p_metodo_pago_id INT,
    IN p_precio_pagar DECIMAL(10, 2)
)
BEGIN
    DECLARE estudiante_existe BOOLEAN;
    
    -- Verificar si el estudiante ya está inscrito en la comisión
    SELECT COUNT(*) INTO estudiante_existe
    FROM Matricula
    WHERE ID_Estudiante = p_estudiante_id
    AND ID_Comision = p_comision_id;
    
    -- Inscribir al estudiante si no está inscrito
    IF estudiante_existe = 0 THEN
        INSERT INTO Matricula (ID_Estudiante, ID_Comision, Fecha_Matricula, ID_Metodo_Pago, Precio_Pagar, Fecha_Creacion)
        VALUES (p_estudiante_id, p_comision_id, NOW(), p_metodo_pago_id, p_precio_pagar, NOW());
        
        SELECT 'Estudiante inscrito exitosamente.';
    ELSE
        SELECT 'El estudiante ya está inscrito en esta comisión.';
    END IF;
END //

DELIMITER ;
