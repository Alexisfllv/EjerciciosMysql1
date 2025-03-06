-- Vistas 95

drop table if exists empleados,secciones;

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

-- vista empleados
drop view if exists vistas_empleados;

create view vistas_empleados as
select concat(apellido , ' ' ,e.nombre) as nombre,
sexo,s.nombre as seccion,
cantidadhijos
from empleados as e
join secciones as s
on codigo = seccion;

select * from vistas_empleados;

select nombre,seccion,cantidadhijos from vistas_empleados;

select seccion , count(*) as cantidad
from vistas_empleados
group by seccion;

-- vista vista empleados ingreso

drop view if exists vista_empleados_ingreso;

create view vista_empleados_ingreso
(fecingreso,cantidad) as
select extract(year from fechaingreso) as fecingreso,
count(*) as cantidad
from empleados
group by fecingreso;


select * from vista_empleados_ingreso;


-- prob 1 , socios,profesores,cursos,inscriptos

drop table if exists socios,profesores,cursos,inscriptos;


create table socios(
documento char(8) not null,
nombre varchar(40),
domicilio varchar(30),
primary key (documento)
);

create table profesores(
documento char(8) not null,
nombre varchar(40),
domicilio varchar(30),
primary key (documento)
);

create table cursos(
numero integer auto_increment,
deporte varchar(20),
dia varchar(15),
documentoprofesor char(8),
primary key (numero)
);

create table inscriptos(
documentosocio char(8) not null,
numero integer not null,
matricula char(1),
primary key (documentosocio,numero)
);


insert into socios values('30000000','Fabian Fuentes','Caseros 987');
insert into socios values('31111111','Gaston Garcia','Guemes 65');
insert into socios values('32222222','Hector Huerta','Sucre 534');
insert into socios values('33333333','Ines Irala','Bulnes 345');

insert into profesores values('22222222','Ana Acosta','Avellaneda 231');
insert into profesores values('23333333','Carlos Caseres','Colon 245');
insert into profesores values('24444444','Daniel Duarte','Sarmiento 987');
insert into profesores values('25555555','Esteban Lopez','Sucre 1204');

insert into cursos(deporte,dia,documentoprofesor) 
values('tenis','lunes','22222222');
insert into cursos(deporte,dia,documentoprofesor) 
values('tenis','martes','22222222');
insert into cursos(deporte,dia,documentoprofesor) 
values('natacion','miercoles','22222222');
insert into cursos(deporte,dia,documentoprofesor) 
values('natacion','jueves','23333333');
insert into cursos(deporte,dia,documentoprofesor) 
values('natacion','viernes','23333333');
insert into cursos(deporte,dia,documentoprofesor) 
values('futbol','sabado','24444444');
insert into cursos(deporte,dia,documentoprofesor) 
values('futbol','lunes','24444444');
insert into cursos(deporte,dia,documentoprofesor) 
values('basquet','martes','24444444');

insert into inscriptos values('30000000',1,'s');
insert into inscriptos values('30000000',3,'n');
insert into inscriptos values('30000000',6,null);
insert into inscriptos values('31111111',1,'s');
insert into inscriptos values('31111111',4,'s');
insert into inscriptos values('32222222',8,'s');

select * from socios;
select * from profesores;
select * from cursos;
select * from inscriptos; 

-- vista_club 

drop view if exists vista_club;

-- nombre,document del socio,deporte, dia y nombre del profesor , no mostrar a los no inscriptos en deportes

create view vista_club as
select 
s.nombre as socio,
s.documento as  docsocio,
s.domicilio as domsocio,
c.deporte as deporte,
dia,
p.nombre as profesor,
matricula
from socios as s
join inscriptos as i
on s.documento = i.documentosocio
join cursos as c 
on i.numero = c.numero
join profesores as p
on c.documentoprofesor = p.documento;

select * from vista_club;

-- cantidad de socios inscriptos en cada deporte ordenados por cantidad.
select deporte, dia,count(socio) as cantidad
from vista_club
group by deporte,dia
order by cantidad;

-- nombre , documento de los socios que debe matriculas
select socio,docsocio
from vista_club
where matricula <> 's';

-- nombres de los profesores, dias que asisten al club para dictar clases
select distinct profesor,dia
from vista_club;

-- nombre socio , tenis , lunes
select socio from vista_club
where deporte = 'tenis' and dia = 'lunes';

-- vista inscriptos
-- cantidad de inscriptos por curso , nombre del deporte, dia

drop view if exists vista_inscriptos;

create view vista_inscriptos as
select deporte , dia, 
(select count(*)
from inscriptos as i
where i.numero = c.numero) as cantidad
from cursos as c;

select * from vista_inscriptos;



















