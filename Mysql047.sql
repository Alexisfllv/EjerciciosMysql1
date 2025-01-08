drop table if exists libros;

create table libros(
  codigo int unsigned auto_increment,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(20),
  precio decimal(5,2) unsigned,
  primary key(codigo)
 );
 
 
insert into libros values(1,'El aleph','Borges','Planeta',23.5);
insert into libros values(2,'Cervantes y el quijote','Borges','Paidos',33.5);
insert into libros 
   values(3,'Alicia a traves del espejo','Lewis Carroll','Planeta',15);
insert into libros 
   values(4,'Alicia en el pais de las maravillas','Lewis Carroll','Planeta',18);
insert into libros values(5,'Martin Fierro','Jose Hernandez','Planeta',34.6);
insert into libros values(6,'Martin Fierro','Jose Hernandez','Emece',45);
insert into libros values(7,'Aprenda PHP','Mario Molina','Planeta',55);
insert into libros values(8,'Java en 10 minutos','Mario Molina','Planeta',45);
insert into libros values(9,'Matematica estas ahi','Paenza','Planeta',12.5);

select * from libros;


select * from libros
order by rand()
limit 5;


select * from libros
where rand() <0.5;


-- problemas alumnos


drop table if exists alumnos;


create table alumnos(
  documento char(8) not null,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  provincia varchar(20),
  primary key(documento)
 );
 
 describe alumnos;
 
insert into alumnos values('22333444','Juan Perez','Colon 123','Cordoba','Cordoba');
 insert into alumnos values('23456789','Ana Acosta','Caseros 456','Cordoba','Cordoba');
 insert into alumnos values('24123123','Patricia Morales','Sucre 234','Villa del Rosario','Cordoba');
 insert into alumnos values('25000333','Jose Torres','Sarmiento 980','Carlos Paz','Cordoba');
 insert into alumnos values('26333444','Susana Molina','Avellaneda 234','Rosario','Santa Fe');
 insert into alumnos values('27987654','Marta Herrero','San Martin 356','Villa del 
Rosario','Cordoba');
 insert into alumnos values('28321321','Marcos Ferreyra','Urquiza 357','Cordoba','Cordoba');
 insert into alumnos values('30987464','Marta Perez','Rivadavia 234','Cordoba','Cordoba');
 
select * from alumnos
order by rand()
limit 3;

select documento,nombre from alumnos 
order by rand() 
limit 3;


-- problema 2 articulos

drop table if exists articulos;


create table articulos(
  codigo int unsigned auto_increment,
  nombre varchar(25) not null,
  descripcion varchar(30),
  precio decimal(6,2) unsigned,
  cantidad tinyint unsigned,
  primary key(codigo)
 );

insert into articulos (nombre, descripcion, precio,cantidad)
  values ('impresora','Epson Stylus C45',400.80,20);
 insert into articulos (nombre, descripcion, precio,cantidad)
  values ('impresora','Epson Stylus C85',500,30);
 insert into articulos (nombre, descripcion, precio,cantidad)
  values ('monitor','Samsung 14',800,10);
 insert into articulos (nombre, descripcion, precio,cantidad)
  values ('teclado','ingles Biswal',100,50);
 insert into articulos (nombre, descripcion, precio,cantidad)
  values ('teclado','español Biswal',90,50);
 insert into articulos (nombre, descripcion, precio,cantidad)
  values ('impresora multifuncion','HP 1410',300,20);
  
  
select * from articulos;
-- tomar 2 articulos al azar 

select * from articulos
order by rand()
limit 2;


