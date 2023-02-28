-- Criando função
CREATE OR REPLACE FUNCTION primeira_funcao() RETURNS INTEGER AS '
    SELECT (5 - 3) * 2
' LANGUAGE SQL;

-- Quando temos uma função que retorna um valor, podemos tratar a achamada dessa função
-- como um valor normal, como uma coluna qualquer
SELECT * NUMERO FROM primeira_funcao() AS numero;



-- Recebendo parâmetros
CREATE FUNCTION soma_dois_valores(n1 INTEGER, n2 INTEGER) RETURNS INTEGER AS '
	SELECT n1 + n2;
' LANGUAGE SQL;

-- Escrevendo a mesma função sem parâmetros: usa-se o sinal de $ seguido da posição do parâmetro
DROP FUNCTION soma_dois_valores;
CREATE FUNCTION soma_dois_valores(INTEGER, INTEGER) RETURNS INTEGER AS '
	SELECT $1 + $2;
' LANGUAGE SQL;

SELECT soma_dois_valores(3, 7);



-- Detalhes sobre funções
CREATE TABLE a (nome VARCHAR(255) NOT NULL);

-- Podemos usar $$ $$ para delimitar uma string
-- `OR REPLACE` Os tipos (tanto dos parâmetros quanto do retorno) não podem ser diferentes
-- O retorno da função é a 1ª linha da última query
CREATE OR REPLACE FUNCTION cria_a(nome VARCHAR) RETURNS void AS $$
	INSERT INTO a (nome) VALUES (cria_a.nome);
$$ LANGUAGE SQL;

SELECT cria_a('Vinicius Silva');

SELECT * FROM a;


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












