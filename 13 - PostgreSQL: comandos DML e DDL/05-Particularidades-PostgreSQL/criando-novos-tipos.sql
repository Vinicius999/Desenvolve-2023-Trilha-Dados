CREATE TYPE CLASSICACAO AS ENUM ('LIVRE', '12_ANOS', '14_ANOS', '16_ANOS', '18_ANOS');

DROP TABLE filme;

CREATE TEMPORARY TABLE filme (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	classificacao CLASSICACAO DEFAULT 'LIVRE'
);

INSERT INTO filme (nome, classificacao) VALUES ('Django Livre', '16_ANOS');
INSERT INTO filme (nome) VALUES ('O Auto da Compadecida');

SELECT * FROM filme;

