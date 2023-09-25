-- Mudando o diretório de dados do MySQL

show global variables where variable_name = 'datadir';
# Variable_name, Value
'datadir', 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Data\\'
ou 
'C:\ProgramData\MySQL\MySQL Server 8.0\Data'

-- alterar o diretorio data
set global datadir = 'C:/mysql_dados/Data/';

show databases;
use universidade_x;
select * from aluno;
