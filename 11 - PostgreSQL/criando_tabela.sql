-- Criando tabela
CREATE TABLE aluno (
	id SERIAL,
	nome VARCHAR(255),
	cpf CHAR(11),
	observacao TEXT,
	idade INTEGER,
	dinheiro NUMERIC(10,2),
	altura REAL,
	ativo BOOLEAN,
    data_nascimento DATE,
    hora_aula TIME,
    matriculado_em TIMESTAMP
);

-- Verificado tabela 
SELECT * FROM aluno;


-- Inserindo valores na tabela
INSERT INTO aluno (
    nome,
    cpf,
    observacao,
    idade,
    dinheiro,
    altura,
    ativo,
    data_nascimento,
    hora_aula,
    matriculado_em
)
VALUES (
    'Diogo',
    '12345678901',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ac dui et nisl vestibulum consequat.',
	35,
    100.50,
    1.81,
    TRUE,
    '1984-08-27',
    '17:30:00',
    '2020-02-08 12:32:45'
);

-- Atualizando dados na tabela
UPDATE aluno
SET nome = 'Diogo',
    cpf = '10987654321',
    observacao = 'Teste',
    idade = 38,
    dinheiro = 15.23,
    altura = 1.90,
    ativo = FALSE,
    data_nascimento = '1980-01-15',
    hora_aula = '13:00:00',
    matriculado_em = '2020-01-02 15:00:00'
WHERE id = 1; 

-- Esplicitando campos a serem selecionados
SELECT nome AS "Nome do Aluno",
       idade,
       matriculado_em AS quando_se_matriculou
FROM aluno;

-- Inserindo mais dados
INSERT INTO aluno (nome) VALUES ('Vinícius Dias');
INSERT INTO aluno (nome) VALUES ('Nico Steppat');
INSERT INTO aluno (nome) VALUES ('João Roberto');
INSERT INTO aluno (nome) VALUES ('Diego');

-- Usando filtros
SELECT *
    FROM aluno
 WHERE nome = 'Diogo';

SELECT * 
    FROM aluno
WHERE nome LIKE 'Di_go';

SELECT * 
    FROM aluno
 WHERE nome LIKE 'D%';

SELECT * 
    FROM aluno
 WHERE nome LIKE '% %';

SELECT * 
    FROM aluno
 WHERE nome LIKE '%i%a%';


SELECT *
FROM aluno
WHERE cpf IS NULL;


-- Operadores para valores numéricos 
SELECT *
FROM aluno
WHERE idade = 35;

SELECT *
FROM aluno
WHERE idade BETWEEN 10 AND 20;

-- Uso do AND e OR
SELECT *
FROM aluno
WHERE nome LIKE 'D%'
	AND cpf IS NOT NULL;
	
SELECT *
FROM aluno
WHERE nome LIKE 'D%'
	AND cpf IS NOT NULL;




-- Craindo tabela com chave primária
DROP TABLE aluno;

CREATE TABLE curso (
    id INTEGER PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);

INSERT INTO curso (id, nome) VALUES (1, 'HTML');
INSERT INTO curso (id, nome) VALUES (2, 'Javascript');

DROP TABLE aluno;
-- Criando tabela de exemplo
CREATE TABLE aluno (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);

INSERT INTO aluno (nome) VALUES ('Diogo');
INSERT INTO aluno (nome) VALUES ('Vinícius');
INSERT INTO aluno_curso VALUES (2,2);
INSERT INTO aluno (nome) VALUES ('Nico');

CREATE TABLE aluno_curso (
    aluno_id INTEGER,
    curso_id INTEGER,
    PRIMARY KEY (aluno_id, curso_id),
    FOREIGN KEY (aluno_id) REFERENCES aluno (id),
    FOREIGN KEY (curso_id) REFERENCES curso (id)
);

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (1,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (3,1); 
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (1,3);

-- Usando JOIN
SELECT *
FROM aluno
JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id;



SELECT aluno.nome as "Nome do Aluno",
       curso.nome as "Nome do Curso"
FROM aluno
JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
JOIN curso ON curso.id = aluno_curso.curso_id


INSERT INTO curso (id, nome) VALUES (3, 'CSS');

-- LEFT, RIGHT, CROSS e FULL JOINS
SELECT aluno.nome as "Nome do Aluno",
	curso.nome as "Nome do Curso"
FROM aluno
LEFT JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
LEFT JOIN curso ON curso.id = aluno_curso.curso_id



-- CASCADE

DROP TABLE aluno_curso;

CREATE TABLE aluno_curso (
    aluno_id INTEGER,
    curso_id INTEGER,
    PRIMARY KEY (aluno_id, curso_id),
    FOREIGN KEY (aluno_id) REFERENCES aluno (id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
    FOREIGN KEY (curso_id) REFERENCES curso (id)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (1,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (3,1); 
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (1,3);

SELECT * FROM aluno_curso;

SELECT aluno.nome as "Nome do Aluno",
       curso.nome as "Nome do Curso"
FROM aluno
JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
JOIN curso ON curso.id = aluno_curso.curso_id

DELETE FROM aluno WHERE id = 1;

UPDATE aluno
SET id = 20
WHERE id = 2;

SELECT aluno.nome as "Nome do Aluno",
       curso.nome as "Nome do Curso"
FROM aluno
JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
JOIN curso ON curso.id = aluno_curso.curso_id

SELECT * FROM aluno_curso;


-- Ordenando as consultas

CREATE TABLE funcionarios(
    id SERIAL PRIMARY KEY,
    matricula VARCHAR(10),
    nome VARCHAR(255),
    sobrenome VARCHAR(255)
);

INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M001', 'Diogo', 'Mascarenhas');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M002', 'Vinícius', 'Dias');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M003', 'Nico', 'Steppat');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M004', 'João', 'Roberto');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M005', 'Diogo', 'Mascarenhas');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M006', 'Alberto', 'Martins');

SELECT * 
FROM funcionarios
ORDER BY nome;

SELECT *
FROM funcionarios
ORDER BY 4 DESC, nome DESC, 2

SELECT 
    aluno.id as aluno_id,
    aluno.nome as "Nome do Aluno",
    curso.id as "curso_id",
    curso.nome as "Nome do Curso"
FROM aluno
JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
JOIN curso ON curso.id = aluno_curso.curso_id
ORDER BY curso.nome, aluno.nome


-- Limitando a consulta

SELECT *
FROM funcionarios
ORDER BY nome
LIMIT 5;

SELECT *
FROM funcionarios
ORDER BY id
LIMIT 5
OFFSET 1;


-- Agrupamentos

select * from aluno_curso;

select *
from aluno
join aluno_curso on aluno.id = aluno_curso.aluno_id
join curso on curso.id = aluno_curso.curso_id
















