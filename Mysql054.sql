-- agregar indices , alter table , add index 54

drop table if exists libros;

create table libros(
  codigo int unsigned,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar (20),
  precio decimal(5,2) unsigned,
  cantidad smallint unsigned
 );
 
describe libros;
 
-- agregar index editorial

alter table libros
add index i_editorial (editorial);

show index from libros;

-- agregar index titulo,editorial

alter table libros
add unique index i_tituloeditorial (titulo,editorial);

show index from libros;

-- problemas 1 alumnos

drop table if exists alumnos;

create table alumnos(
  legajo int unsigned auto_increment,
  nombre varchar(30),
  documento char(8) not null,
  domicilio varchar(30),
  ciudad varchar(20),
  provincia varchar(20),
  primary key(legajo)
 );
 
 describe alumnos;
 
 show index from alumnos;
 
-- agregar index comun ciudad y provincia
alter table alumnos
add index i_ciudadprovincia (ciudad,provincia);


show index from alumnos;

-- agregar index unico documento

alter table alumnos
add  unique index i_documento (documento);

show index from alumnos;

-- problemas 2 consultas

drop table if exists consultas;


create table consultas(
  fecha date,
  numero int unsigned,
  documento char(8) not null,
  obrasocial varchar(30),
  medico varchar(30),
  primary key(fecha,numero)
 );

show index from consultas;
 
 
-- convertir indice unico para documento,fecha,medico

alter table consultas
add unique index i_consultas(documento,fecha,medico);

show index from consultas;

-- convertir a indice comun medico, obrasocial

alter table consultas
add index i_medico (medico);

show index from consultas;


alter table consultas
add index i_obrasocial (obrasocial);

show index from consultas;







