CREATE SEQUENCE eu_criei;

CREATE TEMPORARY TABLE auto (
	id INTEGER PRIMARY KEY DEFAULT NEXTVAL('eu_criei'),
	nome VARCHAR(30) NOT NULL
)

INSERT INTO auto VALUES('Vinicius Silva')
INSERT INTO auto (id, nome) VALUES(2, 'Raquel Lima')
INSERT INTO auto (nome) VALUES('outro nome')

SELECT * FROM  auto;
