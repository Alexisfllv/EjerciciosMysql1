-- OPERADORES RERLACIONALES (BETWWEN - IN) 
-- VALORES ENTRE NUMEROS Y TEXTOS

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
('Matematica estas ahi', 'Paenza', 'Paidos',19);

-- vista
SELECT * FROM libros;

SELECT * FROM libros
WHERE 
precio >=20 and precio <=40;

SELECT * FROM  libros
WHERE 
precio BETWEEN 20 AND 40;

-- 
SELECT * FROM libros
WHERE 
autor = 'Borges' OR AUTOR = 'Paenza'; 

SELECT * FROM libros
WHERE
autor IN ('Borges','Paenza');

-- 
SELECT * FROM libros
WHERE 
autor<>'Borges' AND autor<>'Paenza';

SELECT * FROM libros
WHERE
autor NOT IN ('Borges','Paenza');
