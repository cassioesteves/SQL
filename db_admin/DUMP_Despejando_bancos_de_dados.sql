-- DUMP - Despejando bancos de dados

show global variables where variable_name = 'datadir';

/*

C:\Program Files\MySQL\MySQL Server 8.0\bin>mysqldump -u root -p --port=3306 --no-data universidade_x

caso exista mais de um banco podemos coloca-los seguido de ,

C:\Program Files\MySQL\MySQL Server 8.0\bin>mysqldump -u root -p --port=3306 --no-data universidade_x, banco1, banco2

Ou fazer para todos usando a classe --all

C:\Program Files\MySQL\MySQL Server 8.0\bin>mysqldump -u root -p --port=3306 --no-data --all

*/
