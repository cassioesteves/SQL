-- Alterando a senha de usuários

/* alterando registros de usuários */

/* 1 - senha antiga = 1234 */
set password for joao@'localhost' = '4321';
/* 2 - senha antiga = 4321 */
alter user joao@'localhost' identified by 'abcd';