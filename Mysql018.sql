-- Tipos de datos (numéricos) 18

DROP TABLE IF EXISTS nubes;
CREATE TABLE nubes(
idnubes INT AUTO_INCREMENT PRIMARY KEY,
valor1 TINYINT NOT NULL,
valor2 SMALLINT NOT NULL,
valor3 MEDIUMINT NOT NULL,
valor4 INT NOT NULL,
valor5 BIGINT NOT NULL,
valor6 FLOAT NOT NULL
);

DESCRIBE nubes;

INSERT INTO nubes 
(valor1,valor2,valor3,valor4,valor5,valor6)
VALUES
(1,2,3,4,5,6.1);
SELECT * FROM nubes;