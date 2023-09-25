-- BD padrão - sys

show databases;

use sys;

show tables;

select * from information_schema.tables;

select * from information_schema.tables where table_schema = 'sys';

select * from host_summary_by_statement_latency;
select * from memory_global_total;                    
        