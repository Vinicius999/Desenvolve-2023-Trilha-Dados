-- todos os registros da coluna
SELECT * FROM livros;


-- Selecionando coluna específica
SELECT id_livro FROM livros;

-- Selecionando coluna e dando apelido
SELECT id_livro as 'ID do Livro' FROM livros;


-- Aplicando filtos nas consultas 
SELECT * FROM livros
WHERE categoria = "Biografia";

SELECT * FROM livros
WHERE categoria = "Romance" AND preco < 48;

SELECT * FROM livros
WHERE categoria = "Poesia" AND 
	NOT (autoria = "Luís Vaz de Camões" OR autoria = "Gabriel Pedrosa");
    


SELECT * FROM vendas;

-- Valores distintos
SELECT DISTINCT id_livro FROM vendas;

SELECT DISTINCT id_livro FROM vendas
WHERE id_vendedor = 1
ORDER BY id_livro;


-- Alterando valores
-- Deletando
DELETE FROM livros
WHERE id_livro = 8;

-- Atualizando
UPDATE livros
SET preco = 0.9 * preco;

select * from livros;

/*
-- Turn OFF "Safe Update Mode" temporary
SET SQL_SAFE_UPDATES = 0;

SET SQL_SAFE_UPDATES = 1;
*/




