-- VALORES NULL / NULOS

DROP TABLE IF EXISTS libros;

CREATE TABLE libros(
codigo  INT AUTO_INCREMENT PRIMARY KEY ,
titulo	VARCHAR(50) ,
autor	VARCHAR(50) ,
editorial	VARCHAR(25) ,
precio FLOAT 
);
DESCRIBE libros;


DROP TABLE IF EXISTS libros;
CREATE TABLE libros(
codigo  INT PRIMARY KEY AUTO_INCREMENT,
titulo	VARCHAR(50) NOT NULL,
autor	VARCHAR(50) ,
editorial	VARCHAR(25) ,
precio FLOAT 
);

DESCRIBE libros;

INSERT INTO libros
(titulo,autor,editorial,precio)
VALUES
('El aleph','Borges','Planeta',null),
('Matematica estas ahi','Paenza','Paidos',0),
('Martin Fierro','Jose Hernandez','',22.50),
('Harry Potter y la piedra filosofal', 'J.K. Rowling',null,30.00);

SELECT * FROM libros;

SELECT * FROM libros
WHERE precio is null;

SELECT * FROM libros
WHERE editorial is null;

SELECT * FROM libros
WHERE editorial = '';


-- EJERCICIO 

DROP TABLE IF EXISTS estructura;

CREATE TABLE estructura (
codigo INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR (20) NOT NULL,
laboratorio VARCHAR (20),
precio	FLOAT,
cantidad	INT
);

DESCRIBE estructura;

INSERT INTO estructura 
(nombre,laboratorio,precio,cantidad)
VALUES
('',NULL,NULL,NULL);

SELECT * FROM  estructura;

INSERT INTO estructura 
(nombre,laboratorio,precio,cantidad)
VALUES
('campo','lima',0,0);
SELECT * FROM  estructura;