-- RECUPERACION DE VISTAS CAMPOS SELECT

DROP TABLE IF EXISTS libros;
-- CREAR
CREATE TABLE libros (
titulo VARCHAR(100),
autor VARCHAR(30),
editorial VARCHAR(15),
precio FLOAT,
cantidad INT
);

-- INSERTAR
INSERT INTO libros
(titulo,autor,editorial,precio,cantidad)
VALUES
('Campanas','Alexis','Luces',29.99,20),
('El aleph','Borges','Emece',45.50,100),
('Alicia en el pais de las maravillas','Lewis Carroll','Planeta',25,200),
('Matematica estas ahi','Paenza','Planeta',15.8,200);

-- RECUPERAR
SELECT * FROM libros;

-- RECUPERAR 
SELECT * FROM libros 
WHERE autor = 'Alexis';

SELECT * FROM libros
WHERE cantidad = 200;

SELECT titulo , autor FROM libros;


-- PROBLEMA peliculas

DROP TABLE IF EXISTS peliculas;

CREATE TABLE peliculas(
titulo VARCHAR(20),
actor VARCHAR(20),
duracion INT,
cantidad INT
);

INSERT INTO peliculas 
(titulo, actor, duracion, cantidad)
VALUES 
('Mision imposible','Tom Cruise',120,3),
('Mision imposible 2','Tom Cruise',180,2),
('Mujer bonita','Julia R.',90,3),
('Elsa y Fred','China Zorrilla',90,2);

SELECT * FROM peliculas;

SELECT titulo FROM peliculas;

SELECT cantidad,duracion,actor FROM peliculas;

SELECT * FROM peliculas
WHERE duracion = 180;