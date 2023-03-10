
DROP FUNCTION cria_instrutor;

CREATE OR REPLACE FUNCTION cria_instrutor() RETURNS TRIGGER AS $$
	DECLARE
		media_salario DECIMAL;
		total_instrutores INTEGER DEFAULT 0;
		instrutores_recebem_menos INTEGER DEFAULT 0;
		salario DECIMAL(10,2);
		percentual DECIMAL(10,2);
	BEGIN
		SELECT AVG(NEW.salario) INTO media_salario FROM instrutor WHERE id <> NEW.id;
		
		BEGIN
		IF NEW.salario > media_salario THEN
			INSERT INTO log_instrutores (informacao) VALUES (NEW.nome || ' recebe acima da média');
		END IF;
		
		FOR salario IN SELECT instrutor.salario FROM instrutor WHERE id <> NEW.id LOOP
			total_instrutores := total_instrutores + 1;
			
			IF NEW.salario > salario THEN
				instrutores_recebem_menos := instrutores_recebem_menos + 1;
			END IF;
		END LOOP;
		
		percentual := (instrutores_recebem_menos::DECIMAL / total_instrutores::DECIMAL) * 100;
		INSERT INTO log_instrutores (informacao)
			VALUES (NEW.nome || ' recebe mais do que ' || percentual || '% da grade dos instrutores');
		COMMIT;
		
		RETURN NEW;
	END;
$$ LANGUAGE plpgsql;

drop trigger cria_log_instrutor on instrutor;

CREATE TRIGGER cria_log_instrutor AFTER INSERT ON instrutor
	FOR EACH ROW EXECUTE FUNCTION cria_instrutor();


INSERT INTO instrutor (nome, salario) VALUES ('Outra instrutor', 600);



select * from instrutor order by id;

SELECT cria_instrutor('Outra instrutor', 500);
select * from log_instrutores;


















