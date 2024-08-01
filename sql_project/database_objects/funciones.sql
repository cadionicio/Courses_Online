USE OnlineCourses;

DROP FUNCTION IF EXISTS contar_cursos_profesor;
DROP FUNCTION IF EXISTS estudiante_inscrito_curso;
DROP FUNCTION IF EXISTS calificacion_promedio_curso;

-- Función para contar el número de cursos asignados a un profesor:
DELIMITER //

CREATE FUNCTION contar_cursos_profesor(profesor_id INT) RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE cursos_count INT;
    
    SELECT COUNT(DISTINCT Curso.ID_Curso) INTO cursos_count
    FROM Curso
    JOIN Comision ON Curso.ID_Curso = Comision.ID_Curso
    WHERE Comision.ID_Profesor = profesor_id;
    
    RETURN cursos_count;
END //

DELIMITER ;

-- Función para verificar si un estudiante está inscrito en un curso:
DELIMITER //

CREATE FUNCTION estudiante_inscrito_curso(estudiante_id INT, curso_id INT) RETURNS BOOLEAN
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE is_inscrito BOOLEAN;
    DECLARE comision_id INT;
    
    SELECT ID_Comision INTO comision_id
    FROM Comision
    WHERE ID_Curso = curso_id
    LIMIT 1;
    
    IF comision_id IS NOT NULL THEN
        SELECT COUNT(*) INTO is_inscrito
        FROM Matricula
        WHERE ID_Estudiante = estudiante_id
        AND ID_Comision = comision_id;
    ELSE
        SET is_inscrito = FALSE;
    END IF;
    
    RETURN is_inscrito > 0;
END //

DELIMITER ;

-- Función para calcular la calificación promedio de un curso:
DELIMITER //

CREATE FUNCTION calificacion_promedio_curso(curso_id INT) RETURNS DECIMAL(5, 2)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE calificacion_promedio DECIMAL(5, 2);
    
    SELECT AVG(Opinion_Estudiante.Calificacion) INTO calificacion_promedio
    FROM Comision
    JOIN Opinion_Estudiante ON Comision.ID_Comision = Opinion_Estudiante.ID_Comision
    WHERE Comision.ID_Curso = curso_id;
    
    RETURN calificacion_promedio;
END //

DELIMITER ;
