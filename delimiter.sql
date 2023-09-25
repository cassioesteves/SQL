-- Alterar um delimitador para execução de um codigo de comando.
/*
Ao utilizar o DELIMITER, você diz ao mysql, onde seu script tem início, e onde encerra. 
O uso do Delimiter deve ser acompanhado de algum símbolo que seja reconhecido pelo mysql. 
O mais comum é utilizar dois cifrões ($). Com isto, o mysql irá entender 
que tudo que está entre os $$ deve ser executado.
*/
-- delimiter
delimiter $$
delemiter ;

-- exemplo


delimiter $$
create procedure porc_oi()
begin
	select 'Oi, você acabou de executar um procedimento que está armazenado no BD! Sempre que você precisar só me chamar.' as msg;       
end
$$
delemiter ;

call porc_oi()



-- Sintaxe de procedure
/*
delimiter $$
create procedure <proc_nome> (<parametros>)
	begin
		-- bloco de codigo do procedure
        intrução 1
        intrução 2
        intrução 3
        -- logica do procedimento
	end
	$$
delemiter ; 

call <proc_nome>(<parametros>)

importante ao criar procedure é alterar o delemiter no bloco de codigo
*/