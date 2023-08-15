-- Triggers (gatilho)

DDL - Create Table, Alter Table, Create Procedure, Create Function, etc - São eventos associado ao "Bando de Dados"
DML - Insert, Update, Delete - São eventos associados as "Tabelas"

As trigger no MySQL fica limitado somente as DML.

Sintase

CREATE TRIGGER <tgr_nome>
BEFORE/AFTER INSERT/DELETE/UPDATE ON <table>
FOR EACH ROW /*PARA CADA LINHA*/
BEGIN
	/*BLOCO DE CODIGO DA TRIGGER*/
END

-- TEMPO DA TRIGGER PARA CADA TABELA
TIME OF TRIGGER FOR EACH TABLE

BEFORE
	- INSERT
	- DELETE
    - UPDATE

AFTER
	- INSERT
	- DELETE
    - UPDATE
    
TABELAS TEMPORARIAS PARA CRIACAO DA TRIGGER NEW E OLD

TRIGGER BEFORE INSERT

CREATE 

use universidade_x;
use universidade_u;

create table funcionario_log(
	idfuncionario_log int auto_increment,
    fk_idmatricula int,
    data_log datetime default current_timestamp,
    tipo_log char(2) not null,
    funcao_antiga varchar(50),
    funcao_nova varchar(50),
    telefone_antigo varchar(20),
    telefone_novo varchar(20),
    constraint pk_idfuncionario_log primary key(idfuncionario_log),
    constraint fk_funcionario_funcionario_log foreign key(fk_idmatricula) references funcionario(idmatricula)
);

-- 133. Trigger: Before Insert

-- trigger before_insert
delimiter $$
create trigger tgr_before_insert_funcionario
before insert on funcionario
for each row
begin
	insert into funcionario_log(fk_idmatricula, tipo_log, funcao_antiga, funcao_nova, telefone_antigo, telefone_novo)
    values (null, 'BI', null, NEW.funcao, null, NEW.telefone);
end
$$
delimiter ;

select * from funcionario;
select * from funcionario_log;


-- insert teste
insert into funcionario(nome, funcao, telefone) values ('Alana', 'Assistente Administrativo', '11 98888-7777');

-- listar as trigger no banco de dados
show triggers;

-- instrução para recuperar a trigger / bloco logico para alteração
show create trigger universidade_x.tgr_before_insert_funcionario;

-- filtra as trigger no db
show triggers where `table` = 'funcionario';
-- 'shift + ``'

-- remover trigger
drop trigger universidade_x.tgr_before_insert_funcionario;

-- recriando a trigger novamente 

delimiter $$
CREATE TRIGGER `tgr_before_insert_funcionario` 
BEFORE INSERT ON `funcionario` 
FOR EACH ROW 
begin
 	insert into funcionario_log(fk_idmatricula, tipo_log, funcao_antiga, funcao_nova, telefone_antigo, telefone_novo)
values (null, 'BI', null, NEW.funcao, null, NEW.telefone);
end
$$
delimiter ;

-- 135. Trigger: After Insert

delimiter $$
CREATE TRIGGER `tgr_after_insert_funcionario` 
AFTER INSERT ON `funcionario` 
FOR EACH ROW 
begin
 	insert into funcionario_log(fk_idmatricula, tipo_log, funcao_antiga, funcao_nova, telefone_antigo, telefone_novo)
values (NEW.idmatricula,'AI', null, NEW.funcao, null, NEW.telefone);
end
$$
delimiter ;

insert into funcionario(nome, funcao, telefone) values('Elton', 'Auxiliar Contabil','11 3333-4444');

select * from funcionario;
select * from funcionario_log;

show triggers;

-- 136. Trigger: Before Delete

delimiter $$
CREATE TRIGGER `tgr_before_delete_funcionario` 
BEFORE DELETE ON `funcionario` 
FOR EACH ROW 
begin
 	insert into funcionario_log(fk_idmatricula, tipo_log, funcao_antiga, funcao_nova, telefone_antigo, telefone_novo)
values(NULL,'BD', OLD.funcao, null, OLD.telefone, null);
-- values (OLD.idmatricula,'DB', null, NEW.funcao, null, NEW.telefone);
end
$$
delimiter ;

-- deletar um registro

delete from funcionario where idmatricula = 1;

-- desabilitar e habilitar intregridade referencial, tabelas que possui FK para outra tableas sao protegida pelo SGBD

-- "desliga" as chaves estrangeiras da tabelas
set foreign_key_checks = 0;

-- "liga" as chaves estrangeiras da tabelas
set foreign_key_checks = 1;

-- 137. Refactoring da tabela "Funcionario" e "Funcionario LOG" parte 1

select * from funcionario_log;
select * from funcionario;

insert into funcionario(nome, funcao, telefone) 
values 
('Rubens','Assistente Administrativo','11 1111-1111'),
('Mônica','Gerente de Atendimento','22 2222-2222'),
('Marcelo','Técnico de Informatica','33 3333-3333');

-- incluir uma nova coluna 
alter table funcionario add column matricula int not null after idmatricula;

-- atualizar o valor de matricula com base em idmatricula 
/*receber dados de um columa*/
update funcionario set matricula = idmatricula;

-- remover constraints para remover a coluna idmatricula
alter table projeto_funcionario drop foreign key projeto_funcionario_ibfk_2;

-- localizar a constraint da tabela projeto_funcionario
show create table projeto_funcionario;

projeto_funcionario, CREATE TABLE `projeto_funcionario` (
  `fk_idcodigo` int NOT NULL,
  `fk_idmatricula` int NOT NULL,
  `horas_estimadas` int NOT NULL,
  `horas_realizadas` int DEFAULT NULL,
  PRIMARY KEY (`fk_idcodigo`,`fk_idmatricula`),
  KEY `projeto_funcionario_ibfk_2` (`fk_idmatricula`),
  CONSTRAINT `projeto_funcionario_ibfk_1` FOREIGN KEY (`fk_idcodigo`) REFERENCES `projeto` (`idcodigo`),
  CONSTRAINT `projeto_funcionario_ibfk_2` FOREIGN KEY (`fk_idmatricula`) REFERENCES `funcionario` (`idmatricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

-- localizar a constraint da tabela funcionario_log
show create table funcionario_log;

funcionario_log, CREATE TABLE `funcionario_log` (
  `idfuncionario_log` int NOT NULL AUTO_INCREMENT,
  `fk_idmatricula` int DEFAULT NULL,
  `data_log` datetime DEFAULT CURRENT_TIMESTAMP,
  `tipo_log` char(2) NOT NULL,
  `funcao_antiga` varchar(50) DEFAULT NULL,
  `funcao_nova` varchar(50) DEFAULT NULL,
  `telefone_antigo` varchar(20) DEFAULT NULL,
  `telefone_novo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idfuncionario_log`),
  KEY `fk_funcionario_funcionario_log` (`fk_idmatricula`),
  CONSTRAINT `fk_funcionario_funcionario_log` FOREIGN KEY (`fk_idmatricula`) REFERENCES `funcionario` (`idmatricula`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

-- remover constraints para remover a coluna idmatricula
alter table funcionario_log drop foreign key fk_funcionario_funcionario_log;


-- localizar a constraint da tabela funcionario
show create table funcionario;

funcionario, CREATE TABLE `funcionario` (
  `idmatricula` int NOT NULL AUTO_INCREMENT,
  `matricula` int NOT NULL,
  `nome` varchar(50) NOT NULL,
  `funcao` varchar(50) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `fk_idmatricula_supervisor` int DEFAULT NULL,
  PRIMARY KEY (`idmatricula`),
  KEY `fk_funcionario_supervisor` (`fk_idmatricula_supervisor`),
  CONSTRAINT `fk_funcionario_supervisor` FOREIGN KEY (`fk_idmatricula_supervisor`) REFERENCES `funcionario` (`idmatricula`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

-- remover constraints para remover a coluna idmatricula
alter table funcionario drop foreign key fk_funcionario_supervisor;

-- renomear a coluna idmatricula para id funcionario
alter table funcionario change fk_idmatricula_supervisor fk_idfuncionario_supervisor int;
alter table funcionario change idmatricula idfuncionario int auto_increment; 
alter table funcionario_log change fk_idmatricula fk_idfuncionario int;
alter table projeto_funcionario change fk_idmatricula fk_idfuncionario int;

desc funcionario;
desc funcionario_log;
desc projeto_funcionario;

-- recriar as constraints de relacionamento entre as tabelas 'fk_projeto_funcionario_funcionario'

alter table projeto_funcionario add constraint fk_projeto_funcionario_funcionario
foreign key(fk_idfuncionario) references funcionario(idfuncionario);

-- recriar as constraint de relacionamento entre as tabelas 'fk_funcionario_log_funcionario'

alter table funcionario_log add constraint fk_funcionario_log_funcionario
foreign key(fk_idfuncionario) references funcionario(idfuncionario);

-- autorelacionamento da tabela funcionario
alter table funcionario add constraint fk_idfuncionario_supervisor
foreign key(fk_idfuncionario_supervisor) references funcionario(idfuncionario);

-- 139. Trigger: After Delete

show triggers;
show create trigger tgr_before_delete_funcionario;

-- tgr_after_delete_funcionario
delimiter $$
CREATE TRIGGER tgr_after_delete_funcionario
AFTER DELETE ON `funcionario` 
FOR EACH ROW 
begin
 	insert into funcionario_log(matricula, tipo_log, funcao_antiga, funcao_nova, telefone_antigo, telefone_novo)
values(OLD.matricula,'AD', OLD.funcao, null, OLD.telefone, null);
end
$$
delimiter ;

drop trigger universidade_x.tgr_after_delete_funcionario

desc funcionario;
desc funcionario_log;
desc projeto_funcionario;

Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails
 (`universidade_x`.`funcionario_log`, CONSTRAINT `fk_funcionario_log_funcionario` FOREIGN KEY (`fk_idfuncionario`) REFERENCES `funcionario` (`idfuncionario`))


delete from funcionario where idfuncionario = 3;
delete from funcionario where idfuncionario = 5;
select * from funcionario;
select * from funcionario_log;

delete from funcionario_log where idfuncionario_log = 12;

alter table funcionario_log add column matricula int not null;
alter table funcionario_log modify column matricula int not null;
alter table funcionario_log modify column matricula int;

-- apagar as trigger contendo as colunas antes do refactoring
drop trigger universidade_x.tgr_before_insert_funcionario;
drop trigger universidade_x.tgr_after_insert_funcionario;
drop trigger universidade_x.tgr_before_delete_funcionario;

-- novas trigger corrigidas

-- tgr_before_insert_funcionario
delimiter $$
CREATE TRIGGER `tgr_before_insert_funcionario` 
BEFORE INSERT ON `funcionario` 
FOR EACH ROW 
begin
 	insert into funcionario_log(fk_idfuncionario, tipo_log, funcao_antiga, funcao_nova, telefone_antigo, telefone_novo)
values (null, 'BI', null, NEW.funcao, null, NEW.telefone);
end
$$
delimiter ;

-- tgr_after_insert_funcionario
delimiter $$
CREATE TRIGGER `tgr_after_insert_funcionario` 
AFTER INSERT ON `funcionario` 
FOR EACH ROW 
begin
 	insert into funcionario_log(fk_idfuncionario, tipo_log, funcao_antiga, funcao_nova, telefone_antigo, telefone_novo)
values (NEW.idmatricula,'AI', null, NEW.funcao, null, NEW.telefone);
end
$$
delimiter ;

-- tgr_before_update_funcionario
delimiter $$
CREATE TRIGGER `tgr_before_update_funcionario` 
BEFORE UPDATE ON `funcionario` 
FOR EACH ROW 
begin
 	insert into funcionario_log(matricula, tipo_log, funcao_antiga, funcao_nova, telefone_antigo, telefone_novo)
values(OLD.matricula,'BU', OLD.funcao, NEW.funcao, OLD.telefone, NEW.telefone);
-- values (OLD.idmatricula,'DB', null, NEW.funcao, null, NEW.telefone);
end
$$
delimiter ;

drop trigger universidade_x.tgr_before_update_funcionario;
drop trigger universidade_x.tgr_after_delete_funcionario;
show triggers;

update 
funcionario 
set telefone = '11 0000-1111'
where idfuncionario = 5;

select * from funcionario;
select * from funcionario_log;
desc funcionario_log;

use universidade_x;

set foreign_key_checks = 1;

-- 141. Trigger: After Update

-- add coluna salario na tabela funcionario

alter table funcionario add column salario float(9,2) not null after funcao;

-- add coluna salario na tabela funcionario_log
alter table funcionario_log add column salario_antigo float(9,2) not null after funcao_nova;
alter table funcionario_log add column salario_novo float(9,2) not null after salario_antigo;

alter table funcionario_log modify column salario_antigo float(9,2);
alter table funcionario_log modify column salario_novo float(9,2);

-- apagando as trigger

drop trigger universidade_x.tgr_before_update_funcionario;
drop trigger universidade_x.tgr_after_delete_funcionario;
show triggers;

-- tgr_before_update_funcionario
delimiter $$
CREATE TRIGGER `tgr_after_update_funcionario` 
AFTER UPDATE ON `funcionario` 
FOR EACH ROW 
begin
	insert into funcionario_log(matricula, tipo_log, funcao_antiga, funcao_nova, telefone_antigo, telefone_novo, salario_antigo, salario_novo)
values(OLD.matricula,'AU', OLD.funcao, NEW.funcao, OLD.telefone, NEW.telefone,OLD.salario, NEW.salario);
end
$$
delimiter ;


-- tgr_after_insert_funcionario
delimiter $$
CREATE TRIGGER `tgr_after_insert_funcionario` 
AFTER INSERT ON `funcionario` 
FOR EACH ROW 
begin
 	insert into funcionario_log(matricula, tipo_log, funcao_antiga, funcao_nova,telefone_antigo, telefone_novo,salario_antigo, salario_novo)
values (NEW.matricula,'AI', null, NEW.funcao, null, NEW.telefone, NEW.salario);
end
$$
delimiter ;

select * from funcionario;
select * from funcionario_log;

-- tgr_before_insert_funcionario
delimiter $$
CREATE TRIGGER `tgr_before_insert_funcionario` 
BEFORE INSERT ON `funcionario` 
FOR EACH ROW 
begin
 	insert into funcionario_log(matricula, tipo_log, funcao_antiga, funcao_nova,telefone_antigo, telefone_novo,salario_antigo, salario_novo)
values (null,'BI', null, NEW.funcao, null, NEW.telefone,null, NEW.salario);
end
$$
delimiter ;


select * from funcionario;
select * from funcionario_log;

set foreign_key_checks = 1;

insert into funcionario (matricula, nome, funcao, salario, telefone)
values 
(08,'Fulano','Programador Junior',4500.00,'55 5555-5555'),
(09,'Cicrano','Administrador de Bando de Dados Pleno',6000.00,'66 6666-6666'),
(10,'Beltrano','Suporte Tecnico JR',3500.00,'77 7777-7777');


drop trigger universidade_x.tgr_before_insert_funcionario;
drop trigger universidade_x.tgr_after_insert_funcionario;
show triggers;

update funcionario set matricula = idmatricula;

update
	funcionario
set
	funcao = 'Administrador de Bando de Dados Sr',
	telefone = '11 8888-7777',
    salario = 8500.00
where
	idfuncionario = 20
    
select * from funcionario;
select * from funcionario_log;
