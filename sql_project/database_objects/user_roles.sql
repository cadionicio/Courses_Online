USE OnlineCourses;

-- CREACIÓN DE ROLES Y ASIGNACIÓN DE USUARIOS

-- Crearemos 4 roles que representan las áreas encargadas

DROP ROLE IF EXISTS 'SISTEMA', 'ADMIN', 'PROFESOR', 'ESTUDIANTE';
CREATE ROLE 'SISTEMA', 'ADMIN', 'PROFESOR', 'ESTUDIANTE';

-- Otorgaremos permisos

-- ROL SISTEMA
-- Todos los permisos
GRANT ALL PRIVILEGES ON OnlineCourses.* TO 'SISTEMA';

-- ROL ADMIN
-- DML sobre las tablas principales
GRANT SELECT, INSERT, UPDATE ON OnlineCourses.Usuario TO 'ADMIN';
GRANT SELECT, INSERT, UPDATE ON OnlineCourses.Curso TO 'ADMIN';
GRANT SELECT, INSERT, UPDATE ON OnlineCourses.Categoria TO 'ADMIN';
GRANT SELECT, INSERT, UPDATE ON OnlineCourses.Comision TO 'ADMIN';

-- Ejecución de funciones y procedimientos
GRANT EXECUTE ON FUNCTION OnlineCourses.contar_cursos_profesor TO 'ADMIN';
GRANT EXECUTE ON FUNCTION OnlineCourses.estudiante_inscrito_curso TO 'ADMIN';
GRANT EXECUTE ON FUNCTION OnlineCourses.calificacion_promedio_curso TO 'ADMIN';
GRANT EXECUTE ON PROCEDURE OnlineCourses.actualizar_calificacion TO 'ADMIN';
GRANT EXECUTE ON PROCEDURE OnlineCourses.agregar_leccion TO 'ADMIN';
GRANT EXECUTE ON PROCEDURE OnlineCourses.inscribir_estudiante TO 'ADMIN';

-- Utilización de vistas
GRANT SELECT ON OnlineCourses.EstudiantesPorCurso TO 'ADMIN';
GRANT SELECT ON OnlineCourses.CalificacionesPromedioPorCurso TO 'ADMIN';
GRANT SELECT ON OnlineCourses.ProgresoLeccionesPorCurso TO 'ADMIN';

-- ROL PROFESOR
-- DML sobre tablas relacionadas con la enseñanza
GRANT SELECT, INSERT, UPDATE ON OnlineCourses.Leccion TO 'PROFESOR';
GRANT SELECT, INSERT, UPDATE ON OnlineCourses.MaterialCurso TO 'PROFESOR';

-- Ejecución de procedimientos específicos
GRANT EXECUTE ON PROCEDURE OnlineCourses.agregar_leccion TO 'PROFESOR';

-- Utilización de vistas
GRANT SELECT ON OnlineCourses.EstudiantesPorCurso TO 'PROFESOR';
GRANT SELECT ON OnlineCourses.ProgresoLeccionesPorCurso TO 'PROFESOR';

-- ROL ESTUDIANTE
-- Permisos de lectura y escritura limitados
GRANT SELECT ON OnlineCourses.Curso TO 'ESTUDIANTE';
GRANT SELECT ON OnlineCourses.Comision TO 'ESTUDIANTE';
GRANT SELECT ON OnlineCourses.Leccion TO 'ESTUDIANTE';
GRANT SELECT ON OnlineCourses.MaterialCurso TO 'ESTUDIANTE';
GRANT SELECT, INSERT ON OnlineCourses.Matricula TO 'ESTUDIANTE';
GRANT SELECT, INSERT ON OnlineCourses.Opinion_Estudiante TO 'ESTUDIANTE';

-- Utilización de vistas
GRANT SELECT ON OnlineCourses.EstudiantesPorCurso TO 'ESTUDIANTE';
GRANT SELECT ON OnlineCourses.CalificacionesPromedioPorCurso TO 'ESTUDIANTE';

-- Crearemos los usuarios

-- SISTEMA
DROP USER IF EXISTS
    'LeoDI'@'%',
    'JesiB'@'%';

CREATE USER 'LeoDI'@'%' IDENTIFIED BY 'sys123'
    FAILED_LOGIN_ATTEMPTS 3
    PASSWORD_LOCK_TIME 2
    PASSWORD EXPIRE INTERVAL 180 DAY;
CREATE USER 'JesiB'@'%' IDENTIFIED BY 'sys456'
    FAILED_LOGIN_ATTEMPTS 3
    PASSWORD_LOCK_TIME 2
    PASSWORD EXPIRE INTERVAL 180 DAY;

-- ADMIN
DROP USER IF EXISTS
    'AndreC'@'localhost',
    'FedeZ'@'localhost',
    'HugoQ'@'localhost';

CREATE USER 'AndreC'@'localhost' IDENTIFIED BY 'adm01'
    FAILED_LOGIN_ATTEMPTS 3
    PASSWORD LOCK_TIME 5
    PASSWORD EXPIRE INTERVAL 90 DAY;
CREATE USER 'FedeZ'@'localhost' IDENTIFIED BY 'adm02'
    FAILED_LOGIN_ATTEMPTS 3
    PASSWORD LOCK_TIME 5
    PASSWORD EXPIRE INTERVAL 90 DAY;
CREATE USER 'HugoQ'@'localhost' IDENTIFIED BY 'adm03'
    FAILED_LOGIN_ATTEMPTS 3
    PASSWORD LOCK TIME 2
    PASSWORD EXPIRE INTERVAL 90 DAY;

-- PROFESOR
DROP USER IF EXISTS
    'CrisA'@'localhost', 'ReneB'@'localhost',
    'SantiG'@'localhost', 'MatiK'@'localhost';

CREATE USER 'CrisA'@'localhost' IDENTIFIED BY 'dep01'
    FAILED_LOGIN_ATTEMPTS 3
    PASSWORD LOCK TIME 5
    PASSWORD EXPIRE INTERVAL 90 DAY;
CREATE USER 'ReneB'@'localhost' IDENTIFIED BY 'dep02'
    FAILED_LOGIN_ATTEMPTS 3
    PASSWORD LOCK TIME 5
    PASSWORD EXPIRE INTERVAL 90 DAY;
CREATE USER 'SantiG'@'localhost' IDENTIFIED BY 'dep03'
    FAILED_LOGIN_ATTEMPTS 3
    PASSWORD LOCK TIME 5
    PASSWORD EXPIRE INTERVAL 90 DAY;
CREATE USER 'MatiK'@'localhost' IDENTIFIED BY 'dep04'
    FAILED_LOGIN_ATTEMPTS 3
    PASSWORD LOCK TIME 5
    PASSWORD EXPIRE INTERVAL 90 DAY;

-- ESTUDIANTE
DROP USER IF EXISTS
    'RubenM'@'localhost', 'LucasN'@'localhost';

CREATE USER 'RubenM'@'localhost' IDENTIFIED BY 'con01'
    FAILED_LOGIN_ATTEMPTS 3
    PASSWORD LOCK TIME 5
    PASSWORD EXPIRE INTERVAL 90 DAY;
CREATE USER 'LucasN'@'localhost' IDENTIFIED BY 'con02'
    FAILED_LOGIN_ATTEMPTS 3
    PASSWORD LOCK TIME 5
    PASSWORD EXPIRE INTERVAL 90 DAY;

-- Otorgamos roles

GRANT 'SISTEMA' TO
    'LeoDI'@'%', 'JesiB'@'%';

GRANT 'ADMIN' TO
    'AndreC'@'localhost', 'FedeZ'@'localhost',
    'HugoQ'@'localhost';

GRANT 'PROFESOR' TO
    'CrisA'@'localhost', 'ReneB'@'localhost',
    'SantiG'@'localhost', 'MatiK'@'localhost';

GRANT 'ESTUDIANTE' TO
    'RubenM'@'localhost', 'LucasN'@'localhost';

-- Activación de roles por defecto

SET DEFAULT ROLE 'SISTEMA'
    TO 'LeoDI'@'%',
        'JesiB'@'%';

SET DEFAULT ROLE 'ADMIN'
    TO 'AndreC'@'localhost',
        'FedeZ'@'localhost',
        'HugoQ'@'localhost';

SET DEFAULT ROLE 'PROFESOR'
    TO 'CrisA'@'localhost',
        'ReneB'@'localhost',
        'SantiG'@'localhost',
        'MatiK'@'localhost';

SET DEFAULT ROLE 'ESTUDIANTE'
    TO 'RubenM'@'localhost',
        'LucasN'@'localhost';

-- Actualizamos los privilegios

FLUSH PRIVILEGES;

-- Corroboramos los roles asignados en cada usuario

SHOW GRANTS FOR 'LeoDI'@'%';
SHOW GRANTS FOR 'JesiB'@'%';
SHOW GRANTS FOR 'AndreC'@'localhost';
SHOW GRANTS FOR 'FedeZ'@'localhost';
SHOW GRANTS FOR 'HugoQ'@'localhost';
SHOW GRANTS FOR 'CrisA'@'localhost';
SHOW GRANTS FOR 'ReneB'@'localhost';
SHOW GRANTS FOR 'SantiG'@'localhost';
SHOW GRANTS FOR 'MatiK'@'localhost';
SHOW GRANTS FOR 'RubenM'@'localhost';
SHOW GRANTS FOR 'LucasN'@'localhost';
