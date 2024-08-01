DROP DATABASE IF EXISTS OnlineCourses;
CREATE DATABASE OnlineCourses;
USE OnlineCourses;

-- Tabla Usuario
CREATE TABLE Usuario (
    ID_Usuario INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(255) NOT NULL,
    Apellido VARCHAR(255) NOT NULL,
    Correo_Electronico VARCHAR(255) UNIQUE NOT NULL,
    Contrasena VARCHAR(255) NOT NULL,
    Fecha_Registro DATETIME DEFAULT CURRENT_TIMESTAMP,
    Fecha_Creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    Activo BOOLEAN DEFAULT TRUE,
    DNI VARCHAR(20) UNIQUE NOT NULL,
    Pais_Residencia VARCHAR(100) NOT NULL
) COMMENT 'Tabla para almacenar información general de los usuarios';

-- Tabla Estudiante
CREATE TABLE Estudiante (
    ID_Estudiante INT PRIMARY KEY AUTO_INCREMENT,
    ID_Usuario INT NOT NULL,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario)
) COMMENT 'Tabla para almacenar información específica de los estudiantes';

-- Tabla Profesor
CREATE TABLE Profesor (
    ID_Profesor INT PRIMARY KEY AUTO_INCREMENT,
    ID_Usuario INT NOT NULL,
    Especialidad VARCHAR(100),
    FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario)
) COMMENT 'Tabla para almacenar información específica de los profesores';

-- Tabla Categoría
CREATE TABLE Categoria (
    ID_Categoria INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Descripcion VARCHAR(255),
    Fecha_Creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    UNIQUE INDEX (Nombre)
) COMMENT 'Tabla para almacenar las categorías a las que pueden pertenecer los cursos';

-- Tabla Curso
CREATE TABLE Curso (
    ID_Curso INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(255) NOT NULL,
    Descripcion VARCHAR(255),
    Precio DECIMAL(10, 2) NOT NULL,
    Fecha_Creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    UNIQUE INDEX (Nombre)
) COMMENT 'Tabla para almacenar información sobre los cursos';

-- Tabla Comision
CREATE TABLE Comision (
    ID_Comision INT PRIMARY KEY AUTO_INCREMENT,
    ID_Curso INT NOT NULL,
    ID_Profesor INT NOT NULL,
    Nombre VARCHAR(255) NOT NULL,
    Descripcion VARCHAR(255),
    Fecha_Inicio DATETIME NOT NULL,
    Fecha_Fin DATETIME NOT NULL,
    Modalidad VARCHAR(100) NOT NULL,
    Duracion VARCHAR(100) NOT NULL,
    Horarios VARCHAR(255) NOT NULL,
    Fecha_Creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    Fecha_Modificacion DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (ID_Curso) REFERENCES Curso(ID_Curso),
    FOREIGN KEY (ID_Profesor) REFERENCES Profesor(ID_Profesor),
    UNIQUE INDEX (Nombre, Fecha_Inicio, Fecha_Fin)
) COMMENT 'Tabla para almacenar información sobre las comisiones o grupos de cursos';

-- Tabla CursoPorCategoria
CREATE TABLE CursoPorCategoria (
    ID_CursoPorCategoria INT PRIMARY KEY AUTO_INCREMENT,
    ID_Curso INT NOT NULL,
    ID_Categoria INT NOT NULL,
    Fecha_Creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ID_Curso) REFERENCES Curso(ID_Curso),
    FOREIGN KEY (ID_Categoria) REFERENCES Categoria(ID_Categoria),
    UNIQUE INDEX (ID_Curso, ID_Categoria)
) COMMENT 'Tabla intermedia para la relación entre cursos y categorías';

-- Tabla Método de Pago
CREATE TABLE Metodo_Pago (
    ID_Metodo_Pago INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(255),
    Estado BOOLEAN NOT NULL,
    Fecha_Creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    UNIQUE INDEX (Nombre)
) COMMENT 'Tabla para almacenar los diferentes métodos de pago disponibles';

-- Tabla Matricula
CREATE TABLE Matricula (
    ID_Matricula INT PRIMARY KEY AUTO_INCREMENT,
    ID_Estudiante INT NOT NULL,
    ID_Comision INT NOT NULL,
    Fecha_Matricula DATETIME NOT NULL,
    ID_Metodo_Pago INT NOT NULL,
    Precio_Pagar DECIMAL(10, 2) NOT NULL,
    Fecha_Creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ID_Estudiante) REFERENCES Estudiante(ID_Estudiante),
    FOREIGN KEY (ID_Comision) REFERENCES Comision(ID_Comision),
    FOREIGN KEY (ID_Metodo_Pago) REFERENCES Metodo_Pago(ID_Metodo_Pago),
    UNIQUE INDEX (ID_Estudiante, ID_Comision)
) COMMENT 'Tabla para almacenar información sobre las matrículas de los estudiantes en los cursos';

-- Tabla Leccion
CREATE TABLE Leccion (
    ID_Leccion INT PRIMARY KEY AUTO_INCREMENT,
    ID_Curso INT NOT NULL,
    Titulo VARCHAR(255) NOT NULL,
    Descripcion TEXT,
    Fecha_Creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ID_Curso) REFERENCES Curso(ID_Curso)
) COMMENT 'Tabla para almacenar información sobre las lecciones dentro de los cursos';

-- Tabla MaterialCurso
CREATE TABLE MaterialCurso (
    ID_Material INT PRIMARY KEY AUTO_INCREMENT,
    ID_Leccion INT NOT NULL,
    Tipo VARCHAR(50) NOT NULL,
    URL VARCHAR(255),
    Fecha_Creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ID_Leccion) REFERENCES Leccion(ID_Leccion)
) COMMENT 'Tabla para almacenar los materiales asociados con las lecciones de los cursos';

-- Tabla Opinion_Estudiante
CREATE TABLE Opinion_Estudiante (
    ID_Opinion_Estudiante INT PRIMARY KEY AUTO_INCREMENT,
    ID_Estudiante INT NOT NULL,
    ID_Comision INT NOT NULL,
    Fecha DATETIME NOT NULL,
    Calificacion INT NOT NULL,
    Comentario VARCHAR(255),
    Fecha_Creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ID_Estudiante) REFERENCES Estudiante(ID_Estudiante),
    FOREIGN KEY (ID_Comision) REFERENCES Comision(ID_Comision)
) COMMENT 'Tabla para almacenar las opiniones y el feedback de los estudiantes sobre los cursos';
