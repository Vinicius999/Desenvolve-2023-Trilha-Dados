-- Criando schema
CREATE SCHEMA clube_do_livro;


-- Criando tabelas
CREATE TABLE livros (
	id_livro INT NOT NULL,
    nome_livro VARCHAR(100) NOT NULL,
    autorIa VARCHAR(100) NOT NULL,
    editora VARCHAR(100) NOT NULL,
    categoria VARCHAR(100) NOT NULL,
    preço DECIMAL(5, 2) NOT NULL,
    PRIMARY KEY (id_livro)
);

CREATE TABLE estoque (
	id_livro INT NOT NULL,
    qtd_estoque INT NOT NULL,
    PRIMARY KEY(id_livro)
);

CREATE TABLE vendas (
	id_pedido INT NOT NULL,
    id_vendedor INT NOT NULL,
    id_livro INT NOT NULL,
    qtd_venda INT NOT NULL,
    data_venda DATE NOT NULL,
    PRIMARY KEY (id_vendedor, id_pedido)
);

CREATE TABLE vendedores (
	id_vendedor INT NOT NULL,
    nome_vendedor VARCHAR(255) NOT NULL,
    PRIMARY KEY(id_vendedor)
);


-- Alterando tabelas e adicionando relações (CHAVES ESTRANGEIRAS)
ALTER TABLE estoque ADD CONSTRAINT ce_estoque_livros
FOREIGN KEY (id_livro) REFERENCES livros (id_livro)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE vendas ADD CONSTRAINT ce_vendas_livros
FOREIGN KEY (id_livro) REFERENCES livros (id_livro)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE vendas ADD CONSTRAINT ce_vendas_vendedores
FOREIGN KEY (id_vendedor) REFERENCES vendedores (id_vendedor)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

/*
-- DICA
CREATE TABLE vendas (
	id_pedido INT NOT NULL PRIMARY KEY,
	id_vendedor INT NOT NULL REFERENCES vendedores(id_vendedor),
	id_livro INT NOT NULL,
	qtd_venda INT NOT NULL,
    data_venda INT NOT NULL,
	FOREIGN KEY (id_livro) REFERENCES livros(id_livro)
);
*/
