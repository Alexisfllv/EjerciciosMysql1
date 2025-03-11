-- Procedimientos almacenados (parámetros de entrada y salida) 102


drop table if exists empleados;

create table empleados(
documento char(8),
nombre varchar(20),
apellido varchar(20),
sueldo decimal(6,2),
cantidadhijos int,
seccion varchar(20),
primary key(documento)
);

insert into empleados values('22222222','Juan','Perez',300,2,'Contaduria');
insert into empleados values('22333333','Luis','Lopez',700,0,'Contaduria');
insert into empleados values ('22444444','Marta','Perez',500,1,'Sistemas');
insert into empleados values('22555555','Susana','Garcia',400,2,'Secretaria');
insert into empleados values('22666666','Jose Maria','Morales',1200,3,'Secretaria');

select * from empleados;


drop procedure if exists pa_cantidad_hijos;

delimiter //
create procedure pa_cantidad_hijos(
in i_documento char(8),
inout io_cantidad int
)

begin 
	select cantidadhijos + io_cantidad into io_cantidad
    from empleados
    where documento = i_documento;
end //
delimiter ;

-- inicializamos
set @io_cantidad = 0;

-- calculas la cantidad del documento : 
call pa_cantidad_hijos('22222222',  @io_cantidad);

select @io_cantidad;

-- acumulamos con otro doc
call pa_cantidad_hijos ('22666666', @io_cantidad);

select @io_cantidad;

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    