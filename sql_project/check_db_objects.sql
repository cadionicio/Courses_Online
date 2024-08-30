-- QUERIES PARA VERIFICAR LAS CREACIONES Y CHEQUEAR DE QUE FUE EXITOSA LA CREACION DE CADA UNA

USE OnlineCourses;

SELECT 
    TABLE_NAME, 
    TABLE_COMMENT
FROM 
    INFORMATION_SCHEMA.TABLES
WHERE 
    TABLE_SCHEMA = 'OnlineCourses';


-- VERIFICACION DE IMPORTACION

SELECT 
    table_name AS `Table`, 
    table_rows AS `Row Count`
FROM 
    information_schema.tables
WHERE 
    table_schema = 'OnlineCourses'
ORDER BY 
    table_rows DESC;


-- VERIFICACION DE VISTAS
SELECT 
    TABLE_NAME AS `Vista`,
    TABLE_TYPE AS `Tipo`
FROM 
    INFORMATION_SCHEMA.TABLES
WHERE 
    TABLE_SCHEMA = 'OnlineCourses' 
    AND TABLE_TYPE = 'VIEW'
ORDER BY 
    TABLE_NAME;

-- VERIFICACION DE FUNCIONES
SELECT 
    ROUTINE_NAME AS `Función`,
    DATA_TYPE AS `Tipo de Retorno`
FROM 
    INFORMATION_SCHEMA.ROUTINES
WHERE 
    ROUTINE_SCHEMA = 'OnlineCourses' 
    AND ROUTINE_TYPE = 'FUNCTION'
ORDER BY 
    ROUTINE_NAME;

-- VERIFICACION DE PROCEDURES

SELECT 
    ROUTINE_NAME AS `Procedimiento`,
    ROUTINE_TYPE AS `Tipo`
FROM 
    INFORMATION_SCHEMA.ROUTINES
WHERE 
    ROUTINE_SCHEMA = 'OnlineCourses' 
    AND ROUTINE_TYPE = 'PROCEDURE'
ORDER BY 
    ROUTINE_NAME;

-- VERIFICACION DE TRIGGERS

SELECT 
    TRIGGER_NAME AS `Nombre del Trigger`,
    EVENT_MANIPULATION AS `Evento`,
    EVENT_OBJECT_TABLE AS `Tabla`,
    ACTION_TIMING AS `Momento`
FROM 
    INFORMATION_SCHEMA.TRIGGERS
WHERE 
    TRIGGER_SCHEMA = 'OnlineCourses'
ORDER BY 
    EVENT_OBJECT_TABLE, 
    ACTION_TIMING, 
    EVENT_MANIPULATION;


SELECT
    FROM_USER AS Roles,
    TO_USER AS Usuarios,
    CASE 
        WHEN FROM_USER = 'SISTEMA' THEN 'Desde cualquier host'
        ELSE 'Dispositivo local'
    END AS Conexion,
    CASE 
        WHEN FROM_USER = 'SISTEMA' THEN 'Acceso total al sistema'
        WHEN FROM_USER = 'ADMIN' THEN 'Permisos de administrador'
        WHEN FROM_USER = 'PROFESOR' THEN 'Control sobre cursos y lecciones'
        ELSE 'Acceso limitado para estudiantes'
    END AS Comentario
FROM mysql.role_edges
ORDER BY Roles ASC;
