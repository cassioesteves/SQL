150. Variáveis de Sistema - Variáveis de sessão

-- comandos
show global variables;
show session variables;

/*
	auto_increment 
*/

show global variables where variable_name like 'auto_increment%';
show session variables where variable_name like 'auto_increment%';
/* auto_increment_increment -> incremento feito a cada novo registro */
/* auto_increment_offset -> valor inicial das colunas que recebem a constraint auto_increment */

/*
	----
*/

-- comando para acessar o mysql atraves do CMD 
mysql -u root -p --port=3306
-- abrir o cmd no caminho do banco ex:
'C:\Program Files\MySQL\MySQL Server 8.0\bin'

-- valores padroes:
set @@session.auto_increment_increment = 1;
set session auto_increment_offset = 1;

-- valores alterado;
set @@session.auto_increment_increment = 10;
set session auto_increment_offset = 5;

use universidade_u;

create table t1(
	id int primary key auto_increment,
    msg varchar(200)
);

select * from t1;
insert into t1(msg)value('a');
insert into t1(msg)value('b');

create table t2(
	id int primary key auto_increment,
    msg varchar(200)
);

select * from t2;
insert into t2(msg)value('a');
insert into t2(msg)value('b');