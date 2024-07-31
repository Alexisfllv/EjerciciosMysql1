-- OPERACIONES RELACIONALES = <> < < = > > = 
/**
= IGUAL , <> DISTINTO 
**/

DROP TABLE IF EXISTS libros;

CREATE TABLE libros(
titulo VARCHAR(20),
autor varchar(30),
editorial varchar(15),
precio float
);

INSERT INTO libros 
(titulo,autor,editorial,precio)
VALUES
('Discordia','AlexisFawcett','Same',19.90),
('El aleph','Borges','Planeta',12.50),
('Martin Fierro','Jose Hernandez','Emece',16.00),
('Aprenda PHP','Mario Molina','Emece',35.40),
('Cervantes','Borges','Paidos',50.90);

SELECT * FROM libros;

SELECT * FROM libros
WHERE autor <> 'Borges';

SELECT * FROM libros
WHERE precio < 20;

-- PROBLEMA 1 ARTICULOS

DROP TABLE IF EXISTS articulos;
CREATE TABLE IF NOT EXISTS articulos (
codigo INT,
nombre VARCHAR(20),
descripcion VARCHAR(30),
precio FLOAT,
cantidad INT
);

INSERT INTO articulos
(codigo,nombre,descripcion,precio,cantidad)
VALUES
(001,'Carro','Rojo',100,12),
(1,'impresora','Epson Stylus C45',400.80,20),
(2,'impresora','Epson Stylus C85',500,30),
(3,'monitor','Samsung 14',800,10),
(4,'teclado','ingles Biswal',100,50),
(5,'teclado','español Biswal',90,50);

SELECT * FROM articulos;

SELECT * FROM articulos
WHERE precio >= 500;

SELECT * FROM articulos
WHERE cantidad <20;

SELECT * FROM articulos
WHERE precio <>100;

-- tabla peliculas

SELECT * FROM peliculas;

SELECT * FROM peliculas
WHERE duracion <= 90;

SELECT * FROM peliculas
WHERE actor <> 'Tom Cruise';

SELECT * FROM peliculas
WHERE cantidad >2;


-- Tabla Agenda
SELECT * FROM agenda;

SELECT * FROM agenda
WHERE domicilio = 'Lopez';

SELECT * FROM agenda
WHERE nombre <> 'Maria';

SELECT * FROM agenda
WHERE domicilio = 'Lima';

SELECT * FROM agenda
WHERE telefono = '1231313';

