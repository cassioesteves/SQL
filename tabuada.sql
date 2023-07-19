-- criacao de uma tabuada, nesse exemplo tabuada do 2

delimiter $$
create procedure proc_tabuada()
comment 'criação de uma tabuada usando loop'
	begin
		declare z int default 1;
        declare resultado varchar(50);
        /*
			2 x 1 = 2
            2 x 2 = 4
            2 x 3 = 6
        */
		loop_tabuada: loop
        set resultado = concat('2 x ', z, ' = ', (2*z)); /* 2 x 1 = (2*z) */
        insert into tabuada(tabuada)value(resultado);
        -- 2 x z
		set z = z + 1;
        
        if z > 10 then
			leave loop_tabuada; -- leave interrompe o loop quando a condicao for satisfeita
		end if;
        
        end loop loop_tabuada;
    end
    $$
delimiter ;

truncate table tabuada;
select * from tabuada;

call proc_tabuada;