--  Procedimientos almacenados (crear - ejecutar) 99


-- libros

drop table if exists libros;

create table libros(
codigo int auto_increment,
titulo varchar(40),
autor varchar(30),
editorial varchar(20),
precio decimal(5,2),
stock int,
primary key(codigo)
);

insert into libros(titulo,autor,editorial,precio,stock) 
values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',20.00, 9);
insert into libros(titulo,autor,editorial,precio,stock)
values('Alicia en el pais de las maravillas','Lewis Carroll','Plaza',35.00, 50);
insert into libros(titulo,autor,editorial,precio,stock)
values('Aprenda PHP','Mario Molina','Siglo XXI',40.00, 3);
insert into libros(titulo,autor,editorial,precio,stock)
values('El aleph','Borges','Emece',10.00, 18);
insert into libros(titulo,autor,editorial,precio,stock)
values('Ilusiones','Richard Bach','Planeta',15.00, 22);
insert into libros(titulo,autor,editorial,precio,stock)
values('Java en 10 minutos','Mario Molina','Siglo XXI',50.00, 7);
insert into libros(titulo,autor,editorial,precio,stock)
values('Martin Fierro','Jose Hernandez','Planeta',20.00, 3);
insert into libros(titulo,autor,editorial,precio,stock)
values('Martin Fierro','Jose Hernandez','Emece',30.00, 70);
insert into libros(titulo,autor,editorial,precio,stock)
values('Uno','Richard Bach','Planeta',10.00, 120);

select * from libros;

-- procedimiento pa_libros_limite_stock();

delimiter //
create procedure pa_libros_limite_stock()
begin
	select * from libros
    where stock <= 10;
end //
delimiter ;

drop procedure if exists st_libros_precios_bajos;

call pa_libros_limite_stock();


-- llamar a st creado
call st_libros_precios_bajos();

-- prob1 , empleados

drop table if exists empleados;

create table empleados(
documento char(8),
nombre varchar(20),
apellido varchar(20),
sueldo decimal(6,2),
cantidadhijos int,
seccion varchar(20),
primary key(documento)
);


insert into empleados values('22222222','Juan','Perez',300,2,'Contaduria');
insert into empleados values('22333333','Luis','Lopez',300,0,'Contaduria');
insert into empleados values ('22444444','Marta','Perez',500,1,'Sistemas');
insert into empleados values('22555555','Susana','Garcia',400,2,'Secretaria');
insert into empleados values('22666666','Jose Maria','Morales',400,3,'Secretaria');


select * from empleados;


drop procedure if exists pa_empleados_sueldo;

select nombre,apellido,sueldo
from empleados;

delimiter //
create procedure pa_empleados_sueldo()
begin
	select nombre,apellido,sueldo
	from empleados;
end //
delimiter ;


call pa_empleados_sueldo();


--
drop procedure if exists pa_empleados_hijos;

delimiter //
create procedure pa_empleados_hijos()
begin
	select * from empleados
    where cantidadhijos >2;
	
end //
delimiter ;

call pa_empleados_hijos();


update empleados set cantidadhijos=1 where documento='22666666';




















