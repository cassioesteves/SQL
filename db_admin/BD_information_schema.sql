BD padrão - information_schema (Dicionario de Dados)

/*
Tabelas que armazenam informações sobre os dados (metadados), tais como:
Nomes de banco de dados e tabelas
Tipos de dados das colunas e tabelas
Triggers e Views
*/

show databases;

use information_schema;

show tables;

/* mostrar as conexões abertas */
select
	*
from
	processlist;
    
/* detalhes sobre as tabelas */
select * from tables;
select * from tables where table_schema = 'universidade_u'  AND table_type = 'BASE TABLE';

select
	table_name as nome_tabela,
    table_rows as total_registros,
    auto_increment,
    table_comment as comentario,
    (data_length + index_length) as total_bytes,
    (((data_length + index_length) / 1024) / 1024) as total_megabytes
from
	tables
where
	table_schema = 'universidade_u'
    AND table_type = 'BASE TABLE'
order by
	total_bytes DESC;
    
/* tamanho dos bancos de dados */
select
	table_schema,
    round(sum(((data_length + index_length) / 1024) / 1024), 2) as total_megabytes
from
	tables
where
    table_type = 'BASE TABLE'
group by 
	table_schema
order by
	total_megabytes DESC;
    
select * from tables;
    
/* visualizar triggers e views */
select * from triggers;
select * from views;
