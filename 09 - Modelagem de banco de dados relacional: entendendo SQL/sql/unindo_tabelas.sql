SELECT v.id_vendedor, v.nome_vendedor, SUM(p.qtd_venda)
FROM vendedores AS v, vendas as p
WHERE v.id_vendedor = p.id_vendedor
GROUP BY v.id_vendedor;

-- Usando INNER JOIN
SELECT v.id_vendedor, v.nome_vendedor, SUM(p.qtd_venda)
FROM vendedores AS v
INNER JOIN vendas AS p
ON v.id_vendedor = p.id_vendedor
GROUP BY v.id_vendedor;


# “Será que todos os livros da nossa base de dados foram vendidos?”
SELECT l.nome_livro, v.qtd_venda
FROM livros l
LEFT JOIN vendas v
ON v.id_livro = l.id_livro
WHERE qtd_venda IS NULL
ORDER BY v.qtd_venda;

-- Testando RIGHT JOIN
SELECT l.nome_livro, v.qtd_venda
FROM livros l
RIGHT JOIN vendas v
ON v.id_livro = l.id_livro
-- WHERE qtd_venda IS NULL
-- ORDER BY v.qtd_venda;




