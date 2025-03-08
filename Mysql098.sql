-- Procedimientos almacenados 98

drop table if exists alumnos;

CREATE TABLE alumnos (
id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50),
edad INT
);


INSERT INTO alumnos (nombre, edad) VALUES 
('Juan', 20),
('María', 22),
('Pedro', 19);


select * from alumnos;

delimiter //
create procedure listar_alumnos()
begin
	select * from alumnos;
end //
delimiter ;    

call listar_alumnos();


-- reutilizable y rapido y mas seguro
-- consume mas memoria , no portables