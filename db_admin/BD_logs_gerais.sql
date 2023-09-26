-- Logs - Consultas (logs gerais)

/*
 ################## logs gerais
*/

show global variables where variable_name = 'general_log_file'; /* .\MYSQL-PC.log */
/* global read only */

show global variables where variable_name = 'datadir'; /* C:\ProgramData\MySQL\MySQL Server 8.0\Data\ */
/* global read only */

show global variables where variable_name = 'general_log'; /* OFF = desativado / ON = ativado */
/* global dinâmica */

set @@global.general_log = 'ON';
set @@global.general_log = 'OFF';

select * from universidade_x.aluno;
use performance_schema;
