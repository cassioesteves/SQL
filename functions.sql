Functions
-- esqueleto de uma fuction	

USE UNIVERSIDADE_X;

CREATE FUNCTION FUNC_NOME (<PARAMETRO>)
RETURNS <TIPO DE DADOS QUE SERA RETORNADO>
BEGIN
	/*BLOCO DE CODIGO DA FUNCAO*/
    RETURN <RETORNO>
END

SELECT 
	FUNC_NOME(<PARAMETRO>)
FROM
	FUNC_NOME(<PARAMETRO>)	
    
use universidade_x;

/*
	ela vai receber uma data no formato yyyy-mm-dd e vai retornar uma string no formato dd/mm/yy
*/

drop function func_data_ptbr;

delimiter $$
create function func_data_ptbr(p_data datetime)
returns char(10)
deterministic /* a função é determinística quando ela não afeta dados do bd, portanto é considerada segura  */
comment 'Function serve para retornar datas no formato dd/mm/yyyy'
begin
	return date_format(p_data, '%d/%m/%Y');
end
$$
delimiter ;

-- formatar data 
date_format() 
select nome, date_format(data_nascimento, '%d/%m/%Y') as data_nascimento
 
select nome, data_nascimento from aluno;
select nome, date_format(data_nascimento, '%d/%m/%Y') as data_nascimento from aluno;
select nome, func_data_ptbr(data_nascimento) as data_nascimento from aluno;

use universidade_x;

/* listando as functions do banco de dados */
show function status

show function status where Db = 'universidade_x';

/* mostar o conteúdo de uma function */
show create function universidade_x.func_data_ptbr;

/* alterar function -> remover a function e criar novamente */
delimiter $$
CREATE FUNCTION `func_data_ptbr`(p_data datetime) 
RETURNS varchar(255)
    DETERMINISTIC
    COMMENT 'Function serve para retornar datas no formato dd/mm/yyyy'
begin
	return date_format(p_data, '--%d/%m/%Y--');
end
$$
delimiter ; 


/*remover function*/
drop function universidade_x.func_data_ptbr;

select func_data_ptbr('2023-07-26 00:00:00') as data_formatada;

-- 130. Função para calcular idade do aluno (determinística)

delimiter $$
CREATE FUNCTION func_idade (p_data date)
RETURNS INT
deterministic
comment 'Function serve para retornar a idade com base na data de nascimento'
BEGIN
	return timestampdiff(year, p_data, curdate());
END
$$
delimiter ;

show function status where Db = 'universidade_x';

select nome, data_nascimento from aluno;
select nome, func_idade(data_nascimento) from aluno;

-- 131. Função para retornar a qtde de disciplinas por curso (não determinística)

use universidade_x;
drop function func_qtde_disciplinas;

-- desabilitar o deterministic
set global log_bin_trust_function_creators = 0;
set global log_bin_trust_function_creators = 1;

delimiter $$
create function func_qtde_disciplinas(p_idcurso int)
returns int
comment 'Function serve para retornar a quantidade de disciplinas com base em curso'
begin
	declare qtde_disciplinas int default 0;
	/* lógica para recuperar registros de uma tabela */
    set qtde_disciplinas = (select count(*) as qtde_disciplinas from disciplina where fk_idcurso = p_idcurso);
	return qtde_disciplinas;
end
$$
delimiter ;

select 
	func_qtde_disciplinas(3) as qtde_disciplinas;

show function status where Db = 'universidadade_x';

select 
	fk_idcurso,
    (select descricao from curso where idcurso = fk_idcurso) as descricao,
    count(*) as qtde_disciplinas
from 
	disciplina
group by 
	fk_idcurso;

select 
	idcurso,
    descricao,
    func_qtde_disciplinas(idcurso) as qtde_disciplinas
from 
	curso;