-- Chequear y reparar tablas (check - repair) 83


drop table if exists libros;

create table libros(
codigo int unsigned auto_increment,
titulo varchar(40),
autor varchar(30),
precio decimal(5,2) unsigned,
primary key(codigo)
);

-- ver el estado de la tabla
check table libros;


-- ver datos principales de la tabla
SHOW TABLE STATUS WHERE Name = 'libros';


-- chekeo rapido 
check table libros fast quick;


-- con innodb no se puede usar repair
ALTER TABLE libros ENGINE=InnoDB;


-- 
