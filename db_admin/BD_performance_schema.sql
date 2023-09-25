BD padrão - performance_schema
/*
Tabelas que armazenam informações de execução do servidor MySQL em baixo nivel, tais como:
Logs de eventos do servidor em tempo de execução
Desempenho(performance)
Conexões ativas de hosts e usuarios
*/

show databases;

use performance_schema;

show tables;

/* inspecionar as variáveis de sistema e variáveis de status */
select * from global_variables;
select * from global_status;

/* analisar os clientes conectados ao servidor bd */
select * from hosts;
select * from users;

-- Performance Schema Queries
SELECT THREAD_ID, NUMBER_OF_BYTES
       FROM performance_schema.events_waits_history
       WHERE EVENT_NAME LIKE 'wait/io/file/%'
       AND NUMBER_OF_BYTES IS NOT NULL;