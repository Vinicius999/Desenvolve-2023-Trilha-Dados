SELECT * FROM academico.curso;

UPDATE academico.curso SET nome = 'PHP Básico' WHERE id = 4;
UPDATE academico.curso SET nome = 'Java Básico' WHERE id = 5;
UPDATE academico.curso SET nome = 'C++ Básico' WHERE id = 6;

-- UPDATE com base em outra tabela

SELECT * FROM teste.cursos_programacao ORDER BY id_curso;

UPDATE teste.cursos_programacao
SET nome_curso = nome
FROM academico.curso
WHERE teste.cursos_programacao.id_curso = academico.curso.id AND
	  academico.curso.id < 10;


-- DELETE com base em outra tabela 

DELETE
1FROM curso
USING categoria
WHERE categoria.id = curso.categoria_id	AND 
	  categoria.nome = 'Teste';






























