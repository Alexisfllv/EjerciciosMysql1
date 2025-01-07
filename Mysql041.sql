
-- index de tipo pk

drop table if exists libros;


create table libros(
  codigo int unsigned auto_increment,
  titulo varchar(40) not null,
  autor varchar(30),
  editorial varchar(15),
  primary key(codigo)
 );
 
 
 show index from libros;

-- alumnos

drop table if exists alumnos;

create table alumnos(
  legajo varchar(4) not null,
  documento char(8) not null,
  apellido varchar(30),
  nombre varchar(30),
  domicilio varchar(30),
  primary key (legajo)
 );
 
  show index from alumnos;
