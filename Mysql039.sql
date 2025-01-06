-- Clave primaria compuesta

drop table if exists vehiculos;


create table vehiculos(
  patente char(6) not null,
  tipo char(4),
  horallegada time not null,
  horasalida time,
  primary key(patente,horallegada)
 );

insert into vehiculos (patente,tipo,horallegada,horasalida)
  values('ACD123','auto','8:30','9:40');
insert into vehiculos (patente,tipo,horallegada,horasalida)
  values('AKL098','auto','8:45','11:10');
insert into vehiculos (patente,tipo,horallegada,horasalida)
  values('HGF123','auto','9:30','11:40');
insert into vehiculos (patente,tipo,horallegada,horasalida)
  values('DRT123','auto','15:30',null);
insert into vehiculos (patente,tipo,horallegada,horasalida)
  values('FRT545','moto','19:45',null);
insert into vehiculos (patente,tipo,horallegada,horasalida)
  values('GTY154','auto','20:30','21:00');
  
describe vehiculos;

select * from vehiculos;

insert into vehiculos (patente,tipo,horallegada,horasalida)
   values('ACD123','auto','16:00',null);

insert into vehiculos (patente,tipo,horallegada,horasalida)
  values('ACD123','auto','16:00',null);
  
-- eliminar hora de una columna  
alter table vehiculos drop horallegada;

delete from vehiculos
  where patente='ACD123';
  
  
-- problemas 1


drop table if exists prestamos;

create table prestamos(
  titulo varchar(40) not null,
  documento char(8) not null,
  fechaprestamo date not null,
  fechadevolucion date,
  devuelto char(1) default 'N',
  primary key(titulo,fechaprestamo)
 );


describe prestamos;

 insert into prestamos (titulo,documento,fechaprestamo)
  values('Manual de 1 grado','22333444','2006-07-10');
 insert into prestamos (titulo,documento,fechaprestamo)
  values('Manual de 1 grado','22333444','2006-07-20');
 insert into prestamos (titulo,documento,fechaprestamo)
  values('Manual de 1 grado','23333444','2006-07-15');
 insert into prestamos (titulo,documento,fechaprestamo)
  values('El aleph','22333444','2006-07-10');
 insert into prestamos (titulo,documento,fechaprestamo)
  values('El aleph','30333444','2006-08-10');


select * from prestamos;


-- ingreso de un valor con clave repetida:
insert into prestamos (titulo,documento,fechaprestamo)
  values('Manual de 1 grado','25333444','2006-07-10');



-- problema 1 prestamos

drop table if exists prestamos;

create table prestamos(
  titulo varchar(40) not null,
  documento char(8) not null,
  fechaprestamo date not null,
  fechadevolucion date,
  devuelto char(1) default 'N',
  primary key(titulo,fechaprestamo)
 );
 
 insert into prestamos (titulo,documento,fechaprestamo)
  values('Manual de 1 grado','22333444','2006-07-10');
 insert into prestamos (titulo,documento,fechaprestamo)
  values('Manual de 1 grado','22333444','2006-07-20');
 insert into prestamos (titulo,documento,fechaprestamo)
  values('Manual de 1 grado','23333444','2006-07-15');
 insert into prestamos (titulo,documento,fechaprestamo)
  values('El aleph','22333444','2006-07-10');
 insert into prestamos (titulo,documento,fechaprestamo)
  values('El aleph','30333444','2006-08-10');
  
describe prestamos;

select * from prestamos;

-- ingreso de datos con valor de pk repetida
 insert into prestamos (titulo,documento,fechaprestamo)
  values('Manual de 1 grado','25333444','2006-07-10');
















