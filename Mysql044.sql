-- borrar index


drop table if exists libros;


create table libros(
  codigo int unsigned auto_increment,
  titulo varchar(40) not null,
  autor varchar(30),
  editorial varchar(15),
  primary key (codigo),
  index i_editorial (editorial),
  unique i_tituloeditorial (titulo,editorial)
 );
 
show index from libros;
describe libros;


-- eliminar index
drop index i_editorial on libros;


-- eliminar unique
drop index i_tituloeditorial on libros;


-- problemas 1 alumno

drop table if exists alumnos;


create table alumnos(
  anio year not null,
  numero int unsigned not null,
  nombre varchar(30),
  documento char(8) not null,
  domicilio varchar(30),
  ciudad varchar(20),
  provincia varchar(20),  
  primary key(anio,numero),
  unique i_documento (documento),
  index i_ciudadprovincia (ciudad,provincia)
);
 
describe alumnos;

show index from alumnos;
 
 
 -- problema 2 consultas
 
drop table if exists consultas;


create table consultas(
  fecha date,
  numero int unsigned,
  documento char(8) not null,
  obrasocial varchar(30),
  medico varchar(30),
  primary key(fecha,numero),
  unique i_consulta(documento,fecha,medico),
  index i_medico (medico),
  index i_obrasocial (obrasocial)
 );

show index from consultas;
 
 
drop index i_consulta on consultas;

drop index i_medico on consultas;
 
drop index i_obrasocial on consultas;

describe consultas;

 
 
 