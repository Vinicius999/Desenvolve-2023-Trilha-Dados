-- FUNÇÕES DE STRING

-- Concartenando strings
SELECT (primeiro_nome || ' ' || ultimo_nome) AS nome_completo FROM aluno;

-- `CONCAT`: Ignora valores NULL
SELECT CONCAT(primeiro_nome, ' ', ultimo_nome, NULL) FROM aluno;

-- `UPPER`: Deixando tudo em maiúsculo
SELECT UPPER( CONCAT(primeiro_nome, ' ', ultimo_nome) || '     ') FROM aluno;

-- `TRIM`: Remove os espaços no início e no fim
SELECT TRIM(UPPER( CONCAT(primeiro_nome, ' ', ultimo_nome)) || '     ') FROM aluno;



-- FUNÇÕES DE DATA

-- `::` Conversão de um tipo para o outro 
SELECT
	(primeiro_nome || ' ' || ultimo_nome) AS nome_completo,
	NOW()::DATE - data_nascimento AS idade
FROM aluno;

-- Calculando a idade e formatando como STRING
SELECT
	(primeiro_nome || ' ' || ultimo_nome) AS nome_completo,
	((NOW()::DATE - data_nascimento) / 365)::VARCHAR(2) || ' anos' AS idade
FROM aluno;

-- `AGE`: Calculando idade a partir de data de nascimento
SELECT
	(primeiro_nome || ' ' || ultimo_nome) AS nome_completo,
	AGE(data_nascimento) AS idade
FROM aluno;

-- `EXTRACT`: Extraindo o ano de uma data
SELECT
	(primeiro_nome || ' ' || ultimo_nome) AS nome_completo,
	EXTRACT( YEAR FROM AGE(data_nascimento)) AS idade
FROM aluno;



-- FUNÇÕES MATEMÁTIVAS

SELECT pi();

SELECT @ -45.678;

SELECT cos( pi()/3 );

SELECT sin(radians (30));



-- CONVERSÃO DE TIPOS
SELECT TO_CHAR(NOW(), 'DD')

SELECT TO_CHAR(NOW(), 'DD,  MONTH, YYYY')

SELECT TO_CHAR(128.3::REAL,'9999D99');
SELECT 128.3::NUMERIC(5,2);
















