-- Borrado de índices (alter table - drop index) 55


drop table if exists libros;

create table libros(
  codigo int unsigned auto_increment,
  titulo varchar(40) not null,
  autor varchar(30),
  editorial varchar(15),
  primary key(codigo),
  index i_editorial (editorial),
  unique i_tituloeditorial (titulo,editorial)
 );
 
show index from libros;


--  borrar index comun i_editorial (editorial)

alter table libros
drop index i_editorial;
 
show index from libros;

-- borrar index unico i_tituloeditorial

alter table libros
drop index i_tituloeditorial;

show index from libros;


-- problema tabla alumnos

drop table if exists alumnos;


create table alumnos(
  año year not null,
  numero int unsigned not null,
  nombre varchar(30),
  documento char(8) not null,
  domicilio varchar(30),
  ciudad varchar(20),
  provincia varchar(20),  
  primary key(año,numero),
  unique i_documento (documento),
  index i_ciudadprovincia (ciudad,provincia)
 );
 
 describe alumnos;
 
show index from alumnos; 
 
-- eliminar indice unico

alter table alumnos
drop index i_documento;

show index from alumnos;

--  eliminar indice comun

alter table alumnos
drop index i_ciudadprovincia;

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


describe consultas;

show index  from consultas;

-- eliminar indices unicos
alter table consultas
drop index i_consulta;

show index from consultas;

-- eliminar indices comunes
alter table consultas
drop index i_medico;

alter table consultas
drop index i_obrasocial;

-- view
show index from consultas;

describe consultas;