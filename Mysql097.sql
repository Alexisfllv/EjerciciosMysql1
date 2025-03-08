-- Vistas actualizables (insert, update y delete) 97

drop table if exists alumnos,profesores;

create table alumnos(
documento char(8),
nombre varchar(30),
nota decimal(4,2),
codigoprofesor int,
primary key(documento)
);

create table profesores (
codigo int auto_increment,
nombre varchar(30),
primary key(codigo)
);



insert into alumnos values('30111111','Ana Algarbe', 5.1, 1);
insert into alumnos values('30222222','Bernardo Bustamante', 3.2, 1);
insert into alumnos values('30333333','Carolina Conte',4.5, 1);
insert into alumnos values('30444444','Diana Dominguez',9.7, 1);
insert into alumnos values('30555555','Fabian Fuentes',8.5, 2);
insert into alumnos values('30666666','Gaston Gonzalez',9.70, 2);

insert into profesores(nombre) values ('Maria Luque');
insert into profesores(nombre) values ('Jorje Dante'); 

select * from alumnos;

select * from profesores;

drop view if exists vista_nota_alumnos_aprobados;

create view vista_nota_alumnos_aprobados as 
select documento,
a.nombre as 'nombre_alumno',
p.nombre as 'nombre_profesor',
a.nota,
codigoprofesor
from alumnos as a
join profesores as p
on a.codigoprofesor = p.codigo
where a.nota >= 7;

select * from vista_nota_alumnos_aprobados;


-- insertar numero alumno calificado por el profesor

insert into vista_nota_alumnos_aprobados(documento,nombre_alumno,nota,codigoprofesor)
values ('22222','Alexis Ferr',10,2);



-- 
create view vista_nota_alumnos_aprobados as
select documento,
a.nombre as nombrealumno,
p.nombre as nombreprofesor,
nota,
codigoprofesor
from alumnos as a
join profesores as p on a.codigoprofesor=p.codigo
where nota>=7;

select * from vista_nota_alumnos_aprobados;

insert into vista_nota_alumnos_aprobados(documento, nombrealumno, nota, codigoprofesor)
values('99999999','Rodriguez Pablo', 10, 1);


select * from vista_nota_alumnos_aprobados;


-- modificar una vista relacionada

update vista_nota_alumnos_aprobados set nota = 9
where documento = "22222";

select * from vista_nota_alumnos_aprobados;

insert vista_nota_alumnos_aprobados(documento, nombre_alumno, nota, codigoprofesor)
values('88888888','Laura Robles', 3, 1);

select * from alumnos;



-- modo 2 usando with check option para validar los registros con la condicion de la vista


drop table if exists alumnos,profesores;


create table alumnos(
documento char(8),
nombre varchar(30),
nota decimal(4,2),
codigoprofesor int,
primary key(documento)
);

create table profesores (
codigo int auto_increment,
nombre varchar(30),
primary key(codigo)
);

insert into alumnos values('30111111','Ana Algarbe', 5.1, 1);
insert into alumnos values('30222222','Bernardo Bustamante', 3.2, 1);
insert into alumnos values('30333333','Carolina Conte',4.5, 1);
insert into alumnos values('30444444','Diana Dominguez',9.7, 1);
insert into alumnos values('30555555','Fabian Fuentes',8.5, 2);
insert into alumnos values('30666666','Gaston Gonzalez',9.70, 2);

insert into profesores(nombre) values ('Maria Luque');
insert into profesores(nombre) values ('Jorje Dante'); 


select * from alumnos;
select * from profesores;

-- vista
drop view if exists vista_nota_alumnos_aprobados;


create view vista_nota_alumnos_aprobados as
select documento,
a.nombre as nombrealumno,
p.nombre as nombreprofesor,
nota,
codigoprofesor
from alumnos as a
join profesores as p on a.codigoprofesor=p.codigo
where nota>=7
with check option;

select * from vista_nota_alumnos_aprobados;

update vista_nota_alumnos_aprobados set nota = 7
where documento = 30444444;

insert into vista_nota_alumnos_aprobados (documento,nombrealumno,nota,codigoprofesor)
values ('111110','Alexis Maybe' , 7,2);

select * from alumnos;








