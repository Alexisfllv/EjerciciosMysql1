DROP TABLE IF EXISTS visitantes;


CREATE TABLE visitantes(
nombre VARCHAR(30),
edad TINYINT UNSIGNED,
sexo CHAR(1),
domicilio VARCHAR(30),
ciudad VARCHAR (20),
telefono VARCHAR(11),
motocompra DECIMAL (6,2)UNSIGNED
);

DESCRIBE visitantes;

-- INSERT
INSERT INTO visitantes
(nombre,edad,sexo,domicilio,ciudad,telefono,motocompra)
VALUES
('Susana Molina',28,'f','Colon 123', 'Cordoba', 'null',45.50),
('Marcela Mercado',36,'f','Avellaneda 345','Cordoba','4545454',0),
('Alberto Garcia',35,'m','Gral. Paz 123','Alta Gracia','03547123456',25),
('Teresa Garcia',33,'f','Gral. Paz 123','Alta Gracia','03547123456',0),
('Roberto Perez',45,'m','Urquiza 335','Cordoba','4123456',33.20),
('Marina Torres',22,'f','Colon 222','Villa Dolores','03544112233',25),
('Julieta Gomez',24,'f','San Martin 333','Alta Gracia','03547121212',53.50),
('Roxana Lopez',20,'f','Triunvirato 345','Alta Gracia',null,0),
('Liliana Garcia',50,'f','Paso 999','Cordoba','4588778',48),
('Juan Torres',43,'m','Sarmiento 876','Cordoba','4988778',15.30);

SELECT * FROM visitantes;

-- cantidad de visitantes de cada ciudad
SELECT ciudad , COUNT(*)
FROM visitantes
GROUP BY ciudad;

-- cantidad de visitantes con telefono que no son nulos
SELECT ciudad,COUNT(telefono) 
FROM visitantes
GROUP BY  ciudad;

-- el total de compras agrupadas por sexo
SELECT sexo , SUM(motocompra)
FROM visitantes
GROUP BY sexo;

-- obtener el valor maximo de compra por sexo
SELECT sexo , MAX(motocompra)
FROM visitantes
GROUP BY sexo;

-- obtener el valor minimo de compra por sexo
SELECT sexo , MIN(motocompra)
FROM visitantes
GROUP BY sexo;

-- aplicar ambos por ser el mismo group
SELECT sexo, MIN(motocompra),MAX(motocompra)
FROM visitantes
GROUP BY sexo;

-- obtener el promedio por ciudad
SELECT ciudad , AVG(motocompra)
FROM visitantes
GROUP BY ciudad;

-- obtener registros y agupados en ciuidad y sexo
SELECT ciudad,sexo, COUNT(*)
FROM visitantes
GROUP BY ciudad,sexo;

-- ciudad que no sea cordoba
SELECT ciudad,COUNT(*) FROM visitantes
WHERE ciudad <> 'cordoba'
GROUP BY ciudad;