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

-- prob 2 , traficos

drop function if exists f_tipositio;

delimiter //
create function f_tipositio(
	cantidad int
)
	returns varchar(20)
	deterministic
begin
	case
		when cantidad < 20000000 then
			return 'trafico bajo';
        when cantidad >= 20000000 and cantidad < 40000000 then
			return 'trafico medio';
		when cantidad >= 40000000 then
			return 'trafico alto';
	end case;
end //
delimiter ;

select url,f_estrellas(estrellas), cantpaginas, f_tipositio(cantpaginas) from sitios;

-- mayor trafico

drop function if exists f_mayor_trafico;

delimiter //
create function f_mayor_trafico()
	returns varchar(100)
    deterministic
begin
	declare vurl varchar(100);
    select url into vurl 
    from sitios 
    order by cantpaginas desc limit 1;
    return vurl;
end //
delimiter ;

select f_mayor_trafico();


























