-- Disparadores (triggers - insert trigger) 112

drop table if exists ventas,libros;

create table libros(
codigo int auto_increment,
titulo varchar(50),
autor varchar(50),
editorial varchar(30),
precio float, 
stock int,
primary key (codigo)
);

create table ventas(
numero int auto_increment,
codigolibro int,
precio float,
cantidad int,
primary key (numero)
);


insert into libros(titulo, autor, editorial, precio, stock)
values('Uno','Richard Bach','Planeta',15,100);   
insert into libros(titulo, autor, editorial, precio, stock)
values('Ilusiones','Richard Bach','Planeta',18,50);
insert into libros(titulo, autor, editorial, precio, stock)
values('El aleph','Borges','Emece',25,200);
insert into libros(titulo, autor, editorial, precio, stock)
values('Aprenda PHP','Mario Molina','Emece',45,200);

select * from libros;

drop trigger if exists before_ventas_insert;  

delimiter //
create trigger before_ventas_insert
	before insert
	on ventas
	for each row
begin
	update libros set stock = libros.stock - new.cantidad
    where new.codigolibro = libros.codigo;
end //
delimiter ;
    
-- insert
insert into ventas (codigolibro,precio,cantidad)
values (1,15,1);

insert into ventas (codigolibro,precio,cantidad)
values (1,20,20);
    
select * from ventas;

select * from libros;
    
