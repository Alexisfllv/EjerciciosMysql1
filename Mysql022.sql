-- ATRIBUTO DEFAULT

DROP TABLE IF EXISTS mascota;

CREATE TABLE mascota(
idmascota INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(20) DEFAULT ('michiel'),
tall VARCHAR(10)
);

DESCRIBE mascota;

INSERT INTO mascota
(tall)
VALUES
('componente');

SELECT * FROM mascota;

-- SE PUEDE REESCRIBIR
-- SE PUEDE INGRESAR COMO NULL
-- DATO VACIO SE GENERA COMO DEFAULT