-- SQL UPDATE

DROP TABLE IF EXISTS usuarios;

CREATE TABLE usuarios (
nombre VARCHAR(30),
clave VARCHAR(10)
);

INSERT INTO usuarios 
(nombre,clave)
VALUES
('Alexis','1234'),
('MarioPerez','Marito'),
('Marcelo','River'),
('Gustavo','River');

SELECT * FROM usuarios;

-- Actualizar

UPDATE usuarios
SET clave = 'Real';

UPDATE usuarios
SET clave = '1234'
WHERE clave = 'real';

UPDATE usuarios
SET nombre = 'GustavoGarcia'
WHERE nombre = 'Gustavo';

-- PROBLEMA 1 AGENDA

DROP TABLE IF EXISTS agenda;
CREATE TABLE agenda(
apellido VARCHAR(30),
nombre VARCHAR(20),
domicilio VARCHAR(30),
telefono VARCHAR(11)
);

INSERT INTO agenda
(apellido,nombre,domicilio,telefono)
VALUES
('Mores','Alberto','Colon123','3244343'),
('Torres','Juan','Avellaneda123','123333'),
('Lopez','Jose','Urquiza333','4545454'),
('Lopez','Jose','Arte','3433434'),
('Peralta','Susana','Gral','93939339');

SELECT * FROM agenda;

UPDATE agenda
SET telefono = '111';

UPDATE agenda
SET nombre = 'Josefina'
WHERE nombre = 'Jose';

-- 2
SELECT * FROM libros;

UPDATE libros
SET precio = 20.10
WHERE precio = 19.90;

UPDATE libros
SET precio = 50
WHERE autor = 'Borges';

-- 3
SELECT * FROM articulos;

UPDATE articulos 
SET nombre = 'Pad'
WHERE precio = 90;

UPDATE articulos
SET cantidad = 200
WHERE nombre = 'impresora';