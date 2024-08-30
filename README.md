# OnlineCourses Database

Este proyecto consiste en la creación de una base de datos para la plataforma educativa en línea "OnlineCourses". La base de datos gestiona información sobre los cursos ofrecidos, los instructores que los imparten, los estudiantes que se inscriben, las matrículas realizadas y las calificaciones obtenidas por los estudiantes. Además, incluye la gestión de métodos de pago, categorías de cursos, comisiones (ciclos) y la retroalimentación de los estudiantes sobre los cursos.

## Estructura de la Base de Datos

### Tablas Principales

1. **Usuario**
   - Almacena información general sobre los usuarios.
   - **Campos:** 
     - `ID_Usuario`: INT, PRIMARY KEY, AUTO_INCREMENT
     - `Nombre`: VARCHAR(255)
     - `Apellido`: VARCHAR(255)
     - `Correo_Electronico`: VARCHAR(255), UNIQUE
     - `Contrasena`: VARCHAR(255)
     - `Fecha_Registro`: DATETIME, DEFAULT CURRENT_TIMESTAMP
     - `Fecha_Creacion`: DATETIME, DEFAULT CURRENT_TIMESTAMP
     - `Activo`: BOOLEAN, DEFAULT TRUE
     - `DNI`: VARCHAR(20), UNIQUE
     - `Pais_Residencia`: VARCHAR(100)

2. **Estudiante**
   - Almacena información específica de los estudiantes.
   - **Campos:** 
     - `ID_Estudiante`: INT, PRIMARY KEY, AUTO_INCREMENT
     - `ID_Usuario`: INT, FOREIGN KEY (REFERENCES Usuario(ID_Usuario))

3. **Profesor**
   - Almacena información específica de los profesores.
   - **Campos:** 
     - `ID_Profesor`: INT, PRIMARY KEY, AUTO_INCREMENT
     - `ID_Usuario`: INT, FOREIGN KEY (REFERENCES Usuario(ID_Usuario))
     - `Especialidad`: VARCHAR(100)

4. **Categoria**
   - Almacena las categorías de los cursos.
   - **Campos:** 
     - `ID_Categoria`: INT, PRIMARY KEY, AUTO_INCREMENT
     - `Nombre`: VARCHAR(100)
     - `Descripcion`: VARCHAR(255)
     - `Fecha_Creacion`: DATETIME, DEFAULT CURRENT_TIMESTAMP

5. **Curso**
   - Almacena información sobre los cursos.
   - **Campos:** 
     - `ID_Curso`: INT, PRIMARY KEY, AUTO_INCREMENT
     - `Nombre`: VARCHAR(255)
     - `Descripcion`: VARCHAR(255)
     - `Precio`: DECIMAL(10, 2)
     - `Fecha_Creacion`: DATETIME, DEFAULT CURRENT_TIMESTAMP

6. **Comision**
   - Almacena información sobre las comisiones de los cursos.
   - **Campos:** 
     - `ID_Comision`: INT, PRIMARY KEY, AUTO_INCREMENT
     - `ID_Curso`: INT, FOREIGN KEY (REFERENCES Curso(ID_Curso))
     - `ID_Profesor`: INT, FOREIGN KEY (REFERENCES Profesor(ID_Profesor))
     - `Nombre`: VARCHAR(255)
     - `Descripcion`: VARCHAR(255)
     - `Fecha_Inicio`: DATETIME
     - `Fecha_Fin`: DATETIME
     - `Modalidad`: VARCHAR(100)
     - `Duracion`: VARCHAR(100)
     - `Horarios`: VARCHAR(255)
     - `Fecha_Creacion`: DATETIME, DEFAULT CURRENT_TIMESTAMP
     - `Fecha_Modificacion`: DATETIME, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP

7. **CursoPorCategoria**
   - Tabla intermedia para la relación entre cursos y categorías.
   - **Campos:** 
     - `ID_CursoPorCategoria`: INT, PRIMARY KEY, AUTO_INCREMENT
     - `ID_Curso`: INT, FOREIGN KEY (REFERENCES Curso(ID_Curso))
     - `ID_Categoria`: INT, FOREIGN KEY (REFERENCES Categoria(ID_Categoria))
     - `Fecha_Creacion`: DATETIME, DEFAULT CURRENT_TIMESTAMP

8. **Metodo_Pago**
   - Almacena los métodos de pago disponibles.
   - **Campos:** 
     - `ID_Metodo_Pago`: INT, PRIMARY KEY, AUTO_INCREMENT
     - `Nombre`: VARCHAR(50)
     - `Descripcion`: VARCHAR(255)
     - `Estado`: BOOLEAN
     - `Fecha_Creacion`: DATETIME, DEFAULT CURRENT_TIMESTAMP

9. **Matricula**
   - Almacena información sobre las matrículas de los estudiantes en los cursos.
   - **Campos:** 
     - `ID_Matricula`: INT, PRIMARY KEY, AUTO_INCREMENT
     - `ID_Estudiante`: INT, FOREIGN KEY (REFERENCES Estudiante(ID_Estudiante))
     - `ID_Comision`: INT, FOREIGN KEY (REFERENCES Comision(ID_Comision))
     - `Fecha_Matricula`: DATETIME
     - `ID_Metodo_Pago`: INT, FOREIGN KEY (REFERENCES Metodo_Pago(ID_Metodo_Pago))
     - `Precio_Pagar`: DECIMAL(10, 2)
     - `Fecha_Creacion`: DATETIME, DEFAULT CURRENT_TIMESTAMP

10. **Leccion**
    - Almacena información sobre las lecciones dentro de los cursos.
    - **Campos:** 
      - `ID_Leccion`: INT, PRIMARY KEY, AUTO_INCREMENT
      - `ID_Curso`: INT, FOREIGN KEY (REFERENCES Curso(ID_Curso))
      - `Titulo`: VARCHAR(255)
      - `Descripcion`: VARCHAR(255)
      - `Fecha_Creacion`: DATETIME, DEFAULT CURRENT_TIMESTAMP

11. **MaterialCurso**
    - Almacena los materiales asociados con las lecciones de los cursos.
    - **Campos:** 
      - `ID_Material`: INT, PRIMARY KEY, AUTO_INCREMENT
      - `ID_Leccion`: INT, FOREIGN KEY (REFERENCES Leccion(ID_Leccion))
      - `Tipo`: VARCHAR(50)
      - `URL`: VARCHAR(255)
      - `Fecha_Creacion`: DATETIME, DEFAULT CURRENT_TIMESTAMP

12. **Opinion_Estudiante**
    - Almacena las opiniones y el feedback de los estudiantes sobre los cursos.
    - **Campos:** 
      - `ID_Opinion_Estudiante`: INT, PRIMARY KEY, AUTO_INCREMENT
      - `ID_Estudiante`: INT, FOREIGN KEY (REFERENCES Estudiante(ID_Estudiante))
      - `ID_Comision`: INT, FOREIGN KEY (REFERENCES Comision(ID_Comision))
      - `Fecha`: DATETIME
      - `Calificacion`: INT
      - `Comentario`: VARCHAR(255)
      - `Fecha_Creacion`: DATETIME, DEFAULT CURRENT_TIMESTAMP

## Vistas


### Vista: EstudiantesPorCurso

- **Descripción:** Esta vista muestra el nombre del curso y el número total de estudiantes inscritos en cada curso.
- **Objetivo:** Permite ver la cantidad de estudiantes que están inscritos en cada curso, lo que puede ayudar en la gestión de recursos y planificación de clases.
- **Tablas involucradas:** `Curso`, `Comision`, `Matricula`.

**Columnas:**
- **Curso:** Nombre del curso.
- **TotalEstudiantes:** Número total de estudiantes inscritos en el curso.

**Ejemplo de consulta:**
```sql
SELECT * FROM EstudiantesPorCurso
ORDER BY TotalEstudiantes DESC;
```

## Vista: CalificacionesPromedioPorCurso

- **Descripción:** Esta vista muestra el nombre del curso y la calificación promedio de los estudiantes en cada curso.
- **Objetivo:** Ayuda a evaluar el rendimiento general de los estudiantes en cada curso, lo que puede ser útil para identificar áreas de mejora y ajustar el contenido del curso.
- **Tablas involucradas:** `Curso`, `Comision`, `Opinion_Estudiante`.

**Columnas:**
- **Curso:** Nombre del curso.
- **PromedioCalificacion:** Calificación promedio de los estudiantes en el curso.

**Ejemplo de consulta:**
```sql
SELECT * FROM CalificacionesPromedioPorCurso
ORDER BY PromedioCalificacion DESC;
```

## Vista: ProgresoLeccionesPorCurso

- **Descripción:** Esta vista muestra el nombre del curso, la cantidad total de lecciones en cada curso y la cantidad de materiales disponibles.
- **Objetivo:** Proporciona una visión general del contenido disponible para cada curso, lo que puede ser útil para evaluar el progreso del curso y asegurar que los materiales estén completos.
- **Tablas involucradas:** `Curso`, `Leccion`, `MaterialCurso`.

**Columnas:**
- **Curso:** Nombre del curso.
- **TotalLecciones:** Número total de lecciones en el curso.
- **TotalMateriales:** Número total de materiales disponibles en el curso.

**Ejemplo de consulta:**
```sql
SELECT * FROM ProgresoLeccionesPorCurso
ORDER BY Curso ASC;
```


## Funciones

### Función `contar_cursos_profesor`

- **Descripción:** Cuenta el número de cursos asignados a un profesor.
- **Objetivo:** Permitir la consulta rápida del número de cursos que un profesor está enseñando.
- **Tablas manipuladas:** `Profesor`, `Curso`, `Comision`.


#### Ejemplo

```sql
SELECT contar_cursos_profesor(1);
```

### Función `estudiante_inscrito_curso`

- **Descripción:** Verifica si un estudiante está inscrito en un curso específico.
- **Objetivo:** Facilitar la comprobación de la inscripción de un estudiante en un curso.
- **Tablas manipuladas:** `Estudiante`, `Matricula`, `Comision`.


#### Ejemplo
```sql
SELECT estudiante_inscrito_curso(1, 1);
```

### Función `calificacion_promedio_curso`

- **Descripción:** Calcula la calificación promedio de los estudiantes en un curso específico.
- **Objetivo:** Permitir la evaluación del rendimiento general de los estudiantes en un curso.
- **Tablas manipuladas:** `Comision`, `Opinion_Estudiante`.


#### Ejemplo
```sql
SELECT calificacion_promedio_curso(1);
```

## Procedimientos

### Procedimiento `actualizar_calificacion`

- **Descripción:** Actualiza la calificación de un estudiante en un curso específico.
- **Objetivo:** Permitir la actualización de las calificaciones de los estudiantes.
- **Tablas involucradas:** `Opinion_Estudiante`, `Estudiante`, `Comision`.


#### Ejemplo
```sql
CALL actualizar_calificacion('estudiante@example.com', 'Introducción a SQL', 95.5);
```

### Procedimiento `agregar_leccion`

- **Descripción:** Agrega una nueva lección a un curso específico.
- **Objetivo:** Facilitar la adición de contenido nuevo a los cursos.
- **Tablas involucradas:** `Leccion`, `Curso`.


#### Ejemplo
```sql
CALL agregar_leccion('Introducción a SQL', 'Lección 1: Fundamentos', 'Descripción de los fundamentos de SQL.');
```

### Procedimiento `inscribir_estudiante`

- **Descripción:** Inscribe un estudiante en un curso específico.
- **Objetivo:** Permitir la inscripción de estudiantes en los cursos.
- **Tablas involucradas:** `Matricula`, `Estudiante`, `Comision`.


#### Ejemplo
```sql
CALL inscribir_estudiante('estudiante@example.com', 'Introducción a SQL', 1, 200.00);
```

## Triggers

### Trigger `after_insert_usuario`

- **Descripción:** Almacena un registro en `LOG_CAMBIOS` cuando se inserta un nuevo usuario.
- **Objetivo:** Mantener un registro de las inserciones de nuevos usuarios.
- **Tablas involucradas:** `Usuario`, `LOG_CAMBIOS`.


```sql
-- Insertar un nuevo usuario para activar el trigger
INSERT INTO Usuario (Nombre, Apellido, Correo_Electronico, Contrasena, DNI, Pais_Residencia)
VALUES ('Juan', 'Pérez', 'juan.perez@example.com', 'password123', '12345678', 'Perú');

-- Consultar el log de cambios para ver el registro creado por el trigger
SELECT * FROM LOG_CAMBIOS WHERE tabla_afectada = 'Usuario';
```
### Trigger `before_insert_usuario`

- **Descripción:** Verifica si el correo electrónico de un usuario es único antes de insertar un nuevo usuario.
- **Objetivo:** Garantizar la unicidad del correo electrónico en la tabla `Usuario`.
- **Tablas involucradas:** `Usuario`.

#### Ejemplo
```sql
-- Intentar insertar un usuario con un correo electrónico existente
INSERT INTO Usuario (Nombre, Apellido, Correo_Electronico, Contrasena, DNI, Pais_Residencia)
VALUES ('María', 'López', 'juan.perez@example.com', 'password456', '87654321', 'Perú');

-- Debería mostrar un error: 'El correo electrónico ya está en uso.'
```

### Trigger `before_insert_matricula`

- **Descripción:** Verifica si un estudiante ya está inscrito en una comisión antes de insertar una nueva inscripción.
- **Objetivo:** Evitar duplicidades en las inscripciones de los estudiantes.
- **Tablas involucradas:** `Matricula`.

#### Ejemplo
```sql
-- Intentar insertar una matrícula duplicada
INSERT INTO Matricula (ID_Estudiante, ID_Comision, Fecha_Matricula, ID_Metodo_Pago, Precio_Pagar)
VALUES (1, 1, '2024-01-01', 1, 100.00);

-- Debería mostrar un error: 'El estudiante ya está inscrito en esta comisión.'
```

### Trigger `after_update_calificacion`

- **Descripción:** Almacena un registro en `LOG_CAMBIOS` cuando se actualiza la calificación de un estudiante.
- **Objetivo:** Mantener un registro de las actualizaciones en las calificaciones.
- **Tablas involucradas:** `Opinion_Estudiante`, `LOG_CAMBIOS`.

#### Ejemplo
```sql
-- Actualizar una calificación para activar el trigger
UPDATE Opinion_Estudiante
SET Calificacion = 95
WHERE ID_Opinion_Estudiante = 1;

-- Consultar el log de cambios para ver el registro creado por el trigger
SELECT * FROM LOG_CAMBIOS WHERE tabla_afectada = 'Opinion_Estudiante';
```

## Creación de Roles y Asignación de Usuarios

Este proyecto también incluye la configuración de roles y usuarios para gestionar el acceso a la base de datos `OnlineCourses`. A continuación se detalla la configuración de los roles, los permisos otorgados, y la creación de usuarios.

### Roles Configurados

Se han creado cuatro roles principales que representan diferentes niveles de acceso:

1. **SISTEMA**: 
   - Este rol tiene acceso total a todas las funcionalidades de la base de datos.
   - **Permisos:** Todos los privilegios (`GRANT ALL PRIVILEGES`).

2. **ADMIN**: 
   - Este rol tiene permisos administrativos sobre las tablas principales, así como la capacidad de ejecutar funciones y procedimientos específicos.
   - **Permisos:** 
     - DML (`SELECT`, `INSERT`, `UPDATE`) sobre las tablas `Usuario`, `Curso`, `Categoria`, `Comision`.
     - Ejecución de funciones y procedimientos: `contar_cursos_profesor`, `estudiante_inscrito_curso`, `calificacion_promedio_curso`, `actualizar_calificacion`, `agregar_leccion`, `inscribir_estudiante`.
     - Lectura (`SELECT`) sobre las vistas `EstudiantesPorCurso`, `CalificacionesPromedioPorCurso`, `ProgresoLeccionesPorCurso`.

3. **PROFESOR**: 
   - Este rol tiene permisos para gestionar las lecciones y materiales de los cursos.
   - **Permisos:** 
     - DML (`SELECT`, `INSERT`, `UPDATE`) sobre las tablas `Leccion`, `MaterialCurso`.
     - Ejecución del procedimiento: `agregar_leccion`.
     - Lectura (`SELECT`) sobre las vistas `EstudiantesPorCurso`, `ProgresoLeccionesPorCurso`.

4. **ESTUDIANTE**: 
   - Este rol tiene permisos limitados para consultar y registrar información relacionada con su aprendizaje.
   - **Permisos:** 
     - Lectura (`SELECT`) sobre las tablas `Curso`, `Comision`, `Leccion`, `MaterialCurso`.
     - DML (`SELECT`, `INSERT`) sobre las tablas `Matricula`, `Opinion_Estudiante`.
     - Lectura (`SELECT`) sobre las vistas `EstudiantesPorCurso`, `CalificacionesPromedioPorCurso`.

### Creación de Usuarios y Asignación de Roles

Se han creado los siguientes usuarios, con contraseñas predeterminadas y se les ha asignado uno de los roles configurados:

#### Usuarios del Sistema
- **LeoDI** (Contraseña: `sys123`)
- **JesiB** (Contraseña: `sys456`)

#### Usuarios Administradores
- **AndreC** (Contraseña: `adm01`)
- **FedeZ** (Contraseña: `adm02`)
- **HugoQ** (Contraseña: `adm03`)

#### Usuarios Profesores
- **CrisA** (Contraseña: `dep01`)
- **ReneB** (Contraseña: `dep02`)
- **SantiG** (Contraseña: `dep03`)
- **MatiK** (Contraseña: `dep04`)

#### Usuarios Estudiantes
- **RubenM** (Contraseña: `con01`)
- **LucasN** (Contraseña: `con02`)

### Otorgamiento de Roles

Cada usuario ha sido asignado a uno de los roles según su nivel de acceso. A continuación se muestran los comandos utilizados para otorgar estos roles:

```sql
GRANT 'SISTEMA' TO 'LeoDI'@'%', 'JesiB'@'%';
GRANT 'ADMIN' TO 'AndreC'@'localhost', 'FedeZ'@'localhost', 'HugoQ'@'localhost';
GRANT 'PROFESOR' TO 'CrisA'@'localhost', 'ReneB'@'localhost', 'SantiG'@'localhost', 'MatiK'@'localhost';
GRANT 'ESTUDIANTE' TO 'RubenM'@'localhost', 'LucasN'@'localhost';
```