-- 162. Criando usuários

-- templade
create user <nome>@<host> identified by 'senha';

create user `cassio.esteves`@'localhost' identified by 'Abc12345';

-- user teste 

create user joao@'localhost' identified by '1234';

create user maria@'222.222.222.222' identified by '1234';

create user jose@'%' identified by '1234';

create user joao@'111.111.111.111' identified by '1234';

select * from mysql.user;

-- GRANT - Concedendo permissões

/*
https://dev.mysql.com/doc/refman/8.0/en/privileges-provided.html
*/
-- templade

grant <privilegios> on <banco.objetos to <usuarios>

create user joao@'111.111.111.111' identified by '1234';

show tables;

select * from mysql.user;

grant SELECT, INSERT on universidade_x.aluno to joao@'localhost';
-- ou 
grant SELECT on universidade_x.aluno to joao@'localhost';
grant INSERT on universidade_x.aluno to joao@'localhost';

show grants for joao@'localhost';
show grants for cesteves@'%';

# Grants for joao@localhost
'GRANT SELECT, INSERT, DELETE ON `universidade_x`.`aluno` TO `joao`@`localhost`'

# Grants for cesteves@%
'GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, RELOAD, SHUTDOWN, PROCESS, FILE, 
REFERENCES, INDEX, ALTER, SHOW DATABASES, SUPER, CREATE TEMPORARY TABLES, LOCK TABLES, 
EXECUTE, REPLICATION SLAVE, REPLICATION CLIENT, CREATE VIEW, SHOW VIEW, CREATE ROUTINE, 
ALTER ROUTINE, CREATE USER, EVENT, TRIGGER, CREATE TABLESPACE ON *.* TO `cesteves`@`%` WITH GRANT OPTION'

use universidade_x;

-- Ex de conexão com um novo user

C:\Program Files\MySQL\MySQL Server 8.0\bin>mysql -u joao -p  --port=3306
Enter password: ****
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 16
Server version: 8.0.29 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql>

-- teste de insert user joao

INSERT INTO `aluno` (`sexo`, `email`, `nome`, `cpf`, `data_nascimento`) VALUES 
('M', 'bugg@teste.com.br', 'Bugg', '412.523.637-89', '2000-01-01');
-- insert ok

-- teste delet
grant delete on universidade_x.aluno to joao@'localhost';


