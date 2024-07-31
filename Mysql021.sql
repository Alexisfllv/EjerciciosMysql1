-- INGRESO DE CAMPOS EN VALORES INVALIDOS
-- Creación de la tabla 'ejemplo' con diferentes tipos de datos
CREATE TABLE ejemplo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    texto VARCHAR(255),
    entero INT,
    decim DECIMAL(10,2),
    booleano BOOLEAN
);

-- Intento de inserción de un texto inválido en el tipo de dato VARCHAR
-- Intentamos insertar un texto más largo que el tamaño máximo permitido (255 caracteres)
INSERT INTO ejemplo (texto) VALUES ('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sollicitudin mauris id sapien elementum, ut rutrum odio rhoncus.');

-- Intento de inserción de un valor no numérico en el tipo de dato INT
-- Intentamos insertar un valor de texto en una columna INT
INSERT INTO ejemplo (entero) VALUES ('Texto no numérico');

-- Intento de inserción de un valor decimal inválido en el tipo de dato DECIMAL
-- Intentamos insertar un valor con más de dos decimales
INSERT INTO ejemplo (decim) VALUES (123.456);

-- Intento de inserción de un valor booleano inválido en el tipo de dato BOOLEAN
-- Intentamos insertar un valor que no es un booleano
INSERT INTO ejemplo (booleano) VALUES ('Verdadero');

-- Creación de la tabla 'ejemplo' con diferentes tipos de datos
CREATE TABLE ejemplo2 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE,
    hora TIME,
    fecha_hora DATETIME,
    marca_tiempo TIMESTAMP,
    año YEAR
);

-- Intento de inserción de una fecha inválida en el tipo de dato DATE
-- Intentamos insertar el 30 de febrero, lo cual es inválido
INSERT INTO ejemplo2 (fecha) VALUES ('2024-02-30');

-- Intento de inserción de una hora inválida en el tipo de dato TIME
-- Intentamos insertar una hora mayor a 23:59:59, lo cual es inválido
INSERT INTO ejemplo2 (hora) VALUES ('24:00:00');

-- Intento de inserción de una fecha y hora inválidas en el tipo de dato DATETIME
-- Intentamos insertar el 30 de febrero a las 25:00:00, lo cual es inválido
INSERT INTO ejemplo2 (fecha_hora) VALUES ('2024-02-30 25:00:00');

-- Intento de inserción de un valor inválido para TIMESTAMP
-- Esto generará un error similar al caso de DATETIME
INSERT INTO ejemplo2 (marca_tiempo) VALUES ('2024-02-30 25:00:00');

-- Intento de inserción de un valor inválido para YEAR
-- Intentamos insertar un año con solo dos dígitos, lo cual es inválido
INSERT INTO ejemplo2 (año) VALUES ('99');

-- Plantillas de ingreso de datos para valores validos
