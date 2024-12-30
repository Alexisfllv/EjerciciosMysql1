
DROP TABLE IF EXISTS libros;

CREATE TABLE libros (
codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
titulo VARCHAR(60) not null,
autor VARCHAR(30),
editorial VARCHAR(15),
precio DECIMAL(5,2) UNSIGNED
);

DESCRIBE libros;

INSERT INTO libros (titulo,autor,editorial,precio)
VALUES
('El aleph','Borges','Planeta',15),
('Martin Fierro','Jose Hernandez','Emece',22.20),
('Antologia poetica','Borges','Planeta',40),
('Aprenda PHP','Mario Molina','Emece',18.20),
('Cervantes y el quijote','Borges','Paidos',36.40),
('Manual de PHP', 'J.C. Paez', 'Paidos',30.80),
('Harry Potter y la piedra filosofal','J.K. Rowling','Paidos',45.00),
('Harry Potter y la camara secreta','J.K. Rowling','Paidos',46.00),
('Alicia en el pais de las maravillas','Lewis Carroll','Paidos',null);

SELECT * FROM libros;

-- CANTIDAD DE LIBROS POR EDITORIAL
SELECT editorial, COUNT(*) 
FROM libros
GROUP BY editorial;

-- CANTIDAD DE LIBROS POR EDITORIAL , PERO SOLO CONTANDO QUE SEAN MAYORES A 2
SELECT editorial, COUNT(*) 
FROM libros
GROUP BY editorial
HAVING COUNT(*)>2;

-- EL PROMEDIO DE LOS PRECIOS DE LOS LIBROS AGRUPADOS POR EDITORIAL
SELECT editorial , AVG(precio) 
FROM libros
GROUP BY editorial;

-- EL PROMEDIO DE SOLO QUIENES SUPEREN LOS 25 precio
SELECT editorial , AVG(precio)
FROM libros
GROUP BY editorial
HAVING AVG(precio)>25;


-- REGISTROS AGRUPADOS POR EDITORIAL SIN TENER EN CUENTA LA EDITORIAL planeta
SELECT editorial, COUNT(*)
FROM libros
WHERE editorial<> 'Planeta'
GROUP BY editorial;

SELECT editorial, COUNT(*)
FROM libros
GROUP BY editorial
HAVING editorial<>'Planeta';

-- Cantidad de libros , sin tener en cuenta los que tienen precio nulo ,
-- agrupados por editorial , rechanzando los de editorial planeta

select 
editorial,
count(*) as cantidadLibros
from libros
WHERE precio is not null
group by editorial
having editorial <> "Planeta";

-- promedio de precios agrupados por editorial , 
-- de las editoriales que tienen mas de 2 libros

select 
editorial,
avg(precio) as precios
from libros
group by editorial
having count(*) >2;

-- mayor valor de los libros , agrupados por editorial , luego seleccionar las filas
-- que tengan un valor mayor o igual a 30

select
editorial,
max(precio)
from libros
group by editorial
having max(precio) >= 30;

-- alias
select
editorial,
max(precio) as mayor
from libros
group by editorial
having mayor >= 30;




