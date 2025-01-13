-- renombrar tablas (alter table - rename - rename table) 56

drop table if exists amigos;
drop table if exists contactos;

create table amigos(
  nombre varchar(30),
  domicilio varchar(30),
  telefono varchar (11)
 );
 
 -- cambiar nombre tabla amigos

alter table amigos
rename contactos;

select * from contactos;

show tables;

describe contactos;

insert into contactos
values 
('alexis','lima','121212'),
('ferr','aqp','313131'),
('mayb','luz','232323');

select * from contactos;

-- cambiar nombre contactos a personas
alter table contactos
rename personas;

select * from personas;

show tables;