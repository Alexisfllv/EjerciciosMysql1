-- Tipos de datos basicos de una tabla

/**
INT , VARCHAR, CHAR,FLOAT,DOUBLE,DATE,TIME,DATETIME
**/

DROP TABLE IF EXISTS libros;


-- CREAR TABLA LIBROS
CREATE TABLE libros (
titulo VARCHAR(40),
autor VARCHAR(20),
editorial VARCHAR(15),
precio FLOAT,
cantidad INTEGER
)

-- INSERTAR REGISTROS A UNA TABLA
INSERT INTO libros
(titulo,autor,editorial,precio,cantidad)
VALUES
('Wille','Wonka','Metts',19.90,200),
('El aleph','Borges','Emece',45.50,100),
('Alicia en el pais de las maravillas','Lewis Carroll','Planeta',25,200),
('Matematica estas ahi','Paenza','Planeta',15.8,200);

-- RECUPERAR INFORMACIN DE LA TABLA
SELECT * FROM libros;


-- PROBLEMA  A RESOLVER PELICULAS
-- peliculas - nombre20 , actor20,duracion int,cantidad int

DROP TABLE IF EXISTS peliculas;

CREATE TABLE peliculas(
nombre VARCHAR(20),
actor VARCHAR(20),
duracion INT,
cantidad INT
);

INSERT INTO peliculas
(nombre,actor,duracion,cantidad)
VALUES
('Rage','Alexis',200,300),
('Elsa y Fred','China Zorrilla',90,2),
('Mujer bonita','Julia R.',90,3),
('Mision imposible 2','Tom Cruise',180,2);

SELECT * FROM peliculas;

-- PROBLEMA 2 
-- empleados nombre20,documento8,sexo1,domicilo30,sueldobasicoFLOAT,

DROP TABLE IF EXISTS empleados;

CREATE TABLE empleados(
nombre VARCHAR(20),
documento VARCHAR(8),
sexo CHAR(1),
domicilio VARCHAR(30),
sueldobasico FLOAT
);

DESCRIBE empleados;

INSERT INTO empleados
(nombre,documento,sexo,domicilio,sueldobasico)
VALUES
('Alexis','705726','M','LIMA',2900.90),
('Juan Perez','22345678','m','Sarmiento 123',300),
('Ana Acosta','24345678','f','Colon 134',500),
('Marcos Torres','27345678','m','Urquiza 479',800);

SELECT * FROM empleados;