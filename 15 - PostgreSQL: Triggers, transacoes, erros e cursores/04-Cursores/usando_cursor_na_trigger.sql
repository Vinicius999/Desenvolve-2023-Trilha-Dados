-- `EXCEPTION: Tratando erro
-- `RAISE EXCEPTION`: Lançar uma exceção
-- `ASSERT`: cancela a Trigger se a condição for false ou NULL

CREATE OR REPLACE FUNCTION cria_instrutor() RETURNS TRIGGER AS $$
	DECLARE
		media_salario DECIMAL;
		total_instrutores INTEGER DEFAULT 0;
		instrutores_recebem_menos INTEGER DEFAULT 0;
		salario DECIMAL(10,2);
		percentual DECIMAL(10,2);
		cursor_salarios refcursor;
	BEGIN
		SELECT AVG(NEW.salario) INTO media_salario FROM instrutor WHERE id <> NEW.id;
		
		IF NEW.salario > media_salario THEN
			INSERT INTO log_instrutores (informacao) VALUES (NEW.nome || ' recebe acima da média');
		END IF;
		
		SELECT instrutores_internos(NEW.id) INTO cursor_salarios;
		LOOP
			FETCH cursor_salarios INTO salario;
			EXIT WHEN NOT FOUND;
			total_instrutores := total_instrutores + 1;
			
			IF NEW.salario > salario THEN
				instrutores_recebem_menos := instrutores_recebem_menos + 1;
			END IF;
		END LOOP;
		
		percentual := (instrutores_recebem_menos::DECIMAL / total_instrutores::DECIMAL) * 100;
		ASSERT percentual < 100::DECIMAL, 'Instrutores novos não podem receber mais do que os antigo';
		
		INSERT INTO log_instrutores (informacao)
			VALUES (NEW.nome || ' recebe mais do que ' || percentual || '% da grade dos instrutores');
		
		RETURN NEW;
		
	END;
$$ LANGUAGE plpgsql;

DROP TRIGGER cria_log_instrutor ON instrutor;
CREATE TRIGGER cria_log_instrutor BEFORE INSERT ON instrutor
	FOR EACH ROW EXECUTE FUNCTION cria_instrutor();



INSERT INTO instrutor (nome, salario) VALUES ('João', 6000);



select * from instrutor order by id;
select * from log_instrutores;












