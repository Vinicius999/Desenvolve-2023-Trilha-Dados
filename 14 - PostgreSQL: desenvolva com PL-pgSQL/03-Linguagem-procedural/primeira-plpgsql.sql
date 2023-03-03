-- Estrutura completa de uma plgsql:

-- `DECLARE`: Declaração de variáveis
-- `BEGIN`, `RETURN`, `END`: corpo da função
-- `DEFAULT`: utilizado apenas dentro do bloco DECLARE para informar o valor padrão de uma variável.

CREATE OR REPLACE FUNCTION primeira_pl() RETURNS INTEGER AS $$
	DECLARE 
		primeira_variavel INTEGER DEFAULT 3;
	BEGIN
		primeira_variavel := primeira_variavel * 2;
		RETURN primeira_variavel;
	END;
$$ LANGUAGE plpgsql;

SELECT primeira_pl();

-- Caso importante
CREATE OR REPLACE FUNCTION primeira_pl() RETURNS INTEGER AS $$
	DECLARE 
		primeira_variavel INTEGER DEFAULT 3;
	BEGIN
		primeira_variavel := primeira_variavel * 2;
		
		DECLARE -- uma variavel declarada num bloco interno deixa de existir ao fim desse bloco
			primeira_variavel INTEGER;
		BEGIN
			primeira_variavel := 7;
		END;
		
		RETURN primeira_variavel;
	END;
$$ LANGUAGE plpgsql;

SELECT primeira_pl();


























