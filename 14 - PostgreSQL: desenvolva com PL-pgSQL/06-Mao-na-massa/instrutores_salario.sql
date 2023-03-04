CREATE TABLE log_instrutores (
	id SERIAL PRIMARY KEY,
	informacao VARCHAR(255),
	momento_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE FUNCTION cria_instrutor(nome_instrutor VARCHAR, salario_instrutor DECIMAL) RETURNS void AS $$
	DECLARE
		id_instrutor_inserido INTEGER;
		media_salario DECIMAL;
		total_instrutores INTEGER DEFAULT 0;
		instrutores_recebem_menos INTEGER DEFAULT 0;
		salario DECIMAL(10,2);
		percentual DECIMAL(10,2);
	BEGIN
		INSERT INTO instrutor (nome, salario) VALUES (nome_instrutor, salario_instrutor) RETURNING id INTO id_instrutor_inserido;
		
		SELECT AVG(instrutor.salario) INTO media_salario FROM instrutor WHERE id <> id_instrutor_inserido;
		
		IF salario_instrutor > media_salario THEN
			INSERT INTO log_instrutores (informacao) VALUES (nome_instrutor || ' recebe acima da média');
		END IF;
		
		FOR salario IN SELECT instrutor.salario FROM instrutor WHERE id <> id_instrutor_inserido LOOP
			total_instrutores := total_instrutores + 1;
			
			IF salario_instrutor > salario THEN
				instrutores_recebem_menos := instrutores_recebem_menos + 1;
			END IF;
		END LOOP;
		
		percentual := (instrutores_recebem_menos::DECIMAL / total_instrutores::DECIMAL) * 100;
		INSERT INTO log_instrutores (informacao)
			VALUES (nome_instrutor || ' recebe mais do que ' || percentual || '% da grade dos instrutores');
	END;
$$ LANGUAGE plpgsql;


select * from instrutor order by id;
SELECT cria_instrutor('Outra instrutora', 400);
select * from log_instrutores;


















