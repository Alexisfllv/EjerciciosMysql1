-- Procedimientos almacenados (llamadas recursivas) 108

-- habilitar recursion , que se llame a si mismo hasta 10 veces
SET @@session.max_sp_recursion_depth = 10; 

-- 

drop procedure if exists pa_factorial;

delimiter //
create procedure pa_factorial(
in valor int,
out resu int
)
begin
	if valor = 0 then
		set resu = 1;
	else
		call pa_factorial(valor -1 , resu);
        set resu = valor * resu;
	end if;
end //
delimiter ;
		
call pa_factorial(10,@resu);
select @resu;