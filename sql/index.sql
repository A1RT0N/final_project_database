-- Criação de hash index na tabela Aluno para a coluna CidadeEnd
CREATE INDEX index_aluno_cidade_hash ON Aluno USING HASH (CidadeEnd);

EXPLAIN ANALYZE 
SELECT * FROM Aluno
WHERE CidadeEnd = 'Cidade 789';


-- Criação de árvore B index na tabela Turma para a coluna ValorTotalMatricula
CREATE INDEX index_turma_valor_btree ON Turma USING BTREE (ValorTotalMatricula);

EXPLAIN ANALYZE 
SELECT * FROM Turma
WHERE ValorTotalMatricula > 40000;


-- Criação de árvore B index na tabela Mensagem para a coluna Timestamp
CREATE INDEX index_mensagem_timestamp_btree ON Mensagem USING BTREE (Timestamp);

EXPLAIN ANALYZE 
SELECT id, Timestamp::date as date, Texto, tipo
FROM Mensagem
WHERE Timestamp >= NOW() + INTERVAL '100 days'
  AND Timestamp <= NOW() + INTERVAL '2200 days'