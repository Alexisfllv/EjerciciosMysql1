# SQL - Curso SQLYa (Diego Moiset)

Este repositorio contiene la resolución de todos los ejercicios del curso de SQL de Diego Moiset (SQLYa). Cada tema cubierto incluye ejemplos prácticos y consultas que refuerzan los conceptos clave.

## 📌 Temas cubiertos

### 1️⃣ Fundamentos de SQL

- **SELECT, FROM, WHERE** → Consultas básicas para recuperar datos.
- **ORDER BY, GROUP BY, HAVING** → Ordenamiento y agrupación de datos.
- **Funciones de agregación** → SUM, AVG, COUNT, MIN, MAX.

### 2️⃣ Manipulación de Datos

- **INSERT INTO** → Inserción de datos en tablas.
- **UPDATE, DELETE** → Modificación y eliminación de datos.
- **TRUNCATE** → Vaciar una tabla sin eliminar su estructura.

### 3️⃣ Creación y Gestión de Tablas

- **CREATE TABLE** → Definir nuevas tablas con claves primarias y foráneas.
- **ALTER TABLE** → Modificar la estructura de una tabla (agregar/eliminar columnas).
- **DROP TABLE** → Eliminar una tabla permanentemente.

### 4️⃣ Relaciones y Claves

- **PRIMARY KEY & FOREIGN KEY** → Definición de claves para asegurar la integridad referencial.
- **JOINS** → INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL JOIN.
- **SELF JOIN** → Relación de una tabla consigo misma.

### 5️⃣ Índices y Optimización

- **INDEX** → Creación de índices para mejorar la velocidad de búsqueda.
- **UNIQUE INDEX** → Asegurar valores únicos en columnas específicas.

### 6️⃣ Procedimientos Almacenados y Funciones

- **Stored Procedures** → Creación de procedimientos reutilizables para automatizar tareas.
- **Funciones** → Funciones definidas por el usuario para cálculos específicos.

### 7️⃣ Triggers (Disparadores)

- **BEFORE & AFTER INSERT/UPDATE/DELETE** → Capturar eventos y realizar acciones automáticas.
- **Ejemplo**: Registro de auditoría en una tabla `log_errores` al detectar cambios en `usuarios`.

### 8️⃣ Transacciones y Control de Concurrencia

- **START TRANSACTION, COMMIT, ROLLBACK** → Manejo de transacciones para garantizar la integridad de datos.
- **SAVEPOINT** → Creación de puntos de control dentro de una transacción.

### 9️⃣ Tablas Temporales

- **TEMPORARY TABLES** → Tablas que existen solo durante la sesión actual.
- **Ejemplo**: Creación de una tabla temporal basada en una consulta `SELECT INTO`.

### 🔟 Respaldo y Recuperación de Datos

- **mysqldump** → Copia de seguridad de bases de datos.
- **IMPORT & EXPORT** → Restauración de datos desde un archivo de respaldo.

### 🔢 Particionamiento de Tablas (para Bases de Datos Grandes)

- **RANGE** → Dividir los datos según un rango de valores.
- **LIST** → Particionamiento basado en valores específicos.
- **HASH** → Distribución uniforme de datos usando una función hash.
- **KEY** → Uso de claves primarias para definir particiones.


