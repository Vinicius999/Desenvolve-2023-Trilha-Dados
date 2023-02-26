DROP TABLE a;
CREATE TEMPORARY TABLE IF NOT EXISTS a (
	coluna1 VARCHAR(255) NOT NULL CHECK(coluna1 <> ''),
	coluna2 VARCHAR(255) NOT NULL,
	UNIQUE(coluna1, coluna2)
);

INSERT INTO a VALUES ('a', 'b');
INSERT INTO a VALUES ('a', 'c');

-- Renomeando nome da tabela
ALTER TABLE a RENAME TO teste;

-- Renomeando nome da coluna 
ALTER TABLE teste RENAME coluna1 TO primeira_coluna;
ALTER TABLE teste RENAME coluna2 TO segunda_coluna;

-- Adicionando uma nova coluna a uma tabela
ALTER TABLE teste ADD COLUMN nova_coluna VARCHAR(128);

SELECT * FROM teste;












