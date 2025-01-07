-- Indice de una tabla

drop table if exists ejemplo;

CREATE TABLE ejemplo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100),
    INDEX (email) -- Índice en la columna email
);


INSERT INTO ejemplo (nombre, email) VALUES
('Juan Pérez', 'juan.perez@example.com'),
('María García', 'maria.garcia@example.com'),
('Luis López', 'luis.lopez@example.com'),
('Ana Torres', 'ana.torres@example.com'),
('Pedro Martínez', 'pedro.martinez@example.com');


-- Buscar un registro específico por email
SELECT * FROM ejemplo WHERE email = 'maria.garcia@example.com';


EXPLAIN SELECT * FROM ejemplo WHERE email = 'maria.garcia@example.com';


-- Ordenar resultados por email
SELECT * FROM ejemplo ORDER BY email;
