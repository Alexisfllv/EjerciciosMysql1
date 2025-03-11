-- Procedimientos almacenados (parámetros de salida) 101

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
values ('Antología','Borges','Paidos',24);
insert into libros (titulo,autor,editorial,precio) 
values ('Java en 10 minutos','Mario Molina','Siglo XXI',45);
insert into libros (titulo,autor,editorial,precio) 
values ('Cervantes y el quijote','Borges- Casares','Planeta',34);

select * from libros;

-- prod
drop procedure if exists pa_autor_sumaypromedio;

delimiter //
create procedure pa_autor_sumaypromedio
(
in p_autor varchar(30),
out suma decimal(6,2),
out promedio decimal(6,2)
)
begin
 select titulo, editorial,precio
 from libros
 where autor = p_autor;
 
 select sum(precio) into suma
 from libros
 where autor = p_autor;
 
 select avg(precio) into promedio
 from libros
 where autor = p_autor;

end //
delimiter ;

call pa_autor_sumaypromedio('Richard Bach', @suma , @promedio);

select @suma;
select @promedio,@s;


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
insert into empleados values('22333333','Luis','Lopez',700,0,'Contaduria');
insert into empleados values ('22444444','Marta','Perez',500,1,'Sistemas');
insert into empleados values('22555555','Susana','Garcia',400,2,'Secretaria');
insert into empleados values('22666666','Jose Maria','Morales',1200,3,'Secretaria');

select * from empleados;


-- proc pa_seccion1

drop procedure if exists pa_seccion1;

-- nombre seccion 
-- promedio de sueldos de empleados de la seccion
-- valor mayor del sueldo de esa seccion

delimiter //
create procedure pa_seccion1(
in i_seccion varchar(20),
out o_salidaseccion decimal(6,2),
out o_maximosueldo decimal(6,2)
)
begin
	select 
    avg(sueldo) into o_salidaseccion 
    from empleados
    where seccion = i_seccion;
    
    select max(sueldo) into o_maximosueldo
    from empleados
    where seccion = i_seccion;
    
end //
delimiter ;

call pa_seccion1('Contaduria',@o_salidaseccion, @o_maximosueldo);

select @o_salidaseccion;
select @o_maximosueldo;
