/*
Converter a primeira letra de cada palavra em mai�scula normalmente, 
n�o queremos que todas as letras em uma string sejam convertidas em letras min�sculas ou min�sculas. 
Suponha que queremos que a primeira letra de cada palavra em um texto esteja em mai�scula 
e todos os demais caracteres devem estar em min�sculas.

Por exemplo, suponha que temos a seguinte string, e todas as letras s�o mai�sculas.

CORES: - AZUL, VERDE, AMARELO, VERMELHO

Queremos converter este texto no seguinte formato.

Cores: - Azul, Verde, Amarelo, Vermelho

N�o temos a fun��o SQL para fazer essa tarefa para n�s. 
Voc� precisa escrever uma fun��o personalizada para isso. 
Execute o seguinte script para criar uma fun��o.
*/


CREATE OR ALTER FUNCTION [dbo].[c](@Text VARCHAR(5000)) RETURNS VARCHAR(5000) AS BEGIN
	DECLARE @Index INT;
	DECLARE @FirstChar CHAR(1);
	DECLARE @LastChar CHAR(1);
	DECLARE @String VARCHAR(5000);
	SET @String = LOWER(@Text);
	SET @Index = 1;
WHILE @Index <= LEN(@Text)
	BEGIN
		SET @FirstChar = SUBSTRING(@Text, @Index, 1);
		SET @LastChar = CASE
WHEN @Index = 1
	THEN ' '
	ELSE SUBSTRING(@Text, @Index - 1, 1)
END;
	IF @LastChar IN(' ', ';', ':', '!', '?', ',', '.', '_', '-', '/', '&', '''', '(', '#', '*', '$', '@')
	BEGIN
	IF @FirstChar != ''''
	OR UPPER(@FirstChar) != 'S'
	SET @String = STUFF(@String, @Index, 1, UPPER(@FirstChar));
END;
	SET @Index = @Index + 1;
END;
RETURN @String;
END;
GO

Select [dbo].[ConverterPrimeiraLetraemMaiuscula] ('CORES: - AZUL, VERDE, AMARELO, VERMELHO') as	'Convertido'
Cores: - Azul, Verde, Amarelo, Vermelho