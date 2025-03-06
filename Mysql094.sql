-- Subconsulta (insert) 94

drop table if exists alumnos,aprobados;

create table alumnos(
documento char(8) not null,
nombre varchar(30),
nota decimal(4,2),
primary key(documento)
);

create table aprobados(
documento char(8) not null,
nota decimal(4,2),
primary key(documento)
);

insert into alumnos values('30000000','Ana Acosta',8);
insert into alumnos values('30111111','Betina Bustos',9);
insert into alumnos values('30222222','Carlos Caseros',2.5); 
insert into alumnos values('30333333','Daniel Duarte',7.7);
insert into alumnos values('30444444','Estela Esper',3.4);

select * from alumnos;

select * from aprobados;


--
insert into aprobados
select documento,nota
from alumnos
where nota >=4;

-- prob 1 , clientes , facturas

drop table if exists clientes , facturas;

create table clientes(
codigo int auto_increment,
nombre varchar(30),
domicilio varchar(30),
primary key(codigo)
);

create table facturas(
numero int not null,
fecha date,
codigocliente int not null,
total decimal(6,2),
primary key(numero)
);


insert into clientes(nombre,domicilio) values('Juan Lopez','Colon 123');
insert into clientes(nombre,domicilio) values('Luis Torres','Sucre 987');
insert into clientes(nombre,domicilio) values('Ana Garcia','Sarmiento 576');
insert into clientes(nombre,domicilio) values('Susana Molina','San Martin 555');

insert into facturas values(1200,'2018-01-15',1,300);
insert into facturas values(1201,'2018-01-15',2,550);
insert into facturas values(1202,'2018-01-15',3,150);
insert into facturas values(1300,'2018-01-20',1,350);
insert into facturas values(1310,'2018-01-22',3,100);

select * from clientes;
select * from facturas;


-- table clientespref , 
-- nombre , domicilio , de los clientes que tiene mas de 500 en mercaderia

drop table if exists clientespref;


create table clientespref(
nombre varchar(30),
domicilio varchar(30)
);


insert into clientespref
select c.nombre,c.domicilio
from clientes as c
inner join facturas as f
on c.codigo = f.codigocliente
where f.total > 500;

select * from clientespref;

