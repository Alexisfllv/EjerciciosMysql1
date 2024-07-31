-- Eliminar un tabla si existe
DROP TABLE IF EXISTS agenda;

-- Crear tabla agenda
CREATE TABLE agenda(
nombre VARCHAR(20),
docimicilio VARCHAR(30),
telefono VARCHAR(11)
);

DESCRIBE agenda;

SHOW TABLES;

-- Ingresar datos Agenda
INSERT INTO agenda
(nombre,docimicilio,telefono)
VALUES
('Alexis','Lima','98764432');


-- Ver datos de tabla
SELECT * FROM agenda;


-- Modificar una columna de la tabla
ALTER TABLE agenda
CHANGE docimicilio domicilio VARCHAR(33);


-- Ingresar datos Agenda
INSERT INTO agenda
(nombre,domicilio,telefono)
VALUES
('Fawcett','Cuszco','982727222');