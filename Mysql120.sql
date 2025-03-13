-- Particionamiento de Tablas en MySQL 120

DROP TABLE IF EXISTS ventas_range;


-- RANGE
CREATE TABLE ventas_range (
    id INT NOT NULL,
    fecha DATE NOT NULL,
    monto DECIMAL(10,2),
    PRIMARY KEY (id, fecha)
) PARTITION BY RANGE (YEAR(fecha)) ( 
    PARTITION p1 VALUES LESS THAN (2020),  
    PARTITION p2 VALUES LESS THAN (2022),  
    PARTITION p3 VALUES LESS THAN (2024),  
    PARTITION p4 VALUES LESS THAN MAXVALUE 
);

describe ventas_range;

-- insert
INSERT INTO ventas_range VALUES (1, '2019-05-10', 150.00); -- p1
INSERT INTO ventas_range VALUES (2, '2021-07-15', 300.50); -- p2
INSERT INTO ventas_range VALUES (3, '2023-03-20', 500.75); -- p3

select * from ventas_range;


SELECT * FROM ventas_range PARTITION (p2);

-- LIST

drop table if exists ventas_list;

CREATE TABLE ventas_list (
    id INT NOT NULL,
    region VARCHAR(20) NOT NULL,
    monto DECIMAL(10,2),
    PRIMARY KEY (id, region)
) PARTITION BY LIST COLUMNS(region) ( 
    PARTITION p_norte VALUES IN ('Norte'),  
    PARTITION p_sur VALUES IN ('Sur'),  
    PARTITION p_centro VALUES IN ('Centro'),  
    PARTITION p_otros VALUES IN ('Este', 'Oeste')
);


-- Insertando datos en cada partición
INSERT INTO ventas_list VALUES (1, 'Norte', 200.00); -- p_norte
INSERT INTO ventas_list VALUES (2, 'Sur', 350.00);   -- p_sur
INSERT INTO ventas_list VALUES (3, 'Centro', 400.50);-- p_centro



SELECT * FROM ventas_list PARTITION (p_norte);

-- HASH

DROP TABLE IF EXISTS ventas_hash;

CREATE TABLE ventas_hash (
    id INT NOT NULL,
    fecha DATE NOT NULL,
    monto DECIMAL(10,2),
    PRIMARY KEY (id, fecha)
) PARTITION BY HASH (id) PARTITIONS 4; 
-- Crea 4 particiones automáticas

-- Insertando datos (se distribuyen automáticamente en las particiones)
INSERT INTO ventas_hash VALUES (1, '2022-01-15', 100.00);
INSERT INTO ventas_hash VALUES (2, '2022-02-20', 200.00);
INSERT INTO ventas_hash VALUES (3, '2022-03-10', 300.00);



select * from ventas_hash;


SELECT * FROM ventas_hash PARTITION (p2);


-- KEY

DROP TABLE IF EXISTS ventas_key;

CREATE TABLE ventas_key (
    id INT NOT NULL,
    cliente_id INT NOT NULL,
    monto DECIMAL(10,2),
    PRIMARY KEY (id, cliente_id)
) PARTITION BY KEY(cliente_id) PARTITIONS 3; 
-- Distribuye en 3 particiones

-- Insertando datos (se distribuyen automáticamente)
INSERT INTO ventas_key VALUES (1, 101, 250.00);
INSERT INTO ventas_key VALUES (2, 202, 350.00);
INSERT INTO ventas_key VALUES (3, 303, 450.00);

SELECT * from ventas_key;
SELECT * FROM ventas_key PARTITION (p1);














