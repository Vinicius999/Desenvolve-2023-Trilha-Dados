DROP TABLE instrutor;
CREATE TABLE instrutor (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    salario DECIMAL(10, 2)
);
SELECT COUNT(*) FROM instrutor;
DO $$
    DECLARE
    BEGIN
        FOR i IN 1..1000000 LOOP
            INSERT INTO instrutor (nome, salario) VALUES ('Instrutor(a) ' || i, random() * 1000 + 1);
        END LOOP;
    END;
$$;
UPDATE instrutor SET salario = salario * 2 WHERE id % 2 = 1;
DELETE FROM instrutor WHERE id % 2 = 0;

VACUUM ANALYSE instrutor;
--VACUUM FULL ANALYSE instrutor;

SELECT relname, n_dead_tup FROM pg_stat_user_tables;
SELECT pg_size_pretty(pg_relation_size('instrutor')); 


ANALYSE;
REINDEX TABLE instrutor;
