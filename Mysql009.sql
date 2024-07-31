-- DROP TABLE , WHERE

DROP TABLE IF EXISTS usuarios;
CREATE TABLE usuarios (
nombre VARCHAR(30),
clave VARCHAR(10)
);

INSERT INTO usuarios
(nombre,clave)
VALUES
('Leonardo','payaso'),
('MarioPerez','Marito'),
('Marcelo','River'),
('Gustavo','River');

DELETE FROM usuarios
WHERE nombre = 'Leonardo';

DELETE FROM usuarios 
WHERE clave = 'River';

SELECT * FROM USUARIOS;

DELETE FROM usuarios;

-- PROBLEMA 1

SELECT * FROM agenda;

DELETE FROM agenda
WHERE  domicilio = 'Lima';

DELETE FROM agenda
WHERE nombre = 'Juan Torres';

DELETE FROM agenda;