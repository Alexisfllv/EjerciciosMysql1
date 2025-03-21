-- Subconsultas (Exists y No Exists) 90

drop table if exists facturas,detalles;

create table facturas(
numero int not null,
fecha date,
cliente varchar(30),
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

insert into facturas values(1200,'2018-01-15','Juan Lopez');
insert into facturas values(1201,'2018-01-15','Luis Torres');
insert into facturas values(1202,'2018-01-15','Ana Garcia');
insert into facturas values(1300,'2018-01-20','Juan Lopez');

insert into detalles values(1200,1,'lapiz',1,100);
insert into detalles values(1200,2,'goma',0.5,150);
insert into detalles values(1201,1,'regla',1.5,80);
insert into detalles values(1201,2,'goma',0.5,200);
insert into detalles values(1201,3,'cuaderno',4,90);
insert into detalles values(1202,1,'lapiz',1,200);
insert into detalles values(1202,2,'escuadra',2,100);
insert into detalles values(1300,1,'lapiz',1,300);


select * from facturas;
select * from detalles;

-- facturas -> detalles

select f.cliente , f.numero
from facturas as f
where exists
(select * from detalles as d
where f.numero = d.numerofactura
and d.articulo = 'lapiz');


-- exists = true/false retorna los valores que tiene 'd/lapiz'
select * from detalles as d
join facturas as f
where f.numero = d.numerofactura
and d.articulo = 'lapiz';

SELECT CASE 
    WHEN EXISTS (
        SELECT 1 FROM detalles d WHERE d.articulo = 'lapiz'
    ) THEN 'Existe' 
    ELSE 'No Existe' 
END AS resultado;

-- not exists
select f.cliente , f.numero
from facturas as f
where not exists
(select * from detalles as d
where f.numero = d.numerofactura
and d.articulo = 'lapiz');

-- prob 1 , socios,inscriptos

drop table if exists socios,inscriptos;

create table socios(
numero int auto_increment,
documento char(8),
nombre varchar(30),
domicilio varchar(30),
primary key (numero)
);
 
create table inscriptos (
numerosocio int not null,
deporte varchar(20) not null,
cuotas smallint,
primary key(numerosocio,deporte)
);

insert into socios(documento,nombre,domicilio) values('23333333','Alberto Paredes','Colon 111');
insert into socios(documento,nombre,domicilio) values('24444444','Carlos Conte','Sarmiento 755');
insert into socios(documento,nombre,domicilio) values('25555555','Fabian Fuentes','Caseros 987');
insert into socios(documento,nombre,domicilio) values('26666666','Hector Lopez','Sucre 344');

insert into inscriptos values(1,'tenis',1);
insert into inscriptos values(1,'basquet',2);
insert into inscriptos values(1,'natacion',1);
insert into inscriptos values(2,'tenis',9);
insert into inscriptos values(2,'natacion',1);
insert into inscriptos values(2,'basquet',default);
insert into inscriptos values(2,'futbol',2);
insert into inscriptos values(3,'tenis',8);
insert into inscriptos values(3,'basquet',9);
insert into inscriptos values(3,'natacion',0);
insert into inscriptos values(4,'basquet',10);

select * from socios;
select * from inscriptos;


-- lista de socios que inscribieron en natacion
select nombre
from socios as s
where exists
(select * from inscriptos as i
where s.numero = i.numerosocio
and i.deporte = 'natacion');


-- subconsulta . relacion de llaves y la condicon where 

-- socios no se han inscripto en natacion

select nombre
from socios as s
where not exists
(select * from inscriptos as i
where s.numero = i.numerosocio
and i.deporte = 'natacion');

-- todos los datos de los socios que han pagado todas las cuotas
select s.* 
from socios as s
where exists 
(select * from inscriptos as i
where s.numero = i.numerosocio
and i.cuotas=10)







