DROP FUNCTION instrutores_internos(integer);

CREATE OR REPLACE FUNCTION instrutores_internos(id_instrutor INTEGER) RETURNS refcursor AS $$
	DECLARE
		cursor_salarios refcursor;
	BEGIN
		OPEN cursor_salarios FOR SELECT instrutor.salario
								FROM instrutor
								WHERE id <> id_instrutor AND salario > 0;
	
		RETURN cursor_salarios;
	END;
$$ LANGUAGE plpgsql;


--MOVE LAST FROM cursor_salario INTO salario;
--MOVE FIRST FROM cursor_salario INTO salario;
--MOVE NEXT FROM cursor_salario INTO salario;
--MOVE PRIOR FROM cursor_salario INTO salario;
		
--FETCH LAST FROM cursor_salario INTO salario;
--FETCH FIRST FROM cursor_salario INTO salario;
--FETCH NEXT FROM cursor_salario INTO salario;
--FETCH PRIOR FROM cursor_salario INTO salario;

--CLOSE cursor_salario; -- FECHAR O CURSOR DEPOIS DAS MANIPULAÇÕES














