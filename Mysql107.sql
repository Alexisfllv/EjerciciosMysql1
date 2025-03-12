-- Procedimientos almacenados (llamar a otro procedimiento desde un procedimiento existente) 107

-- procedure multiplicar
drop procedure if exists pa_multiplicar;

delimiter  //
create procedure pa_multiplicar(
	in numero1 int,
    in numero2 int,
    out producto int
)

begin
	set producto = numero1 * numero2;
end //
delimiter ;

call pa_multiplicar(3,5,@producto);

select @producto;


-- prod multiplicar

drop procedure if exists pa_multiplicar;

delimiter //
create procedure pa_multiplicar(
	in numero1 int,
    in numero2 int,
    out producto int
)

begin
	set producto = numero1 * numero2;
end //
delimiter ;

-- factorial

drop procedure if exists pa_factorial;

delimiter //
create procedure pa_factorial(
	in numero int,
    out resultado int
)
begin 
	declare num int;
    set resultado =1;
    set num = numero;
    -- 0 = 2
    while num > 1 do
		call pa_multiplicar(resultado , num, resultado);
        -- 1 * 2
        set num = num -1;
		-- 2 = 2-1
	end while;
end //
delimiter ;


call pa_factorial(5, @resu);
select @resu;
















