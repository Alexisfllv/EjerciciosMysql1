-- REGEXP patrones de busqueda SELECT 
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

-- si REG contiene la letra 'TEXTO'
SELECT  * FROM libros
WHERE 
titulo REGEXP 'ma';

-- listado de reg valor si H o K o W
SELECT * FROM libros
WHERE
autor REGEXP '[hkw]';

-- listado de reg valor no en  H o K o W
SELECT * FROM libros
WHERE
autor NOT REGEXP '[hkw]';

-- Busqueda REG desde texto - texto
SELECT * FROM libros
WHERE
autor REGEXP '[b-d]';

-- Busqueda de texto que empiezan con texto
SELECT * FROM libros
WHERE
autor REGEXP '^b';

-- Busqueda de texto que termina  con texto
SELECT * FROM libros
WHERE
autor REGEXP 's$';

-- Busqueda de texto que inice con texto.x.texto
SELECT * FROM libros
WHERE
autor REGEXP 'j.s';

-- Busqueda de texto que inice con texto.x.x.texto
SELECT * FROM libros
WHERE
autor REGEXP 'j..e';

-- Busqueda de texto que contengan n caracteres exactos
SELECT * FROM libros
WHERE
autor REGEXP '^......$';

-- Busqueda de texto que contengan n caracteres minimo
SELECT * FROM libros
WHERE
autor REGEXP '.......';

-- Busqueda de texto que contengan 2 letras 'texto' ;
SELECT * FROM libros
WHERE
autor REGEXP 'a.*a';