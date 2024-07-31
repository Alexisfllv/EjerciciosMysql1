-- CONTAR REGISTROS (COUNT)
DROP TABLE IF EXISTS libros;

CREATE TABLE libros(
codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
titulo VARCHAR(40),
autor VARCHAR(30),
editorial VARCHAR(15),
precio DECIMAL(5,2)
);

INSERT INTO libros
(titulo,autor,editorial,precio)
VALUES
('El aleph','Borges','Planeta',15.50),
('Martin Fierro','Jose Hernandez','Emece',22.90),
('Martin Fierro','Jose Hernandez','Planeta',39),
('Aprenda PHP','Mario Molina','Emece',19.50),
('Cervantes y el quijote','Borges','Paidos',35.40),
('Matematica estas ahi', 'Paenza', 'Paidos',19),
('Harry Potter y la piedra filosofal','J.K. Rowling','Paidos',45.00),
('Harry Potter y la camara secreta','J.K. Rowling','Paidos',46.00),
('Alicia en el pais de las maravillas','Lewis Carroll','Paidos',36.00);

SELECT * FROM libros;
-- contar los registros de la tabla libros
SELECT COUNT(*) FROM libros;

-- contar todos los registros en donde editorial tenga = texto
SELECT COUNT(*) FROM libros
WHERE
editorial='planeta';

-- contar todos los registros donde contenga el texto %txt%
SELECT COUNT(*) FROM libros 
WHERE
autor LIKE '%Borges%';

-- contar los registros donde autor no sea nulo
SELECT COUNT(autor) FROM libros;
