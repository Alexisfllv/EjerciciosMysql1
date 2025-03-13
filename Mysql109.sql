-- funciones almacenadas 109

delimiter //
create function f_calcular_iva(
	precio decimal (10,2))
returns decimal (10,2)
deterministic
begin
	return precio * 0.18;
end //
delimiter ;

select f_calcular_iva(100);


-- prob sitios

drop table if exists sitios;

create table sitios (
url varchar(100),
cantpaginas int,
estrellas tinyint,
primary key(url)
);

insert into sitios(url,cantpaginas,estrellas) values ('lanacion.com.ar',17000000,3);
insert into sitios(url,cantpaginas,estrellas) values ('clarin.com',42000000,3);
insert into sitios(url,cantpaginas,estrellas) values ('infobae.com',33000000,5);
insert into sitios(url,cantpaginas,estrellas) values ('lavoz.com.ar',25000000,2);

select * from sitios;

-- funcion para hallarestrellas de cada sitio web

drop function if exists f_estrellas;

delimiter //
create function f_estrellas(
	cant tinyint
)
	returns varchar (15)
	deterministic
begin
	declare estrellas varchar(15) default '';
    declare x int default 0;
    while x < cant do
		set estrellas = concat(estrellas , '*');
        set x = x+1;
	end while;
    return estrellas;
end //
delimiter ;


select url,f_estrellas(estrellas) from sitios;

