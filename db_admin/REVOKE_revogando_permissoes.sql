-- Revoke - Revogando permissões


show grants for joao@'localhost';

grant SELECT on universidade_u.aluno to joao@'localhost';
grant INSERT on universidade_u.aluno to joao@'localhost';
grant UPDATE on universidade_u.aluno to joao@'localhost';
grant DELETE on universidade_u.aluno to joao@'localhost';
grant ALTER on universidade_u.aluno to joao@'localhost';
grant DROP on universidade_u.aluno to joao@'localhost';
grant CREATE on universidade_u.aluno to joao@'localhost';

revoke DROP on universidade_u.aluno from joao@'localhost';
revoke DELETE on universidade_u.aluno from joao@'localhost';
