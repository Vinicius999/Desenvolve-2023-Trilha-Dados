SELECT * FROM curso WHERE categoria_id IN (1, 2)

-- Todos os cursos que estão em uma categoria que não tem espaços em branco no nome
SELECT curso.nome FROM curso
WHERE categoria_id IN (
	SELECT id, nome FROM categoria WHERE nome NOT LIKE '% %'
);

SELECT 
	c.nome curso,
	cat.nome categoria
FROM curso c
JOIN categoria cat ON c.categoria_id = cat.id
WHERE cat.nome NOT LIKE '% %';


-- Categoria com mais de 3 cursos 
SELECT categoria "Categoria"
FROM (
	SELECT
		cat.nome categoria,
		COUNT(c.nome) numero_cursos
	FROM categoria cat
	JOIN curso c ON c.categoria_id = cat.id
	GROUP BY (1)
) "sub1"
WHERE numero_cursos > 3


-- Reescrevendo query com HAVING e Subquery
  SELECT curso.nome,
         COUNT(aluno_curso.aluno_id) numero_alunos
    FROM curso
    JOIN aluno_curso ON aluno_curso.curso_id = curso.id
GROUP BY 1
  HAVING COUNT(aluno_curso.aluno_id) > 2
ORDER BY numero_alunos DESC;
   
   
SELECT a.curso, a.numero_alunos
FROM (
	SELECT
		c.nome curso,
		COUNT(ac.aluno_id) numero_alunos
	FROM curso c
	JOIN aluno_curso ac ON c.id = ac.curso_id 
	GROUP BY curso
) "a"
WHERE a.numero_alunos > 2
ORDER BY a.numero_alunos;


















