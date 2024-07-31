-- BUSQUEDA POR LIKE / NOT LIKE

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

-- 
SELECT * FROM libros
WHERE
autor = 'Borges';


-- Texto que integra la pabra %texto%
SELECT * FROM libros
WHERE 
autor LIKE '%Borges%';

-- Texto que inicia con el texto - texto%
SELECT * FROM libros
WHERE 
titulo LIKE 'a%';

-- Texto que termina con el texto - %texto
SELECT * FROM libros
WHERE 
titulo LIKE '%e';

-- que no contega el texto % %
SELECT * FROM libros
WHERE
autor NOT LIKE '%borges%';