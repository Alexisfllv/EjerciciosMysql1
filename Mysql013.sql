-- COMANDO TRUNCATE TABLE

DROP TABLE IF EXISTS libros;

CREATE TABLE libros(
lcodigo INT AUTO_INCREMENT PRIMARY KEY,
titulo VARCHAR (30),
autor VARCHAR (30),
editorial VARCHAR(25)
);

INSERT INTO libros
(titulo,autor,editorial)
VALUES
('Renos','Alexis','Luces'),
('Renos','Alexis','Luces'),
('Renos','Alexis','Luces'),
('Renos','Alexis','Luces');

SELECT * FROM libros;

-- DELETE
DELETE FROM libros;

-- TRUNCATE TABLE
TRUNCATE TABLE libros;

-- EJEMPLO
INSERT INTO libros
(titulo,autor,editorial)
VALUES
('Documentos','Fawcett','Cambios');

-- 
DELETE FROM libros
WHERE autor = 'Luis';

--
DELETE FROM libros
WHERE lcodigo > 4;

-- TRUNCATE TABLE SOLO SIRVE PARA REINICIAR TABLAS

