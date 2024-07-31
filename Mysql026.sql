-- FUNCIONES MATEMATICAS 
DROP TABLE IF EXISTS libros;

CREATE TABLE libros(
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(40) NOT NULL,
  autor VARCHAR(30),
  editorial VARCHAR (20),
  precio DECIMAL(5,2)
 );
 
 -- 
INSERT INTO libros 
(titulo,autor,editorial,precio)
VALUES
('El alehp','Borges','Paidos',33.46),
('Alicia en el pais de las maravillas','L. Carroll','Planeta',16.31),
('Alicia a traves del espejo','L. Carroll','Planeta',18.89);

SELECT * FROM libros;

-- CEILING REDONDEA HACIA ABAJO
-- FLOOR REDONDEA HACIA ARRIBA

SELECT titulo, CEILING(precio), FLOOR(precio)
FROM libros;

-- ROUND redondea
SELECT titulo, ROUND(precio)
From libros;

-- TRUNCATE , trunca el los decimales
SELECT titulo , TRUNCATE (precio,1)
FROM libros;
 
 