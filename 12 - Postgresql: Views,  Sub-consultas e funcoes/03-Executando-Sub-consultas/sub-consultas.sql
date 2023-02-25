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


















