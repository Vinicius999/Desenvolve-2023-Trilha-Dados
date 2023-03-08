-- `EXCEPTION: Tratando erro
-- `RAISE EXCEPTION`: Lançar uma exceção
/*
WHEN nome_do_erro THEN
	RAISE EXCEPTION 'Mensagem de erro';  -- Cancela toda a execução da Trigger
*/
-- Podemos usar `OTHERS` pra pegar qualquer erro não especificado
-- WHEN SQLSTATE 'nº_codigo':  Podemos usar o código do erro >>>. 


CREATE OR REPLACE FUNCTION cria_instrutor() RETURNS TRIGGER AS $$
	DECLARE
		media_salario DECIMAL;
		total_instrutores INTEGER DEFAULT 0;
		instrutores_recebem_menos INTEGER DEFAULT 0;
		salario DECIMAL(10,2);
		percentual DECIMAL(10,2);
	BEGIN
		SELECT AVG(NEW.salario) INTO media_salario FROM instrutor WHERE id <> NEW.id;
		
		IF NEW.salario > media_salario THEN
			INSERT INTO log_instrutores (informacao) VALUES (NEW.nome || ' recebe acima da média');
		END IF;
		
		FOR salario IN SELECT instrutor.salario FROM instrutor WHERE id <> NEW.id LOOP
			total_instrutores := total_instrutores + 1;
			-- Para debugar, exibimos mensagens
			--RAISE NOTICE 'Salário inserido: %  Salaário o instrutor existente: %', NEW.salario, salario;
			IF NEW.salario > salario THEN
				instrutores_recebem_menos := instrutores_recebem_menos + 1;
			END IF;
		END LOOP;
		
		percentual := (instrutores_recebem_menos::DECIMAL / total_instrutores::DECIMAL) * 100;
		INSERT INTO log_instrutores (informacao, teste)
			VALUES (NEW.nome || ' recebe mais do que ' || percentual || '% da grade dos instrutores');
		
		RETURN NEW;
		
	-- Tratando erro
	EXCEPTION
		WHEN undefined_column THEN -- Podemos usar o código do erro >>>. WHEN SQLSTATE 'nº_codigo'
			RAISE NOTICE 'Algo de errado não está certo';
			RAISE EXCEPTION 'Erro complicado de resolver';  -- Cancela toda a execução da Trigger
		-- Trata exceção
		--WHEN raise_exception THEN
			--faz alguma coisa
	END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER cria_log_instrutor AFTER INSERT ON instrutor
	FOR EACH ROW EXECUTE FUNCTION cria_instrutor();



INSERT INTO instrutor (nome, salario) VALUES ('Maria', 5000);



select * from instrutor order by id;
select * from log_instrutores;


















