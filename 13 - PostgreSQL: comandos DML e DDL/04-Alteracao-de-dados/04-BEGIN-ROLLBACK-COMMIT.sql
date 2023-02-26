-- `BEGIN`: começa uma transação
-- `ROLLBACK`: desfaz a transação
BEGIN;
DELETE FROM teste.cursos_programacao;
ROLLBACK;

-- `BEGIN`: começa uma transação
-- `COMMIT`: Confirma a transação
BEGIN;
DELETE FROM teste.cursos_programacao;
COMMIT;



