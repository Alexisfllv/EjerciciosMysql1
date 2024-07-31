-- TIPO TEXT , ALMACENA CANTIDAD DE TEXTO GRANDE

DROP TABLE IF EXISTS autos;
CREATE TABLE autos(
idauto INT AUTO_INCREMENT PRIMARY KEY,
marca VARCHAR(20),
modelo VARCHAR(20),
especificacion TEXT,
precio FLOAT UNSIGNED
);

DESCRIBE autos;
INSERT INTO autos 
(marca,modelo,especificacion,precio)
VALUES
('Ferrari','LaFerrari','iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii',1500.20);

SELECT * FROM autos;