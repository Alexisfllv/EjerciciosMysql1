-- TIPOS DE DATOS DATE/TIME/timeStamp

DROP TABLE IF EXISTS compra;

CREATE TABLE compra (
idcompra INT AUTO_INCREMENT PRIMARY KEY,
fechaams DATE,            -- Fecha en formato 'YYYY-MM-DD'.
fechahora TIME,            -- Hora en formato 'HH:MM:SS'.
fechath DATETIME,        -- Combinación de fecha y hora en formato 'YYYY-MM-DD HH:MM:SS'.
fechahoy TIMESTAMP ,       -- Marca de tiempo que representa la fecha y hora UTC de la última modificación actual
fechaann YEAR  
);

DESCRIBE compra;

-- '2024-02-18 12:34:56'
INSERT INTO compra
(fechaams,fechahora,fechath,fechahoy,fechaann)
VALUES
('2024-01-18','12:12:12','2024-01-18 12:12:12',CURRENT_TIMESTAMP,'2024');

SELECT * FROM compra;