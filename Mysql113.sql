--  Disparadores (triggers - delete trigger) 113


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

select * from ventas;

select * from libros;

-- triger de insertar
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

-- trigger de delete

drop trigger if exists before_ventas_delete;

delimiter //
create trigger before_ventas_delete
	before delete
    on ventas
    for each row
begin
	update libros set stock=libros.stock + old.cantidad
    where old.codigolibro = libros.codigo;
end //
delimiter ;

select * from libros;

select * from ventas;


-- insertamos venta
insert into ventas(codigolibro, precio, cantidad) values(1, 15, 1);

select * from libros;

select * from ventas;

select * from libros;


-- la venta con el codigo 1 se elimina entonces el libro regresa a su stock normal
delete from ventas where numero =1;

select * from libros;






























