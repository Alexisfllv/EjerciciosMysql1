-- Subconsulta en lugar de una tabla 92

drop table if exists clientes,facturas,detalles;

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
primary key(numero)
);

create table detalles(
numerofactura int not null,
numeroitem int not null, 
articulo varchar(30),
precio decimal(5,2),
cantidad int,
primary key(numerofactura,numeroitem)
);

insert into clientes(nombre,domicilio) values('Juan Lopez','Colon 123');
insert into clientes(nombre,domicilio) values('Luis Torres','Sucre 987');
insert into clientes(nombre,domicilio) values('Ana Garcia','Sarmiento 576');

insert into facturas values(1200,'2007-01-15',1);
insert into facturas values(1201,'2007-01-15',2);
insert into facturas values(1202,'2007-01-15',3);
insert into facturas values(1300,'2007-01-20',1);

insert into detalles values(1200,1,'lapiz',1,100);
insert into detalles values(1200,2,'goma',0.5,150);
insert into detalles values(1201,1,'regla',1.5,80);
insert into detalles values(1201,2,'goma',0.5,200);
insert into detalles values(1201,3,'cuaderno',4,90);
insert into detalles values(1202,1,'lapiz',1,200);
insert into detalles values(1202,2,'escuadra',2,100);
insert into detalles values(1300,1,'lapiz',1,300);


select * from clientes;
select * from facturas;
select * from detalles;


select f.*,
(select sum(d.precio * cantidad)
from detalles as d
where f.numero = d.numerofactura) as total
from facturas as f;

select td.numero , c.nombre , td.total
from clientes as c
join 
(select f.*,
(select sum(d.precio*cantidad)
from detalles as d
where f.numero=d.numerofactura) as total
from facturas as f) as td
on td.codigocliente = c.codigo;

-- prob 2 , socios,deportes,inscriptos

drop table if exists socios,deportes,inscriptos;

CREATE TABLE socios (
documento CHAR(8) NOT NULL, 
nombre VARCHAR(30),
domicilio VARCHAR(30),
PRIMARY KEY (documento)
);

CREATE TABLE deportes (
codigo INT AUTO_INCREMENT,
nombre VARCHAR(20),
profesor VARCHAR(15),
PRIMARY KEY (codigo)
);

CREATE TABLE inscriptos (
documento CHAR(8) NOT NULL, 
codigodeporte INT NOT NULL, -- Corregido a INT para coincidir con deportes.codigo
año CHAR(4),
matricula CHAR(1) CHECK (matricula IN ('s', 'n')), -- Restricción de valores permitidos
PRIMARY KEY (documento, codigodeporte, año)
);

insert into socios values('22222222','Ana Acosta','Avellaneda 111');
insert into socios values('23333333','Betina Bustos','Bulnes 222');
insert into socios values('24444444','Carlos Castro','Caseros 333');
insert into socios values('25555555','Daniel Duarte','Dinamarca 44');

insert into deportes(nombre,profesor) values('basquet','Juan Juarez');
insert into deportes(nombre,profesor) values('futbol','Pedro Perez');
insert into deportes(nombre,profesor) values('natacion','Marina Morales');
insert into deportes(nombre,profesor) values('tenis','Marina Morales');

insert into inscriptos values ('22222222',3,'2006','s');
insert into inscriptos values ('23333333',3,'2006','s');
insert into inscriptos values ('24444444',3,'2006','n');
insert into inscriptos values ('22222222',3,'2005','s');
insert into inscriptos values ('22222222',3,'2007','n');
insert into inscriptos values ('24444444',1,'2006','s');
insert into inscriptos values ('24444444',2,'2006','s');

select * from socios;
select * from deportes;
select * from inscriptos;

-- datos de la inscripcion , incluyendo el nombre del deporte y del profesor

select i.documento,i.codigodeporte,d.nombre as deporte , año , matricula , d.profesor
from deportes as d
join inscriptos as i
on d.codigo = i.codigodeporte;


select s.nombre,td.deporte,td.profesor,td.año,td.matricula
from socios as s
join 
(select i.documento,i.codigodeporte,d.nombre as deporte , año , matricula , d.profesor
from deportes as d
join inscriptos as i
on d.codigo = i.codigodeporte) as td
on td.documento = s.documento;


SELECT s.nombre, d.nombre AS deporte, d.profesor, i.año, i.matricula
FROM socios AS s
JOIN inscriptos AS i ON s.documento = i.documento
JOIN deportes AS d ON i.codigodeporte = d.codigo;













