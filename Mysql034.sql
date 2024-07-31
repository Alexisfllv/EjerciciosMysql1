-- FUNCIONES DE AGRUPAMIENTO
-- COUNT , MAX , MIN ,SUM , AVG

DROP TABLE IF EXISTS libros;

CREATE TABLE libros(
codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
titulo VARCHAR(40) NOT NULL,
autor VARCHAR(30),
editorial VARCHAR(15),
precio DECIMAL(5,2),
cantidad MEDIUMINT UNSIGNED
);

INSERT INTO libros 
(titulo,autor,editorial,precio,cantidad)
VALUES
('El aleph','Borges','Planeta',15,100),
('Martin Fierro','Jose Hernandez','Emece',22.20,200),
('Antologia poetica','J.L. Borges','Planeta',40,150),
('Aprenda PHP','Mario Molina','Emece',18.20,200),
('Cervantes y el quijote','Bioy Casares- J.L. Borges','Paidos',36.40,100),
('Manual de PHP', 'J.C. Paez', 'Paidos',30.80,120),
('Harry Potter y la piedra filosofal','J.K. Rowling','Paidos',45.00,50),
('Harry Potter y la camara secreta','J.K. Rowling','Paidos',46.00,100),
('Alicia en el pais de las maravillas','Lewis Carroll','Paidos',null,200);

SELECT * FROM libros;

-- SUMAR TODA LA CANTIDAD DE TA LA TABLA LIBROS 
SELECT SUM(cantidad) FROM libros;

-- SUMAR TODA LA CANTIDAD DE LIBROS ,LA COLUMNA EDITORIAL SEA 'TEXTO';
SELECT SUM(cantidad) FROM libros
WHERE
editorial = 'planeta';

-- BUSCAR EL MAXIMO VALOR DE PRECIO
SELECT MAX(precio) FROM libros;

-- LISTAR PRECIO EN ORDEN DESCENDIENTE
SELECT * FROM libros
ORDER BY precio DESC;

-- BUSCAR EL MINIMO PRECIO Y QUE EN AUTORR CONTEGA LA PALBRA %txt%
SELECT MIN(precio) FROM libros
WHERE
autor LIKE '%Rowling%';

-- BUSCAR EN LA TABLA LIBROS POR EL %TXT% Y ORDENADO SEGUN LA COLUMNA 5
SELECT * FROM libros
WHERE
autor LIKE '%Rowling%'
ORDER BY 5;

-- BUSCAR EL PROMEDIO DE PRECIO DE LA TABLA LIBRO DONDE TITULO CONTENGA %TXT%
SELECT AVG(precio) FROM libros
WHERE titulo LIKE '%PHP%';

-- BUSCAR LA CANTIDAD DE FILAS DE UN CAMPO EN LA TABLA LIBROS //no cuenta nulos
SELECT COUNT(precio) FROM libros;
