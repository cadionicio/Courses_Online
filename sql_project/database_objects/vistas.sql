USE OnlineCourses;

-- Vista para el número de estudiantes por curso:
CREATE VIEW EstudiantesPorCurso AS
SELECT 
    Curso.Nombre AS NombreCurso,
    COUNT(Matricula.ID_Estudiante) AS TotalEstudiantes
FROM 
    Curso
    JOIN Comision ON Curso.ID_Curso = Comision.ID_Curso
    JOIN Matricula ON Comision.ID_Comision = Matricula.ID_Comision
GROUP BY 
    Curso.Nombre;

-- Vista para las calificaciones promedio por curso:
CREATE VIEW CalificacionesPromedioPorCurso AS
SELECT 
    Curso.Nombre AS NombreCurso,
    AVG(Opinion_Estudiante.Calificacion) AS CalificacionPromedio
FROM 
    Curso
    JOIN Comision ON Curso.ID_Curso = Comision.ID_Curso
    JOIN Opinion_Estudiante ON Comision.ID_Comision = Opinion_Estudiante.ID_Comision
GROUP BY 
    Curso.Nombre;

-- Vista para el progreso de lecciones por curso:
CREATE VIEW ProgresoLeccionesPorCurso AS
SELECT 
    Curso.Nombre AS NombreCurso,
    COUNT(Leccion.ID_Leccion) AS TotalLecciones,
    COUNT(MaterialCurso.ID_Material) AS TotalMateriales
FROM 
    Curso
    JOIN Leccion ON Curso.ID_Curso = Leccion.ID_Curso
    LEFT JOIN MaterialCurso ON Leccion.ID_Leccion = MaterialCurso.ID_Leccion
GROUP BY 
    Curso.Nombre;
