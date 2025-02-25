-- Subconsultas con in 87

drop table if exists editoriales;
drop table if exists libros;


create table editoriales(
codigo int auto_increment,
nombre varchar(30),
primary key (codigo)
);
 
create table libros (
codigo int auto_increment,
titulo varchar(40),
autor varchar(30),
codigoeditorial smallint,
primary key(codigo)
);

insert into editoriales(nombre) values('Planeta');
insert into editoriales(nombre) values('Emece');
insert into editoriales(nombre) values('Paidos');
insert into editoriales(nombre) values('Siglo XXI');

insert into libros(titulo,autor,codigoeditorial) values('Uno','Richard Bach',1);
insert into libros(titulo,autor,codigoeditorial) values('Ilusiones','Richard Bach',1);
insert into libros(titulo,autor,codigoeditorial) values('Aprenda PHP','Mario Molina',4);
insert into libros(titulo,autor,codigoeditorial) values('El aleph','Borges',2);
insert into libros(titulo,autor,codigoeditorial) values('Puente al infinito','Richard Bach',2);

select * from libros;
select * from editoriales;


-- nombre de las editoriales que han purblicado libros del autor richar bach

select nombre
from editoriales
where codigo in
(select codigoeditorial
from libros
where autor = 'Richard Bach');

-- probamos la subconsulta separada dela consulta exterior para verificar que retorna un lista de valores de un campo

select codigoeditorial
from libros
where autor='Richard Bach';

--

select distinct nombre
from editoriales as e
join libros
on codigoeditorial=e.codigo
where autor='Richard Bach';

-- editoriales que no han publicado libros de Richard Bech

select nombre
from editoriales
where codigo not in
(select codigoeditorial
from libros
where autor = 'Richard Bach');


-- prob 1 , ciudades ,clientes;

drop table if exists ciudades,clientes;

create table ciudades(
codigo int auto_increment,
nombre varchar(20),
primary key (codigo)
);

create table clientes (
codigo int auto_increment,
nombre varchar(30),
domicilio varchar(30),
codigociudad smallint not null,
primary key(codigo)
);

insert into ciudades (nombre) values('Cordoba');
insert into ciudades (nombre) values('Cruz del Eje');
insert into ciudades (nombre) values('Carlos Paz');
insert into ciudades (nombre) values('La Falda');
insert into ciudades (nombre) values('Villa Maria');

insert into clientes(nombre,domicilio,codigociudad) values ('Lopez Marcos','Colon 111',1);
insert into clientes(nombre,domicilio,codigociudad) values ('Lopez Hector','San Martin 222',1);
insert into clientes(nombre,domicilio,codigociudad) values ('Perez Ana','San Martin 333',2);
insert into clientes(nombre,domicilio,codigociudad) values ('Garcia Juan','Rivadavia 444',3);
insert into clientes(nombre,domicilio,codigociudad) values ('Perez Luis','Sarmiento 555',3);
insert into clientes(nombre,domicilio,codigociudad) values ('Gomez Ines','San Martin 666',4);
insert into clientes(nombre,domicilio,codigociudad) values ('Torres Fabiola','Alem 777',5);
insert into clientes(nombre,domicilio,codigociudad) values ('Garcia Luis','Sucre 888',5);


select * from ciudades;

select * from clientes;

-- Necesitamos conocer los nombres de las ciudades de aquellos clientes cuyo domicilio es en calle 
-- "San Martin", empleando subconsulta.

-- nombre ciudad , 

select nombre
from ciudades
where codigo in (select codigociudad from clientes where domicilio like 'San Martin %' );

-- obtenga la misma salida anterior pero empleando join

select distinct ci.nombre
from ciudades as ci
join clientes as cl
on codigociudad=ci.codigo
where domicilio like 'San Martin%'; 

-- Obtenga los nombre de las ciudades de los clientes cuyo apellido no comienza con una letra 

select nombre
from ciudades
where codigo not in
(select codigociudad from clientes where nombre like 'G%' );


select nombre
from ciudades
where codigo not in
(select codigociudad
from clientes
where nombre like 'G%');   

select codigociudad
from clientes
where nombre like 'G%';   