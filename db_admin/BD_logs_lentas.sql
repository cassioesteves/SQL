-- Consultas lentas

/*
 ################## logs de consultas lentas
*/

show global variables where variable_name = 'slow_query_log_file'; /* .\ MYSQL-PC-slow.log*/
/* global read only */

show global variables where variable_name = 'datadir'; /* 'C:\ProgramData\MySQL\MySQL Server 8.0\Data\' */
/* global read only */

show global variables where variable_name = 'slow_query_log'; /* ON -> ativo | OFF -> inativo */
/* global dinâmica */

show global variables where variable_name = 'long_query_time'; /* segundos */
/* global dinâmica */

set global long_query_time = 4;
set global long_query_time = 10.000000; -- default

--# Variable_name, Value
long_query_time, 10.000000

select sleep(5), 'Query muito lenta!!!';

select sleep(2), 'Query muito rapida!!!';