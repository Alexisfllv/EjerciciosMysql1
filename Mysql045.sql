-- Creacion de indices a tablas existentes create index

drop table if exists libros;


create table libros(
  codigo int unsigned auto_increment,
  titulo varchar(40) not null,
  autor varchar(30),
  editorial varchar(15),
  primary key (codigo)
 );
 
show index from libros;

create index i_editorial on libros (editorial);


show index from libros;


-- problema 1

drop table if exists clientes;

create table clientes (
  documento char (8) not null,
  nombre varchar(30) not null,
  domicilio varchar(30),
  ciudad varchar(20),
  provincia varchar (20),
  telefono varchar(11)
 );
 
 describe clientes;
 
 create index i_ciudadprovincia on clientes (ciudad,provincia);
 
 show index from clientes;
 
 create unique index i_documento on clientes (documento);
 
 show index from clientes;
 
 
-- problema 2 consultas

drop table if exists consultas;

create table consultas(
  fecha date,
  numero int unsigned,
  documento char(8) not null,
  obrasocial varchar(30),
  medico varchar(30)
 );
 
 describe consultas;
 
 
 -- creacion index unico
 
 create unique index i_consulta on consultas(fecha,documento,medico);
 
 show index from consultas;
 
 create index i_medico on consultas(medico);
 
 show index from consultas;
 
 create index i_obrasocial on consultas(obrasocial);
 
 show index from consultas;
 
 
 
 
 