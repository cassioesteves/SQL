-- Logs - Binários

/*
 ################## logs binários
	1 - backup
	2 - querys que afetaram registros no banco de dados
	3 - querys que afetaram registros no banco de dados
	4 - querys que afetaram registros no banco de dados
	5 - querys que afetaram registros no banco de dados
	6 - bd restaurado com base no backup do dia 1
*/

show global variables where variable_name = 'log_bin_basename'; /* WINDOWNS-PC-bin.<número sequencial*/
/* global_read_only */

show global variables where variable_name = 'log_bin'; /* ON | OFF */
/* global dinâmica */

/* banco de dados é iniciado */
/* bytes */

show global variables where variable_name = 'max_binlog_size'; /* bytes */
select (((1073741824 / 1024) / 1024) / 1024);
			-- bytes -- KB -- MB -- GB	
/* global dinâmica */

show global variables where variable_name = 'binlog_expire_logs_seconds'; /* segundos */
select (((2592000 / 60) / 60) / 24);
			-- min  -hr  --day 
/* global dinâmica */

show binary logs;

-- mysqlbinlog.exe para ler os arquivos bin log.
/*
EX:
C:\Program Files\MySQL\MySQL Server 8.0\bin>mysqlbinlog C:\ProgramData\MySQL\MySQL Server 8.0\Data\MYSQL-PC-bin.000023
-- diretorio do mysqlbinlog								-- diretorio dos bin log 					-- arquivo bin
*/