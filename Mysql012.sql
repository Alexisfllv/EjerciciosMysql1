-- CAMPO AUTOINCREMENTADO

DROP TABLE IF EXISTS libros;

CREATE TABLE libros (
codigolibro INT AUTO_INCREMENT PRIMARY KEY,
titulo VARCHAR(50),
autor VARCHAR(50),
editorial VARCHAR(25)
);

DESCRIBE libros;

INSERT INTO libros
(titulo,autor,editorial)
VALUES
('El aleph','Borges','Planeta'),
('Martin Fierro','Jose Hernandez','Emece'),
('Aprenda PHP','Mario Molina','Emece'),
('Cervantes y el quijote','Borges','Paidos');

SELECT * FROM libros;

INSERT INTO libros
(codigolibro,titulo,autor,editorial)
VALUES
(8,'eigh','888','saturn');

-- valores negativos
insert into libros (codigolibro,titulo,autor,editorial)
  values(-5,'Alicia a traves del espejo','Lewis Carroll','Planeta');
  
-- valor 0
insert into libros (codigolibro,titulo,autor,editorial)
  values(0,'Alicia en el pais de las maravillas','Lewis Carroll','Planeta');
  
-- PROBLEMA 01
DROP TABLE IF EXISTS medicamentos;

CREATE TABLE medicamentos(
codigomedicamentos INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(20),
laboratorio VARCHAR(20),
precio FLOAT,
cantidad INT
);

INSERT INTO medicamentos
(nombre,laboratorio,precio,cantidad)
VALUES
('Paracetamol','SanIsidro',20.90,700),
('Paracetamol','SanIsidro',20.90,700),
('Paracetamol','SanIsidro',20.90,700),
('Paracetamol','SanIsidro',20.90,700),
('Paracetamol','SanIsidro',20.90,700);

SELECT * FROM medicamentos;
  
  