153. BD padrão - mysql

/*Tabelas que armazenam informações de funcionamento do MySQL, tais como:
Permissão de usuario
Status dos objetos como: tabelas, funções, procedures, puglins, etc.
Logs do sistema (general logs e slow logs)
Ajuda do sistema
Fusos horarios
*/

DB mysql
BD perfomance_schema
BD information_schema
DB sys

show databases;

use mysql;

show tables;

/* permissões de usuários */
select * from user;

/* estatísticas das tabelas do bd */
select * from innodb_table_stats;

select count(*) from universidade_u.aluno;
select count(*) from universidade_x.aluno;

/* logs */
select * from slow_log;
select * from general_log;

/* ajuda */
select * from help_topic;
select * from help_topic where name like 'JOIN%';