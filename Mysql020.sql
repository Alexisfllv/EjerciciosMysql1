-- Valores por defecto., NULL , NOT NULL 20

DROP TABLE IF EXISTS carro;
CREATE TABLE carro(
idcarro INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(20)NOT NULL,
modelo VARCHAR(20),
precio FLOAT NOT NULL
);

DESCRIBE carro;
INSERT INTO carro
(nombre,precio)
VALUES
('FERRARI',199.20);
SELECT * FROM carro;
--
INSERT INTO carro
(precio)
VALUES
(199.20);
SELECT * FROM carro;