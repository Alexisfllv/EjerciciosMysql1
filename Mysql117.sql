-- Tablas Temporales (TEMPORARY TABLE) 117

-- no tiene referencias , fk 
-- Crear tabla temporal para almacenar pedidos del día
CREATE TEMPORARY TABLE temp_pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente VARCHAR(50),
    producto VARCHAR(50),
    cantidad INT
);

-- Insertar algunos pedidos de prueba
INSERT INTO temp_pedidos (cliente, producto, cantidad) VALUES 
('Alexis', 'Laptop', 1),
('Carlos', 'Mouse', 2),
('Sofía', 'Teclado', 1);

-- Verificar datos insertados
SELECT * FROM temp_pedidos;
