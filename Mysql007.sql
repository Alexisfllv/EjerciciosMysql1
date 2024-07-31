-- RECUPERAR INFORMACION SELECT WHERE

DROP TABLE IF EXISTS usuarios;

CREATE TABLE usuarios (
nombre VARCHAR(30),
clave VARCHAR(10)
);

DESCRIBE usuarios;

INSERT INTO usuarios 
(nombre , clave)
VALUES
('Alexis','ferarri123'),
('MarioPerez','Marito'),
('Marcelo','bocajunior'),
('Gustavo','bocajunior');

SELECT * FROM usuarios;

SELECT * FROM usuarios
WHERE clave = 'bocajunior';

SELECT nombre FROM usuarios
WHERE clave = 'ferarri123';


--  PROBLEMA agenda

DROP TABLE IF EXISTS agenda;

CREATE TABLE agenda (
nombre VARCHAR(20),
domicilio VARCHAR(30),
telefono VARCHAR(11)
);

INSERT INTO agenda 
(nombre,domicilio,telefono)
VALUES
('Alexis','Lima','948484'),
('Juan Torres','Avellaneda 135','4458787'),
('Mariana Lopez','Urquiza 333','4545454'),
('Fernando Lopez','Urquiza 333','4545454');

SELECT * FROM agenda;

SELECT domicilio FROM agenda 
WHERE nombre = 'Alexis';

-- Problema tabla Libros

DROP TABLE IF EXISTS libros;

CREATE TABLE libros (
 titulo VARCHAR(20),
 autor VARCHAR(30),
 editorial VARCHAR(15)
);

INSERT INTO libros
(titulo,autor,editorial)
VALUES
('El aleph','Borges','Planeta'),
('Martin Fierro','Jose Hernandez','Emece'),
('Aprenda PHP','Mario Molina','Emece'),
('Cervantes','Borges','Paidos');

SELECT * FROM libros;

SELECT * FROM libros
WHERE autor = 'Borges';

SELECT editorial FROM libros
WHERE autor = 'Borges';