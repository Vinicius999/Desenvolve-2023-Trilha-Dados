-- Aluno cadastrado em mais cursos
SELECT
	a.primeiro_nome "Nome",
	a.ultimo_nome "Sobrenome",
	COUNT(ac.curso_id) "Qtd curso"
FROM aluno AS a
JOIN aluno_curso AS ac ON a.id = ac.aluno_id
GROUP BY 1, 2
ORDER BY "Qtd curso" DESC
LIMIT 1;

-- Curso com mais alunos cadastrados
SELECT 
	c.nome,
	COUNT(aluno_id) "Nº de alunos"
	--COUNT()
FROM curso c
JOIN aluno_curso ac ON c.id = ac.curso_id
GROUP BY 1
ORDER BY "Nº de alunos" DESC
LIMIT 1;




















