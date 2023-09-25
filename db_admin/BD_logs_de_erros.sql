-- Logs - Erros

/*
 ################## logs de erros
*/

show global variables where variable_name = 'log_error'; /* .\MYSQL-PC.err */
/* global read only */

show global variables where variable_name = 'datadir'; /* C:\ProgramData\MySQL\MySQL Server 8.0\Data\ */
/* global read only */

show global variables where variable_name = 'log_error_verbosity';
/* global dinâmica */

SET GLOBAL log_error_verbosity = 3;

/*
1 -> registrar apenas os logs de erros
2 -> registrar os logs de erros e os logs de avisos (alertas)
3 -> registrar os logs de erros, avisos (alertas) e notas (informações)
*/