CREATE DATABASE alura;

CREATE SCHEMA academico;
DROP TABLE aluno, curso, aluno_curso, categoria CASCADE;

-- `IF NOT EXISTS`: Cria tabelas verificando se elas já existem
-- `DEFAULT`: Define um valor padrão caso não seja informado valor
-- `CHECK`: Impede que o valor da coluna seja uma determinado valor
-- `UNIQUE`: Impede que os valores de uma ou mais colunas tenham linhas com valores iguais

CREATE TABLE IF NOT EXISTS academico.aluno (
    id SERIAL PRIMARY KEY,
	primeiro_nome VARCHAR(255) NOT NULL DEFAULT 'Fulano',
	ultimo_nome VARCHAR(255) NOT NULL CHECK(ultimo_nome <> 'Sem nome'),
	data_nascimento DATE NOT NULL,
	UNIQUE(primeiro_nome, ultimo_nome)
);

CREATE TABLE IF NOT EXISTS academico.categoria (
    id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS academico.curso (
    id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	categoria_id INTEGER NOT NULL REFERENCES academico.categoria(id)
);

CREATE TABLE IF NOT EXISTS academico.aluno_curso (
	aluno_id INTEGER NOT NULL REFERENCES academico.aluno(id),
	curso_id INTEGER NOT NULL REFERENCES academico.curso(id),
	PRIMARY KEY (aluno_id, curso_id)
);


















CREATE TABLE aluno_curso (
	aluno_id INTEGER NOT NULL REFERENCES aluno(id),
	curso_id INTEGER NOT NULL REFERENCES curso(id),
	PRIMARY KEY (aluno_id, curso_id)
);

