CREATE FUNCTION instrutores_internos(id_instrutores INTEGER) RETURNS ??? AS $$
	DECLARE
		cursor_salarios refcursor;
	BEGIN
		OPEN cursor_salario FOR SELECT instrutor.salario
								FROM instrutor
								WHERE id <> id_instrutor AND salario > 0;
		
		MOVE LAST FROM cursor_salario INTO salario;
		MOVE FIRST FROM cursor_salario INTO salario;
		MOVE NEXT FROM cursor_salario INTO salario;
		MOVE PRIOR FROM cursor_salario INTO salario;
		
		FETCH LAST FROM cursor_salario INTO salario;
		FETCH FIRST FROM cursor_salario INTO salario;
		FETCH NEXT FROM cursor_salario INTO salario;
		FETCH PRIOR FROM cursor_salario INTO salario;
		
		CLOSE cursor_salario; -- FECHAR O CURSOR DEPOIS DAS MANIPULAÇÕES
	
		RETURN cursor_salario;
	END;
$$ LANGUAGE plpgsql;