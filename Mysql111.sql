--  Disparadores (triggers - update trigger) 111

drop table if exists usuarios,clavesanteriores;

create table usuarios(
nombre varchar(30),
clave varchar(30),
primary key (nombre)
);

create table clavesanteriores(
numero int auto_increment,
nombre varchar(30),
clave varchar(30),
primary key (numero)
);


drop trigger if exists t_before_usuarios_update;

delimiter //
create trigger t_before_usuarios_update
	before update
    on usuarios
     for each row
begin
	insert into clavesanteriores(nombre, clave)
    values  (old.nombre , old.clave);
end //
delimiter ;

select * from usuarios;
select * from clavesanteriores;

insert into usuarios values
('Alexis','12345');

update usuarios set nombre = 'ferrari' where nombre = 'Alexis'; 

update usuarios set nombre = 'lou', clave = '333' where nombre = 'ferrari';

select * from usuarios;
select * from clavesanteriores;


