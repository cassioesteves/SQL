-- 113. Estruturas de decisão (CASE) parte 1

case <valor>
	when <comparacao>then
		<instrução>
	when <comparacao>then
		<instrução 1>
	else
    	<instrução>
end case;


delimiter $$
	create procedure proc_case()
    comment 'Exemplo de uso de case'
	begin
		/* sintaxe simpes*/
		declare opcao int default 10;
        case opcao
			when 1 then select 'Instrução a ser executada é a opção 1';           
            when 2 then select 'Instrução a ser executada é a opção 2';   
            when 3 then select 'Instrução a ser executada é a opção 3';   
            when 4 then select 'Instrução a ser executada é a opção 4';
            else
				select 'Instrução a ser executada se nenhuma opção anterior for verdadeira';
        end case;
    end
    $$
delimiter ;

call proc_case;

drop procedure universidade_x.proc_case;

show procedure status where db = 'universidade_x';

-- 114. Estruturas de decisão (CASE) parte 2

delimiter $$
create procedure proc_case2()
comment 'Estruturas de decisão (Case) part 2'
	begin
		/* sintaxe alternativa*/
		declare opcao int default 2;
		case
			when opcao = 1 then select 'opcao 1';
			when opcao = 2 then select 'opcao 2';
			else
				select 'nenhuma das anteriores';            
        end case;
    end
    $$
delimiter ;

call proc_case2;
drop procedure universidade_x.proc_case2;

-- evoluindo

delimiter $$
create procedure proc_case3()
comment 'Estruturas de decisão (Case) part 2'
	begin
		/* sintaxe alternativa*/
		declare opcao int default 7;
		case
			when opcao >= 1 and opcao <= 5 then select 'opcao 1';
			when opcao > 5 and opcao <= 10 then select 'opcao 2';
			else
				select 'nenhuma das anteriores';            
        end case;
    end
    $$
delimiter ;

call proc_case3;
drop procedure universidade_x.proc_case3;

-- date

delimiter $$
create procedure proc_data()
comment 'Estruturas de decisão (Case) exemplo com Data'
	begin
		/* sintaxe alternativa*/
		declare data_teste date;
        -- set data_teste = curdate(); --  projeta autal 
        -- set data_teste = curdate() - 1; -- projeta passado 
		set data_teste = curdate() + 5; -- projeta futuro
        
		case
			when data_teste = curdate() then select curdate() as data_atual, data_teste, 'Presente';
			when data_teste < curdate() then select curdate() as data_atual, data_teste, 'Passado';
            when data_teste > curdate() then select curdate() as data_atual, data_teste, 'Futuro';
			else
				select 'nenhuma das anteriores';            
        end case;
    end
    $$
delimiter ;

call proc_data;
drop procedure universidade_x.proc_data;

-- 115. Extra - CASE em colunas de consultas

select * from aluno as a left join telefone as t on (a.idaluno = t.fk_idaluno);

select 
	a.idaluno, 
	a.nome, 
	a.sexo,
    case 
		when a.sexo = 'M' then 'Masculino' 
        when a.sexo = 'F' then 'Feminino'
	end as descricao_sexo,
	t.numero, 
	t.tipo 
from 
	aluno as a left join telefone as t on (a.idaluno = t.fk_idaluno);

-- ou usando else se não for masculino so pode ser feminino

select 
	a.idaluno, 
	a.nome, 
	a.sexo,
    case 
		when a.sexo = 'M' then 'Masculino' 
        else 'Feminino'
	end as descricao_sexo,
	t.numero,
	t.tipo,
    case
		when t.tipo = 'cel' then 'Celular'
        when t. tipo = 'res' then 'Residencial'
        else 'Comercial'
    end as 'descricao_tipo'
from 
	aluno as a left join telefone as t on (a.idaluno = t.fk_idaluno);

-- omitir as colunas ja declarada no case

select 
	a.idaluno, 
	a.nome, 
	case 
		when a.sexo = 'M' then 'Masculino' 
        else 'Feminino'
	end as descricao_sexo,
	t.numero,
	case
		when t.tipo = 'cel' then 'Celular'
        when t. tipo = 'res' then 'Residencial'
        else 'Comercial'
    end as 'descricao_tipo'
from 
	aluno as a left join telefone as t on (a.idaluno = t.fk_idaluno);