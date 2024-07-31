-- CLAVE PRIMARIA

DROP TABLES IF EXISTS usuarios;

CREATE TABLE usuarios(
nombre VARCHAR(20),
clave VARCHAR(10),
PRIMARY KEY (nombre)
);

INSERT INTO usuarios (nombre, clave)
VALUES 
('Leonardo','dem');


SELECT * FROM usuarios;

DESCRIBE usuarios;

DELETE FROM usuarios;


-- CLIENTES EL PRIMARY KEY NO PUEDE REPETIRSE EN EL REGISTRO DE OTRA TABLA
DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes(
  documento VARCHAR(8),
  apellido VARCHAR(20),
  nombre VARCHAR(20),
  domicilio VARCHAR(30),
  telefono VARCHAR (11),
  PRIMARY KEY(documento)
 );

INSERT INTO clientes 
(documento,apellido,nombre,domicilio, telefono)
VALUES
('22345678','Perez','Marcos','Colon 123','4545454'),
('23222222','Garcia','Ana','Avellaneda 1345','4252652'),
('20454545','Lopez','Susana','Urquiza 344','4522525'),
('35454545','Lopez','Susana','Urquiza 344','4522525');

SELECT * FROM clientes;

INSERT INTO clientes 
(documento,apellido,nombre,domicilio, telefono)
VALUES
('22345678','Perez','Marcos','Colon 123','4545454');
