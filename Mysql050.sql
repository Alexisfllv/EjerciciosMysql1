-- Eliminar campos de una tabla (alter table - drop) 50


drop table if exists libros;

create table libros(
  codigo int unsigned auto_increment,
  titulo varchar(40) not null,
  autor varchar(30),
  editorial varchar (20),
  edicion date,
  precio decimal(5,2) unsigned,
  cantidad int unsigned,
  primary key(codigo)
 );
 
 
describe libros;
 
-- eliminar campo edicion  

alter table libros 
drop edicion; 
 
 
select * from libros;

-- eliminar campos editorial , cantidad

alter table libros
  drop editorial, drop cantidad;
  
describe libros;

-- eliminar campo codigo

alter table libros
  drop codigo;
  
describe libros;


-- problemas 1  peliculas

drop table if exists peliculas;

create table peliculas(
  codigo int unsigned auto_increment,
  nombre varchar(30) not null,
  protagonista varchar(20),
  actorsecundario varchar(20),
  director varchar(25),
  duracion tinyint unsigned,
  primary key(codigo),
  index i_director (director)
 );
 
describe peliculas;


-- ver indices

show index from peliculas;

-- borrar campo director

alter table peliculas
drop director;

describe peliculas;


alter table peliculas
drop actorsecundario , drop duracion;


-- problema 2 peliculas

drop table if exists usuarios;

create table usuarios(
nombre varchar(30),
clave varchar(10)
);

describe usuarios;

-- borrar campo nombre

alter table usuarios
drop nombre;

describe usuarios;

-- borrar unico campo existente

alter table usuarios
drop clave;