-- Tipo de dato enum 57

drop table if exists postulantes;


create table postulantes(
  numero int unsigned auto_increment,
  documento char(8),
  nombre varchar(30),
  sexo char(1),
  estudios enum('ninguno','primario','secundario', 'terciario','universitario') not null,
  primary key(numero)
 );


describe postulantes;


insert into postulantes (documento,nombre,sexo,estudios)
  values('22333444','Ana Acosta','f','primario');


select * from postulantes;



-- problemas empleados

drop table if exists empleados;


create table empleados(
  documento char(8),
  nombre varchar(30),
  sexo char(1),
  estadocivil enum('soltero','casado','divorciado','viudo') not null,
  sueldobasico decimal(6,2),
  primary key(documento)
);


-- valor valido

insert into empleados (documento,nombre,sexo,estadocivil,sueldobasico)
values ('22333444','Juan Lopez','m','soltero',300);
insert into empleados (documento,nombre,sexo,estadocivil,sueldobasico)
values ('23333444','Ana Acosta','f','viudo',400);
  
-- valor no valido
insert into empleados (documento,nombre,sexo,estadocivil,sueldobasico)
  values ('25333444','Ana Acosta','f',null,400);

select * from empleados;

-- ingresar valores por indices 1,2,3,4,5...
insert into empleados (documento,nombre,sexo,estadocivil,sueldobasico)
values ('26333444','Luis Perez','m',1,400);


insert into empleados (documento,nombre,sexo,estadocivil,sueldobasico)
values ('1111111','Marcelo Torres','m',1,111);

select * from empleados;

-- condicion de busqueda por texto
select * from empleados
where estadocivil='soltero';

-- condicion de busqueda por indice

select * from empleados
where estadocivil=4;



-- problema 2 viajes

drop table if exists viajes;


create table viajes(
  codigo int unsigned auto_increment,
  nombre varchar(50),
  pension enum ('no','media','completa') not null,
  hotel enum ('1','2','3','4','5'),/* cantidad de estrellas*/
  dias tinyint unsigned,
  salida date,
  precioporpersona decimal(8,2) unsigned,
  primary key(codigo)
 );
 
 describe viajes;
 
 
insert into viajes (nombre,pension,hotel,dias,salida)
values ('Mexico mágico','completa','4',15,'2005-12-01');
insert into viajes (nombre,pension,hotel,dias,salida)
values ('Europa fantastica','media','5',28,'2005-05-10');
insert into viajes (nombre,pension,hotel,dias,salida)
values ('Caribe especial','no','3',7,'2005-11-25');

select * from viajes;


-- ingresar valor null . invalido

insert into viajes (nombre,pension,hotel,dias,salida)
values ('Mexico maravilloso',null,'4',15,'2005-12-01');


-- ingresar valor null en hotel , valor 3

insert into viajes (nombre,pension,hotel,dias,salida)
values ('Mexico especial','media',3,18,'2005-11-01');

select * from viajes;

-- valor ningugo en capo hotel , invalido

insert into viajes (nombre,pension,hotel,dias,salida)
values ('Caribe especial','ninguna','4',18,'2005-11-01');

-- valor fuera del rango para hotel : 6 . invalido

insert into viajes (nombre,pension,hotel,dias,salida)
values ('Venezuela única','no',6,18,'2005-11-01');


-- select 
select * from viajes
where pension=2;

select * from viajes
where hotel='4';


-- problema inmuebles

drop table if exists inmuebles;

create table inmuebles(
tipoinmueble enum ('casa','dpto','local','terreno')not null,
domicilio varchar(30),
propietario varchar(30),
precio decimal(8,2) unsigned
);

describe inmuebles;

-- ingresar registros
insert into inmuebles
values ('casa','lima','alexis',100.20);

select * from inmuebles;

--

select domicilio ,precio
from inmuebles;


select domicilio , propietario , precio
from inmuebles;


select domicilio,precio 
from inmuebles
where precio>0;