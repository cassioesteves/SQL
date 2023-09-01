-- 142. O que são Views?
use universidade_x;

select * from curso;
select * from disciplina;
select * from professor;

/*CURSO / DISCIPLINA / PROFESSOR */

select 
	c.idcurso, 
    c.descricao as 'curso', 
    d.descricao as 'disciplina', 
    d.carga_horaria, p.idprofessor, 
    p.nome from curso as c
left join disciplina as d 
on (c.idcurso = d.fk_idcurso)
left join professor as p 
on (d.fk_idprofessor = p.idprofessor);

-- criando a view
/*
create view <nome> as
query
*/
create view vw_rel_curso_disciplinas_professores as
select 
	c.idcurso, 
    c.descricao as 'curso', 
    d.descricao as 'disciplina', 
    d.carga_horaria, p.idprofessor, 
    p.nome from curso as c
left join disciplina as d 
on (c.idcurso = d.fk_idcurso)
left join professor as p 
on (d.fk_idprofessor = p.idprofessor);

-- chamar a view
select * from vw_rel_curso_disciplinas_professores;

-- aplicando filtro
select * from vw_rel_curso_disciplinas_professores
where idprofessor = 3;

-- realizando soma
select curso, sum(carga_horaria) as total 
from vw_rel_curso_disciplinas_professores
where idcurso = 1;

-- concatenar
select curso, concat(sum(carga_horaria),' hr') as total 
from vw_rel_curso_disciplinas_professores
where idcurso = 1;

-- listando as view, dica impotante sempre utilizar de prefixo 
show tables;

-- consultar o conteudo de uma view (declaracao)
show create view universidade_x.vw_rel_curso_disciplinas_professores;

-- alterar uma view
alter view vw_rel_curso_disciplinas_professores as
select 
`c`.`idcurso` AS `idcurso`,
`c`.`descricao` AS `curso`,
`d`.`descricao` AS `disciplina`,
`d`.`carga_horaria` AS `carga_horaria`,
`p`.`idprofessor` AS `idprofessor`,
`p`.`nome` AS `nome`,
`p`.`email` AS `email` 
from ((`curso` `c` 
left join `disciplina` `d` on((`c`.`idcurso` = `d`.`fk_idcurso`))) 
left join `professor` `p` on((`d`.`fk_idprofessor` = `p`.`idprofessor`)));

select * from vw_rel_curso_disciplinas_professores;

-- remover view

drop view vw_rel_curso_disciplinas_professores;

-- listar view

show tables;

-- aumentando nivel, view com chave composta, usando o operador and

use universidade_u;

create view vw_rel_alunos_cursos_contratos as 
select 
	a.idaluno,
    a.nome,
    c.idcurso,
    c.descricao as curso,
    co.idcontrato,
    co.fk_data_inscricao_curso as data_inscricao,
    co.valor_total_curso
from
	aluno as a
    left join aluno_curso as ac on (a.idaluno = ac.fk_idaluno)
    left join curso as c on (ac.fk_idcurso = c.idcurso)
    left join contrato as co on (
		ac.fk_idaluno = co.fk_idaluno 
        and ac.fk_idcurso = co.fk_idcurso 
		and ac.data_inscricao_curso = co.fk_data_inscricao_curso
	);
    
show tables;

use universidade_x;

-- view com joins 
select * from vw_rel_alunos_cursos_contratos as vw
left join telefone as t on (vw.idaluno = t.fk_idaluno)
left join endereco as e on (vw.idaluno = e.fk_idaluno);


select * from telefone where fk_idaluno in(1,2,3,4);

update telefone set fk_idaluno = 1 where fk_idaluno = 9;
update telefone set fk_idaluno = 2 where fk_idaluno = 7;

