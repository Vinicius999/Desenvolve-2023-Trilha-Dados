-- Criando views

CREATE VIEW vw_cursos_por_categoria AS
	SELECT
		cat.nome categoria,
		COUNT(c.nome) numero_cursos
	FROM categoria cat
	JOIN curso c ON c.categoria_id = cat.id
	GROUP BY (1)
	
SELECT categoria
FROM vw_cursos_por_categoria
WHERE numero_cursos > 3;



CREATE VIEW vw_cursos_programacao AS
	SELECT
		c.nome as curso,
		ca.nome as categoria
	FROM curso c
	JOIN categoria ca ON c.categoria_id = ca.id
	WHERE ca.nome = 'Programação';
	
	
SELECT * FROM vw_cursos_programacao WHERE curso = 'PHP';

-- SELECT com VIEW usando JOIN 
SELECT
	cat.id categoria_id,
	vw_c.*
FROM vw_cursos_por_categoria vw_c
JOIN categoria cat ON vw_c.categoria = cat.nome





	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

