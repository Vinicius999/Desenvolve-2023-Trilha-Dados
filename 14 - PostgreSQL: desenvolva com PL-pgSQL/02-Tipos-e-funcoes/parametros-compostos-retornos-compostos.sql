-- Parâmetros compostos
CREATE TABLE instrutor (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	salario DECIMAL(10, 2)
);

INSERT INTO instrutor (nome, salario) VALUES ('Vinicius Silva', 100);
INSERT INTO instrutor (nome, salario) VALUES ('Raquel Lima', 101);
INSERT INTO instrutor (nome, salario) VALUES ('Neymar', 300);
INSERT INTO instrutor (nome, salario) VALUES ('Messi', 400);
INSERT INTO instrutor (nome, salario) VALUES ('CR7', 500);

-- Função recebe uma linha da tabela `instrutor` ( vários parâmetros)
CREATE FUNCTION dobro_do_salario(instrutor) RETURNS DECIMAL AS $$
	SELECT $1.salario * 2 AS dobro;
$$ LANGUAGE SQL;

SELECT nome, dobro_do_salario(instrutor.*) AS novo_salario
FROM instrutor;


-- Função retorna linha da tabela
CREATE FUNCTION cria_instrutor_falso() RETURNS instrutor AS $$
	SELECT 22, 'Nome falso', 200::DECIMAL;
$$ LANGUAGE SQL;

SELECT id, salario FROM cria_instrutor_falso();


-- Retornando conjuntos de linhas
CREATE OR REPLACE FUNCTION instrutores_bem_pagos(valor_decimal DECIMAL) RETURNS SETOF instrutor AS $$
	SELECT * FROM instrutor WHERE salario > valor_decimal;
$$ LANGUAGE SQL;

SELECT * FROM instrutores_bem_pagos(300);























