-- VALORES NUMERICOS SIN SIGNOS
DROP TABLE IF EXISTS persona;

CREATE TABLE  persona(
IdPersona INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR (20),
edad INT UNSIGNED CHECK(edad > 0),
dinero FLOAT 
);

DESCRIBE persona;

INSERT INTO persona 
(nombre,edad,dinero)
VALUES
('Low',1,-250.90);

SELECT * FROM persona;

-- UNSIGNED = VALORES = 0 >
DROP TABLE IF EXISTS visitantes;

CREATE TABLE visitantes(
idVisitantes INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30),
sexo CHAR CHECK (sexo IN ('m','f')),
domicilio VARCHAR(30),
ciudad VARCHAR(30),
edad INT UNSIGNED
);

DESCRIBE visitantes;

INSERT INTO visitantes
(nombre,sexo,domicilio,ciudad,edad)
VALUES
('Alexis','m','ate','Lima',23);
SELECT * FROM visitantes;