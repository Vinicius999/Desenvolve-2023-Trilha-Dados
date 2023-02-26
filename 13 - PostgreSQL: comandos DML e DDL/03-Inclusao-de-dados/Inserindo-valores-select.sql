CREATE TEMPORARY TABLE cursos_programacao (
	id_curso INTEGER PRIMARY KEY,
	nome_curso VARCHAR(255) NOT NULL
);

INSERT INTO cursos_programacao
	SELECT
		c.id,
		c.nome
	FROM academico.curso c
	JOIN academico.categoria ca ON c.categoria_id = ca.id
	WHERE ca.nome = 'Programação';
	
	
SELECT * FROM cursos_programacao;