USE OnlineCourses;

-- IMPORTANTE PARA QUE ENTIENDA QUE DEBE HACER LA IMPORTACION
SET GLOBAL local_infile = true;

-- Tabla Usuario - Importación desde CSV
LOAD DATA LOCAL INFILE '/sql_project/data_csv/usuarios.csv'
INTO TABLE Usuario
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Nombre, Apellido, Correo_Electronico, Contrasena, DNI, Pais_Residencia);

-- Tabla Profesor - Importación desde CSV
LOAD DATA LOCAL INFILE '/sql_project/data_csv/profesores.csv'
INTO TABLE Profesor
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(ID_Usuario, Especialidad);

-- Tabla Estudiante - Importación desde CSV
LOAD DATA LOCAL INFILE '/sql_project/data_csv/estudiantes.csv'
INTO TABLE Estudiante
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(ID_Usuario);

-- Tabla Categoría - Importación desde CSV
LOAD DATA LOCAL INFILE '/sql_project/data_csv/categorias.csv'
INTO TABLE Categoria
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Nombre, Descripcion);

-- Tabla Curso - Importación desde CSV
LOAD DATA LOCAL INFILE '/sql_project/data_csv/cursos.csv'
INTO TABLE Curso
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Nombre, Descripcion, Precio);

-- Tabla Comision - Importación desde CSV
LOAD DATA LOCAL INFILE '/sql_project/data_csv/comisiones.csv'
INTO TABLE Comision
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(ID_Curso, ID_Profesor, Nombre, Descripcion, Fecha_Inicio, Fecha_Fin, Modalidad, Duracion, Horarios);

-- Tabla CursoPorCategoria - Importación desde CSV
LOAD DATA LOCAL INFILE '/sql_project/data_csv/curso_por_categoria.csv'
INTO TABLE CursoPorCategoria
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(ID_Curso, ID_Categoria);

-- Tabla Metodo_Pago - Importación desde CSV
LOAD DATA LOCAL INFILE '/sql_project/data_csv/metodos_pago.csv'
INTO TABLE Metodo_Pago
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Nombre, Descripcion, Estado);

-- Tabla Matricula - Importación desde CSV
LOAD DATA LOCAL INFILE '/sql_project/data_csv/matriculas.csv'
INTO TABLE Matricula
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(ID_Estudiante, ID_Comision, Fecha_Matricula, ID_Metodo_Pago, Precio_Pagar);

-- Tabla Leccion - Importación desde CSV
LOAD DATA LOCAL INFILE '/sql_project/data_csv/lecciones.csv'
INTO TABLE Leccion
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(ID_Curso, Titulo, Descripcion);

-- Tabla MaterialCurso - Importación desde CSV
LOAD DATA LOCAL INFILE '/sql_project/data_csv/materiales_curso.csv'
INTO TABLE MaterialCurso
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(ID_Leccion, Tipo, URL);

-- Tabla Opinion_Estudiante - Importación desde CSV
LOAD DATA LOCAL INFILE '/sql_project/data_csv/opiniones_estudiante.csv'
INTO TABLE Opinion_Estudiante
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(ID_Estudiante, ID_Comision, Fecha, Calificacion, Comentario);

