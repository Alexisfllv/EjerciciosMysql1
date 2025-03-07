-- Vistas basadas en otras vistas 96

drop table if exists secciones,empleados;

create table secciones(
codigo int auto_increment primary key,
nombre varchar(30),
sueldo decimal(5,2)
);

create table empleados(
legajo int primary key auto_increment,
documento char(8),
sexo char(1),
apellido varchar(40),
nombre varchar(30),
domicilio varchar(30),
seccion int not null,
cantidadhijos int,
estadocivil char(10),
fechaingreso date
);

insert into secciones(nombre,sueldo) values('Administracion', 300);
insert into secciones(nombre,sueldo) values('Contaduría', 400);
insert into secciones(nombre,sueldo) values('Sistemas', 500);

insert into empleados (documento,sexo,apellido,nombre,domicilio,seccion,cantidadhijos,estadocivil,fechaingreso)
values ('22222222','f','Lopez','Ana','Colon 123',1,2,'casado','1990-10-10');
insert into empleados (documento,sexo,apellido,nombre,domicilio,seccion,cantidadhijos,estadocivil,fechaingreso)   
values('23333333','m','Lopez','Luis','Sucre 235',1,0,'soltero','1990-02-10');
insert into empleados (documento,sexo,apellido,nombre,domicilio,seccion,cantidadhijos,estadocivil,fechaingreso)
values('24444444','m','Garcia','Marcos','Sarmiento 1234',2,3,'divorciado','1998-07-12');
insert into empleados (documento,sexo,apellido,nombre,domicilio,seccion,cantidadhijos,estadocivil,fechaingreso)
values('25555555','m','Gomez','Pablo','Bulnes 321',3,2,'casado','1998-10-09');
insert into empleados (documento,sexo,apellido,nombre,domicilio,seccion,cantidadhijos,estadocivil,fechaingreso)
values('26666666','f','Perez','Laura','Peru 1254',3,3,'casado','2000-05-09');


select * from secciones;
select * from empleados;

-- eliminar vista_empleados
drop view if exists vista_empleados;

create view vista_empleados as 
select concat (apellido, '' , e.nombre) as nombre,
sexo,
s.nombre as seccion,
cantidadhijos
from empleados as e
join secciones as s 
on codigo = seccion;


select * from vista_empleados; 


-- eliminar vista_empleados_con_hijos

drop view if exists vista_empleados_con_hijos;


create view vista_empleados_con_hijos as
select nombre,sexo,seccion,cantidadhijos
from vista_empleados
where cantidadhijos > 0;


select * from vista_empleados_con_hijos;



-- prob 1 , alumnos

drop table if exists alumnos;

create table alumnos(
documento char(8),
nombre varchar(30),
nota decimal(4,2),
primary key(documento)
);

insert into alumnos values('30111111','Ana Algarbe',5.1);
insert into alumnos values('30222222','Bernardo Bustamante',3.2);
insert into alumnos values('30333333','Carolina Conte',4.5);
insert into alumnos values('30444444','Diana Dominguez',9.7);
insert into alumnos values('30555555','Fabian Fuentes',8.5);
insert into alumnos values('30666666','Gaston Gonzalez',9.70);


-- crear una vista que recupere , el nombre y nota de todos los alumnos

select * from alumnos;

drop view if exists view_alumnos_notas;

create view view_alumnos_notas as
select nombre , nota
from alumnos;

select * from view_alumnos_notas;

-- alumnos aprobados notas mayores a 7

drop view if exists view_alumnos_notas_aprobados;

create view view_alumnos_notas_aprobados as
select nombre,nota
from view_alumnos_notas
where nota >= 7;

select * from view_alumnos_notas_aprobados;




