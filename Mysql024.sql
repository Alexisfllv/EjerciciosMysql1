-- COLUMNAS CALCULADAS

DROP TABLE IF EXISTS libros;
CREATE TABLE libros(
idlibros INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
titulo VARCHAR(40) NOT NULL,
autor VARCHAR(30),
editorial VARCHAR(15),
precio DECIMAL(5,2) UNSIGNED,
cantidad SMALLINT UNSIGNED
);
DESCRIBE libros;
INSERT INTO libros
(titulo,autor,editorial,precio,cantidad)
VALUES
('El aleph','Borges','Planeta',15,100),
('Martin Fierro','Jose Hernandez','Emece',22.20,200),
('Antologia poetica','Borges','Planeta',40,150),
('Aprenda PHP','Mario Molina','Emece',18.20,200),
('Cervantes y el quijote','Borges','Paidos',36.40,100),
('Manual de PHP', 'J.C. Paez', 'Paidos',30.80,100),
('Harry Potter y la piedra filosofal','J.K. Rowling','Paidos',45.00,500),
('Harry Potter y la camara secreta','J.K. Rowling','Paidos',46.00,300),
('Alicia en el pais de las maravillas','Lewis Carroll','Paidos',null,50);

SELECT * FROM libros;

SELECT titulo,cantidad,precio*cantidad FROM libros;
SELECT titulo,precio,precio * 0.1,precio * 1000, precio - (precio*0.1) FROM libros;