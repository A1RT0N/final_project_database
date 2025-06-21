-- Queries de Views (Exercício 8)

CREATE VIEW view_professor_responsavel_por_disciplina AS
SELECT 
    p.NomeCompleto AS professor_nome,
    p.Telefone AS professor_telefone,
    p.Email AS professor_email,
    p.Especializacao,
    p.Titulacao,
    d.Codigo AS disciplina_codigo,
    d.Nome AS disciplina_nome,
    d.AulasSema AS aulas_por_semana
FROM Professor p
INNER JOIN Responsabilidade r 
    ON p.NomeCompleto = r.NomeCompleto 
    AND p.Telefone = r.Telefone
INNER JOIN Disciplina d 
    ON r.CodigoDisciplina = d.Codigo;

SELECT * FROM view_professor_responsavel_por_disciplina LIMIT 20;

----------------------------------------

CREATE VIEW view_turmas_professor AS
SELECT 
    t.Id AS turma_id,
    p.NomeCompleto AS professor,
    p.Titulacao,
    CONCAT(pl.DiaLimite, '/', pl.MesLimite, '/',pl.ano) AS data_limite,
    t.CodigoDisc AS disciplina
FROM Turma t
INNER JOIN Professor p 
    ON t.NomePr = p.NomeCompleto 
    AND t.TelefonePr = p.Telefone
INNER JOIN PeriodoLetivo pl 
    ON t.IDPeriodoLetivo = pl.Id;

SELECT * FROM view_turmas_professor LIMIT 20;

-------------------------------------

CREATE VIEW view_matricula_desconto_bolsa AS
SELECT 
    m.id_matricula,
    m.NomeAluno,
    m.TelefoneAluno,
    m.idTurma,
    m.Status,
    m.Nota,
    CONCAT(m.Dia, '/', m.Mes, '/', m.Ano) AS data_matricula,
    d.Valor AS valor_desconto,
    d.Tipo AS tipo_desconto,
    b.Nome AS nome_bolsa,
    b.Descricao AS descricao_bolsa,
    b.Instituicao AS instituicao_bolsa
FROM Matricula m
LEFT JOIN Desconto d 
    ON m.DescontoID = d.Id
LEFT JOIN Bolsa b 
    ON m.BolsaID = b.Id;

SELECT * FROM view_matricula_desconto_bolsa LIMIT 20;