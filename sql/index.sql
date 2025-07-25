-- Criação de hash index na tabela Aluno para a coluna CidadeEnd
CREATE INDEX index_aluno_cidade_hash ON Aluno USING HASH (CidadeEnd);

EXPLAIN (ANALYZE, BUFFERS, VERBOSE)  
SELECT * FROM Aluno
WHERE CidadeEnd = 'Cidade 789';


-- Criação de árvore B index na tabela Turma para a coluna ValorTotalMatricula
CREATE INDEX index_turma_valor_btree ON Turma USING BTREE (ValorTotalMatricula);

EXPLAIN (ANALYZE, BUFFERS, VERBOSE) 
SELECT * FROM Turma
WHERE ValorTotalMatricula > 40000;


-- Criação de árvore B index na tabela Mensagem para a coluna Timestamp
CREATE INDEX index_mensagem_timestamp_btree ON Mensagem USING BTREE (Timestamp);

EXPLAIN (ANALYZE, BUFFERS, VERBOSE) 
SELECT id, Timestamp::date as date, Texto, tipo
FROM Mensagem
WHERE Timestamp >= NOW() + INTERVAL '100 days'
  AND Timestamp <= NOW() + INTERVAL '2200 days'

-- Buscas para o tamanho das Tabelas e de seus Índices
SELECT 
    'turma' AS table_name,
    pg_size_pretty(pg_relation_size('turma')) AS tamanho_so_tabela,
    pg_size_pretty(pg_total_relation_size('turma')) AS tamanho_tabela_e_indice,
    pg_size_pretty(pg_indexes_size('turma')) AS tamanho_indice;

SELECT 
    'Mensagem' AS table_name,
    pg_size_pretty(pg_relation_size('Mensagem')) AS tamanho_so_tabela,
    pg_size_pretty(pg_total_relation_size('Mensagem')) AS tamanho_tabela_e_indice,
    pg_size_pretty(pg_indexes_size('Mensagem')) AS tamanho_indice;

SELECT 
    'Aluno' AS table_name,
    pg_size_pretty(pg_relation_size('Aluno')) AS tamanho_so_tabela,
    pg_size_pretty(pg_total_relation_size('Aluno')) AS tamanho_tabela_e_indice,
    pg_size_pretty(pg_indexes_size('Aluno')) AS tamanho_indice;
