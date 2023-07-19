-- 119. Estruturas de repetição (REPEAT)

-- base da estrutura
delimiter $$
create procedure proc_repeat()
comment 'exemplo de uso do repeat'
	begin
		repeat
			-- linha de codigo
        until <condicao> end repeat		
	end
    $$
delimiter ;

call proc_repeat();

-- indo aos codigo

delimiter $$
create procedure proc_repeat()
comment 'exemplo de uso do repeat'
	begin
    declare z int default 1;
    declare resultado varchar(20);
		repeat
			set resultado = concat('2 x ', z, ' = ', (2*z)); /* 2 x 1 = (2*z) */
			insert into tabuada(tabuada)value(resultado);
			set z = z + 1;
        until z > 10 end repeat;
	end
    $$
delimiter ;

call proc_repeat();

drop procedure universidade_x.proc_repeat;
show procedure status where db = 'universidade_x'
truncate table tabuada;
drop table tabuada;

select * from tabuada;
