-- Procedimientos almacenados (parámetros de entrada) 100

-- libros

drop table if exists libros;

create table libros(
codigo int auto_increment,
titulo varchar(40),
autor varchar(30),
editorial varchar(20),
precio decimal(5,2),
primary key(codigo) 
);

insert into libros (titulo,autor,editorial,precio) 
values ('Uno','Richard Bach','Planeta',15);
insert into libros (titulo,autor,editorial,precio) 
values ('Ilusiones','Richard Bach','Planeta',12);
insert into libros (titulo,autor,editorial,precio) 
values ('El aleph','Borges','Emece',25);
insert into libros (titulo,autor,editorial,precio) 
values ('Aprenda PHP','Mario Molina','Nuevo siglo',50);
insert into libros (titulo,autor,editorial,precio) 
values ('Matematica estas ahi','Paenza','Nuevo siglo',18);
insert into libros (titulo,autor,editorial,precio) 
values ('Puente al infinito','Bach Richard','Sudamericana',14);
insert into libros (titulo,autor,editorial,precio) 
values ('Antología','J. L. Borges','Paidos',24);
insert into libros (titulo,autor,editorial,precio) 
values ('Java en 10 minutos','Mario Molina','Siglo XXI',45);
insert into libros (titulo,autor,editorial,precio) 
values ('Cervantes y el quijote','Borges- Casares','Planeta',34);

select * from libros;

drop procedure if exists pa_libros_autor;

delimiter //
create procedure pa_libros_autor(in p_autor varchar(30))
begin
	select titulo , editorial , precio
    from libros
	where autor = p_autor;
end //
delimiter ;

call pa_libros_autor('Richard Bach');

select * from libros;

-- prdo 2 
drop procedure if exists pa_libros_autor_editorial;

delimiter //
create procedure pa_libros_autor_editorial(
in p_autor varchar(30),
in p_editorial varchar(20)
)
begin
	select titulo ,precio
    from libros
    where autor = p_autor and editorial = p_editorial;
end //
delimiter ;

call pa_libros_autor_editorial('Richard Bach', 'Planeta');

call pa_libros_autor_editorial('Borges','Emece');

-- prob 1 , empleados

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

-- listar empleados con suelodo mayor a 200

delimiter //
create procedure pa_empleados_sueldo(in pa_sueldo int)
begin
	select * from empleados
	where sueldo >= pa_sueldo;
end //
delimiter ;



call pa_empleados_sueldo(400);

-- proc 2 : pa_empleados_actualizar_sueldo. , documento, sueldo

drop procedure if exists pa_empleados_actualizar_sueldo;

delimiter //
create procedure pa_empleados_actualizar_sueldo(
in pa_documento varchar(30),
in pa_sueldo decimal(6,3)
)
begin
	update empleados set sueldo = pa_sueldo
	where documento = pa_documento;
end //
delimiter ;


call pa_empleados_actualizar_sueldo('22666666',500);









































