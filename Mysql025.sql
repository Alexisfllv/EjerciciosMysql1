-- MANEJOS PARA TEXTOS

DROP TABLE IF EXISTS libros;

CREATE TABLE libros(
codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
titulo VARCHAR(40) NOT NULL,
autor VARCHAR(30),
editorial VARCHAR (20),
precio DECIMAL(5,2) UNSIGNED
)

DESCRIBE libros;
INSERT INTO libros
(titulo,autor,editorial,precio)
VALUES
('El alehp','Borges','Paidos',33.4),
('Alicia en el pais de las maravillas','L. Carroll','Planeta',16);

SELECT * FROM libros;
-- concatenar
SELECT CONCAT_WS(' - ',titulo,autor) FROM libros;
-- extrae el numero de cadenas (x,n)
SELECT LEFT(titulo,15) FROM libros;
-- LowerCase a titulo , UpperCase a editorial
SELECT LOWER(titulo),UPPER(editorial) FROM libros;