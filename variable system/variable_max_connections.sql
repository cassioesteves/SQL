variable_max_connections
/*
 148. Variáveis de Sistema - Mysqld e o arquivo de configuração de inicialização

ACESSAR A VARIAVEL DE SISTEMA PELO CMD ATRAVES DO COMANDO 

mysql --verbose --help

ACESSAR A VARIAVEL DE SISTEMA PELO WORKBENCH

Administration -> Status and System Variables -> System Varibles -> All

OU ATRAVES DE UMA QUERY

show variables; 

O CAMINHO DO my.ini pode ser localizado no services.msc em propriedades podemos obter o caminho 

ALTERAR AS VARIAVEIS GLOBAIS.
*/
-- ALTERAR O LIMITE DE CONEXOES NO BANCO

-- somente leitura
show variables;

show variables
where variable_name = 'max_connections';

show variables
where variable_name like 'max_conn%';

-- Alterar os parametros usando comando nas query com o comando set@@global

-- Dinâmicas e podem ser modificadas em tempo de execução.
set @@global.max_connections = 250;
-- ou
set global max_connections = 280;
















