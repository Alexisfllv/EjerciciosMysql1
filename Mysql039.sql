-- Alias   as

drop table if exists libros;

create table libros(
  codigo int unsigned auto_increment,
  titulo varchar(50) not null,
  autor varchar(30),
  editorial varchar(15),
  precio decimal(5,2),
  primary key (codigo)
 );
 
 insert into libros (titulo,autor,editorial,precio)
  values('El aleph','Borges','Planeta',15);
insert into libros (titulo,autor,editorial,precio)
  values('Martin Fierro','Jose Hernandez','Emece',22.20);
insert into libros (titulo,autor,editorial,precio)
  values('Antologia poetica','Borges','Planeta',40);
insert into libros (titulo,autor,editorial,precio)
  values('Aprenda PHP','Mario Molina','Emece',18.20);
insert into libros (titulo,autor,editorial,precio)
  values('Cervantes y el quijote','Borges','Paidos',36.40);
insert into libros (titulo,autor,editorial,precio)
  values('Manual de PHP', 'J.C. Paez', 'Paidos',30.80);
insert into libros (titulo,autor,editorial,precio)
  values('Harry Potter y la piedra filosofal','J.K. Rowling','Paidos',45.00);
insert into libros (titulo,autor,editorial,precio)
  values('Harry Potter y la camara secreta','J.K. Rowling','Paidos',46.00);
insert into libros (titulo,autor,editorial,precio)
  values('Alicia en el pais de las maravillas','Lewis Carroll','Paidos',null);
  
-- 

select 
count(*) as 'Libros de Borges'
from libros
where autor like '%Borges';


select editorial as edit
from libros
group by edit;

select editorial ,
count(*) as cantidad
from libros
group by editorial
order by cantidad;

select editorial ,
count(*) as cantidad
from libros
group by editorial
having cantidad>2;


-- Problema 1 clientes

drop table if exists clientes;

 create table clientes (
  codigo int unsigned auto_increment,
  nombre varchar(30) not null,
  domicilio varchar(30),
  ciudad varchar(20),
  provincia varchar (20),
  telefono varchar(11),
  primary key(codigo)
 );













