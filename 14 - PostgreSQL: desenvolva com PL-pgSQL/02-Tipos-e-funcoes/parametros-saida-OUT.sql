-- Definindo retorno nos parâmetros
CREATE FUNCTION soma_e_produto (IN n1 INTEGER, IN n2 INTEGER, OUT soma INTEGER, OUT produto INTEGER) AS $$
	SELECT n1 + n2 AS soma, n1 * n2 AS produto;
$$ LANGUAGE SQL;

SELECT * FROM soma_e_produto (3, 3);

-- Outra maneira de fazer o mesmo (ACONSELHÁVEL)
CREATE TYPE dois_valores AS (soma INTEGER, produto INTEGER);

CREATE FUNCTION soma_e_produto_ (IN n1 INTEGER, IN n2 INTEGER) RETURNS dois_valores AS $$
	SELECT n1 + n2 AS soma, n1 * n2 AS produto;
$$ LANGUAGE SQL;

SELECT * FROM soma_e_produto_ (3, 3);


-- `RECORD`: Usado para retornar valores não definidos
CREATE FUNCTION instrutores_bem_pagos_(valor_decimal DECIMAL, OUT nome VARCHAR, OUT salario DECIMAL) RETURNS SETOF record AS $$
	SELECT nome, salario FROM instrutor WHERE salario > valor_decimal;
$$ LANGUAGE SQL;

SELECT * FROM instrutores_bem_pagos(300);




















