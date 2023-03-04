
-- Recebendo parâmetros
CREATE OR REPLACE FUNCTION soma_dois_valores(n1 INTEGER, n2 INTEGER) RETURNS INTEGER AS $$
	BEGIN
		RETURN n1 + n2;
	END;
$$ LANGUAGE plpgsql;

-- Escrevendo a mesma função sem parâmetros: usa-se o sinal de $ seguido da posição do parâmetro
DROP FUNCTION soma_dois_valores;
CREATE FUNCTION soma_dois_valores(INTEGER, INTEGER) RETURNS INTEGER AS $$
	DECLARE
		soma INTEGER DEFAULT $1 + $2;
	BEGIN
		RETURN soma;
	END;
$$ LANGUAGE plpgsql;

SELECT soma_dois_valores(3, 7);



-- Detalhes sobre funções
CREATE TABLE a (nome VARCHAR(255) NOT NULL);

-- Podemos usar $$ $$ para delimitar uma string
-- `OR REPLACE` Os tipos (tanto dos parâmetros quanto do retorno) não podem ser diferentes
-- O retorno da função é a 1ª linha da última query
CREATE OR REPLACE FUNCTION cria_a(nome VARCHAR) RETURNS void AS $$
	BEGIN
		INSERT INTO a (nome) VALUES (cria_a.nome);
	END;
$$ LANGUAGE plpgsql;

SELECT cria_a('Raquel Lima');
-- Verificando
SELECT * FROM a;


CREATE OR REPLACE FUNCTION dobro_do_salario(instrutor) RETURNS DECIMAL AS $$
	BEGIN
		RETURN $1.salario * 2 AS dobro;
	END;
$$ LANGUAGE plpgsql;

SELECT nome, dobro_do_salario(instrutor.*) AS novo_salario
FROM instrutor;


-- Função retorna linha da tabela
CREATE OR REPLACE FUNCTION cria_instrutor_falso() RETURNS instrutor AS $$
	BEGIN
		RETURN ROW(22, 'Nome falso', 200::DECIMAL)::instrutor;
	END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION cria_instrutor_falso() RETURNS instrutor AS $$
	DECLARE
		retorno instrutor;
	BEGIN
		SELECT 22, 'Nome falso', 200::DECIMAL INTO retorno;
		RETURN retorno;
	END;
$$ LANGUAGE plpgsql;

SELECT id, salario FROM cria_instrutor_falso();


-- Retornando conjuntos de linhas

CREATE OR REPLACE FUNCTION instrutores_bem_pagos(valor_salario DECIMAL) RETURNS SETOF instrutor AS $$
	BEGIN
		RETURN QUERY SELECT * FROM instrutor WHERE salario > valor_salario;
	END;
$$ LANGUAGE plpgsql;

SELECT * FROM instrutores_bem_pagos(300);







-- RETURNING: recuperar/verificar dados após inserir ou atualizar um registro, sem usar SELECT.
-- Exemplo 1
CREATE TABLE users (firstname text, lastname text, id serial primary key);

INSERT INTO users (firstname, lastname) VALUES ('Joe', 'Cool') RETURNING id, firstname;

-- Exemplo 2
UPDATE products
SET price = price * 1.10
WHERE price <= 99.99
RETURNING name, price AS new_price;

-- Exemplo 3
DELETE FROM products
WHERE obsoletion_date = 'today'
RETURNING *;
















