-- 116. Introdução as estruturas de repetição (While, Loop e Repeat)

create table log(
	idlog int primary key auto_increment,
    log varchar(255)
    );
    
select * from log;

delimiter $$
create procedure proc_while()
comment 'estruturas de repetição While'
	begin
		declare contador int default 1;
		-- operadores de comparacao, podem ser conectados por operadores logicos
		while contador < 10 do
            insert into log(log)value(contador);
			-- logica de parada do loop
			set contador = contador + 1;
        end while;
    end
    $$
delimiter ;

call proc_while;