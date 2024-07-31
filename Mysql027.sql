-- FUNCIONES DEL USO DE LA FECHA Y HORA

DROP TABLE IF EXISTS prestamos;

CREATE TABLE prestamos(
titulo VARCHAR(8) NOT NULL,
documento CHAR(8) NOT NULL,
fechaprestamo DATE NOT NULL,
fechadevolucion DATE,
devuelto CHAR(1) DEFAULT 'n'
);

DESCRIBE  prestamos;

INSERT INTO prestamos
(titulo,documento,fechaPrestamo,fechaDevolucion)
values 
('12345678','87654321','2006-08-12',DATE_ADD('2006-08-12', INTERVAL 5 DAY)),
('70576713','12345678',CURRENT_DATE,DATE_ADD(CURRENT_DATE,INTERVAL 5 DAY));

SELECT * FROM prestamos;