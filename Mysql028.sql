-- CLAUSULA ORDER BY
DROP TABLE IF EXISTS libros;

CREATE TABLE libros(
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(40),
  autor VARCHAR(30),
  editorial VARCHAR(15),
  precio DECIMAL (5,2)
);
DESCRIBE libros;

INSERT INTO libros 
(titulo,autor,editorial,precio)
VALUES
('El aleph','Borges','Planeta',15.50),
('Martin Fierro','Jose Hernandez','Emece',22.90),
('Martin Fierro','Jose Hernandez','Planeta',39),
('Aprenda PHP','Mario Molina','Emece',19.50),
('Cervantes y el quijote','Borges','Paidos',35.40),
('Matematica estas ahi', 'Paenza', 'Paidos',19);

SELECT * FROM libros;

SELECT * FROM libros
ORDER BY precio;

SELECT * FROM libros
ORDER BY autor;

-- SON ORDENADOS POR EL NUMERO DE COLUMNA
SELECT codigo,titulo,autor,editorial,precio FROM libros
ORDER BY 5;

-- ASC = ASCENDETEN 
SELECT codigo,titulo,autor,editorial,precio FROM libros  
ORDER BY editorial ASC;

-- DESC = DESCENDENTE
SELECT * FROM libros
ORDER BY precio DESC; 
