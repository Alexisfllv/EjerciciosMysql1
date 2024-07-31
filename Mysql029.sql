-- OPERADOR LOGICOS  (AND OR NOT)
-- and - y , or - y/o , xor - o , not - no ;


DROP TABLE IF EXISTS libros;

CREATE TABLE libros(
codigo INT UNSIGNED  AUTO_INCREMENT PRIMARY KEY,
titulo VARCHAR(40),
autor VARCHAR(30),
editorial VARCHAR(15),  
precio DECIMAL(5,2)
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

-- y
SELECT * FROM libros
WHERE 
autor = 'Jose Hernandez' AND
editorial = 'emece';

-- y/o
SELECT * FROM libros
WHERE
autor = 'jose' OR
editorial = emece;

-- o
SELECT * FROM libros
WHERE
autor = 'borges' XOR
editorial = 'planeta';

-- not datos que no sean : 
SELECT * FROM libros
WHERE NOT autor = 'borges';


