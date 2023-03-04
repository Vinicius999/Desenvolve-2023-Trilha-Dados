-- RETURN NEXT: Essa instrução é utilizada quando precisamos retornar
-- múltiplas linhas de uma função PLpgSQL mas não temos uma query
-- para isso (senão poderíamos utilizar o RETURN QUERY).

CREATE OR REPLACE FUNCTION tabuada(numero INTEGER) RETURNS SETOF VARCHAR AS $$
	DECLARE
		multiplicador INTEGER DEFAULT 1;
	BEGIN
		LOOP
			RETURN NEXT CONCAT(numero, ' * ', multiplicador, ' = ', numero * multiplicador);
			multiplicador := multiplicador + 1;
			EXIT WHEN multiplicador = 11;
		END LOOP;
	END;
$$ LANGUAGE plpgsql;

SELECT tabuada(2);

-- WHILE
CREATE OR REPLACE FUNCTION tabuada(numero INTEGER) RETURNS SETOF VARCHAR AS $$
	DECLARE
		multiplicador INTEGER DEFAULT 1;
	BEGIN
		WHILE multiplicador < 11 LOOP
			RETURN NEXT CONCAT(numero, ' * ', multiplicador, ' = ', numero * multiplicador);
			multiplicador := multiplicador + 1;
		END LOOP;
	END;
$$ LANGUAGE plpgsql;

SELECT tabuada(2);

-- FOR
CREATE OR REPLACE FUNCTION tabuada(numero INTEGER) RETURNS SETOF VARCHAR AS $$
	BEGIN
		FOR multiplicador IN 1..10 LOOP
			RETURN NEXT CONCAT(numero, ' * ', multiplicador, ' = ', numero * multiplicador);
			multiplicador := multiplicador + 1;
		END LOOP;
	END;
$$ LANGUAGE plpgsql;

SELECT tabuada(2);


CREATE FUNCTION instrutor_com_salario(OUT nome VARCHAR, OUT salario_ok VARCHAR) RETURNS SETOF record AS $$ 
	DECLARE
		instrutor instrutor;
	BEGIN
		FOR instrutor IN SELECT * FROM instrutor LOOP
			nome := instrutor.nome;
			salario_ok := salario_ok(instrutor);
			
			RETURN NEXT;
		END LOOP;
	END;
$$ LANGUAGE plpgsql;

SELECT * FROM instrutor_com_salario();




















