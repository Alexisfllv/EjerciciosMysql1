-- Alias   as 38

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

insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
  values ('Lopez Marcos', 'Colon 111', 'Córdoba','Cordoba','null');
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
  values ('Perez Ana', 'San Martin 222', 'Cruz del Eje','Cordoba','4578585');
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
  values ('Garcia Juan', 'Rivadavia 333', 'Villa Maria','Cordoba','4578445');
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
  values ('Perez Luis', 'Sarmiento 444', 'Rosario','Santa Fe',null);
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono) 
  values ('Pereyra Lucas', 'San Martin 555', 'Cruz del Eje','Cordoba','4253685');
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
  values ('Gomez Ines', 'San Martin 666', 'Santa Fe','Santa Fe','0345252525');
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
  values ('Torres Fabiola', 'Alem 777', 'Villa del Rosario','Cordoba','4554455');
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
  values ('Lopez Carlos', 'Irigoyen 888', 'Cruz del Eje','Cordoba',null);
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
  values ('Ramos Betina', 'San Martin 999', 'Cordoba','Cordoba','4223366');
 insert into clientes (nombre,domicilio,ciudad,provincia,telefono)
  values ('Lopez Lucas', 'San Martin 1010', 'Posadas','Misiones','0457858745');
select * from clientes;

-- obtener el total de registros que no tienen valor nulo en los telefono , uso de alias

select
count(*) as registros
from clientes
where telefono is not null;

select 
count(telefono) as 'con telefono'
from clientes;

-- muestre cantidad de clientes que se apellidan Perez , colocando un alias para dicha salida;

select 
count(nombre) as "llevan Perez"
from clientes
where nombre like "%Perez%";

-- obtener la cantidad de ciudades distintas por provincia las cuales hay cleintes , coloque alias

select
count(distinct ciudad) as "cantidades de ciudades disintas"
from clientes;









