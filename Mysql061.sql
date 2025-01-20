-- funciones de control de flujo , case


drop table if exists libros;

create table libros(
  codigo int unsigned auto_increment,
  titulo varchar(40) not null,
  autor varchar(30),
  editorial varchar(20),
  precio decimal(5,2) unsigned,
  cantidad smallint unsigned,
  primary key(codigo)
 );
 
insert into libros (titulo,autor,editorial,precio,cantidad)
  values('El aleph','Borges','Planeta',34.5,100);
insert into libros (titulo,autor,editorial,precio,cantidad)
  values('Alicia en el pais de las maravillas','Carroll L.','Paidos',20.7,50);
insert into libros (titulo,autor,editorial,precio,cantidad)
  values('harry Potter y la camara secreta',null,'Emece',35,500);
insert into libros (titulo,autor,editorial,precio,cantidad)
  values('Aprenda PHP','Molina Mario','Planeta',54,100);
insert into libros (titulo,autor,editorial,precio,cantidad)
  values('Harry Potter y la piedra filosofal',null,'Emece',38,500);
insert into libros (titulo,autor,editorial,precio,cantidad)
  values('Aprenda Java','Molina Mario','Planeta',55,100);
insert into libros (titulo,autor,editorial,precio,cantidad)
  values('Aprenda JavaScript','Molina Mario','Planeta',58,150); 
 
 
-- seleccion
select editorial,
  case count(*)
   when 1 then 1
   else 'mas de 1' end as 'cantidad'
  from libros
  group by editorial;

-- seleccion case

select editorial,
  case count(*)
   when 1 then 1
   end as 'cantidad'
  from libros
  group by editorial;


select editorial,
  case count(*)
   when 1 then 1
   when 2 then 2
   when 3 then 3
  else 'Más de 3' end as 'cantidad'
  from libros
  group by editorial;
  
  
select editorial,
  case count(*)
   when 1 then 1
   when 2 then 2
   when 3 then 3
  else 'Más de 3' end as 'cantidad'
  from libros
  group by editorial
  order by cantidad;  
  
  
-- la estructura del case es incorrecto
select editorial,
  case count(*)
   when 1 then 1
   when count(*)>1 then 'mas de 1'
  end as 'cantidad'
  from libros
  group by editorial;  
  
  
select editorial,
case when count(*)=1 then 1
	else 'mas de 1'
  end as 'cantidad'
 from libros
 group by editorial;
 
 
 
-- problemas 1 tabla alumnos


drop table if exists alumnos;

create table alumnos(
  legajo char(5) not null,
  nombre varchar(30),
  promedio decimal(4,2)
);


describe alumnos;

insert into alumnos values(3456,'Perez Luis',8.5);
insert into alumnos values(3556,'Garcia Ana',7.0);
insert into alumnos values(3656,'Ludueña Juan',9.6);
insert into alumnos values(2756,'Moreno Gabriela',4.8);
insert into alumnos values(4856,'Morales Hugo',3.2);
insert into alumnos values(7856,'Gomez Susana',6.4);


select * from alumnos;

-- promedios 4,7,10

select *,
case 
when truncate(promedio,0)<=4 then 'nota baja'
when truncate(promedio,0) >4 and truncate(promedio,0) <=7 then 'nota regular'
else 'excelente' end as 'estado'
from alumnos;


select legajo,promedio,
  case truncate(promedio,0)
   when 0 then 'reprobado'
   when 1 then 'reprobado'
   when 2 then 'reprobado'
   when 3 then 'reprobado'
   when 4 then 'regular'
   when 5 then 'regular'
   when 6 then 'regular'
   when 7 then 'promocionado'
   when 8 then 'promocionado'
   when 9 then 'promocionado'
   else 'promocionado'
  end as 'estado'
 from alumnos;
 
 
select legajo,promedio,
  case 
  when promedio<4 then 'reprobado'
  when promedio>4 and promedio<7 then 'regular'
   else 'promocionado'
  end as 'estado'
 from alumnos; 
 
 
-- problema 2 ,vehiculos


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
  values('AKL098','auto','8:45','15:10');
 insert into vehiculos (patente,tipo,horallegada,horasalida)
  values('HGF123','auto','9:30','18:40');
 insert into vehiculos (patente,tipo,horallegada,horasalida)
  values('DRT123','auto','15:30',null);
 insert into vehiculos (patente,tipo,horallegada,horasalida)
  values('FRT545','moto','19:45',null);
 insert into vehiculos (patente,tipo,horallegada,horasalida)
  values('GTY154','auto','20:30','21:00');
  
  
select * from vehiculos;




select patente,horallegada,horasalida,
left(timediff(horasalida,horallegada),5) as horasminutos,
case 
when hour(timediff(horasalida,horallegada))>4 then hour(timediff(horasalida,horallegada)) div 4
	else 0
end as horagratis
from vehiculos
where horasalida is not null;



select patente,horallegada,horasalida,
left(timediff(horasalida,horallegada),5) as horasminutos,
case when extract(hour_minute from timediff(horasalida,horallegada))<200 then 1
else hour(timediff(horasalida,horallegada))-hour(timediff(horasalida,horallegada)) div 4
end as horascobradas
from vehiculos
where horasalida is not null;


-- problema 2 tabla visitas


drop table if exists visitas;

create table visitas (
  numero int unsigned auto_increment,
  nombre varchar(30) not null,
  mail varchar(50),
  pais varchar (20),
  fecha date,
  primary key(numero)
);


insert into visitas (nombre,mail,fecha)
  values ('Ana Maria Lopez','AnaMaria@hotmail.com','2006-02-10');
 insert into visitas (nombre,mail,fecha)
  values ('Gustavo Gonzalez','GustavoGGonzalez@hotmail.com','2006-05-10');
 insert into visitas (nombre,mail,fecha)
  values ('Juancito','JuanJosePerez@hotmail.com','2006-06-11');
 insert into visitas (nombre,mail,fecha)
  values ('Fabiola Martinez','MartinezFabiola@hotmail.com','2006-10-12');
 insert into visitas (nombre,mail,fecha)
  values ('Fabiola Martinez','MartinezFabiola@hotmail.com','2006-09-12');
 insert into visitas (nombre,mail,fecha)
  values ('Juancito','JuanJosePerez@hotmail.com','2006-09-12');
 insert into visitas (nombre,mail,fecha)
  values ('Juancito','JuanJosePerez@hotmail.com','2006-09-15');
 insert into visitas (nombre,mail,fecha)
  values ('Juancito','JuanJosePerez@hotmail.com','2006-09-15');
  
  
select nombre,fecha,
  case dayname(fecha)
   when 'Monday' then 'lunes'
   when 'Tuesday' then 'martes'
   when 'Wednesday' then 'miercoles'
   when 'Thursday' then 'jueves'
   when 'Friday' then 'viernes'
   when 'Saturday' then 'sabado'
  else 'domingo'
  end as 'dia'
 from visitas;  
 
 
 select nombre,fecha,
  case when (monthname(fecha) in ('January','February','March','April'))
   then '1º cuatrimestre'
  when (monthname(fecha) in ('May','June','July','August'))
   then '2º cuatrimestre'
  else '3º cuatrimestre'
  end as 'mes'
 from visitas;
 