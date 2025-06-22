-- 1) Alunos matriculados na disciplina 'D00003' no período letivo 3
SELECT 
  m.NomeAluno, 
  m.TelefoneAluno, 
  m.Nota
FROM Matricula m
JOIN Turma t 
  ON t.Id = m.idTurma
WHERE t.CodigoDisc       = 'D00003'     -- código da disciplina 3
  AND t.IDPeriodoLetivo  = 3
ORDER BY m.NomeAluno;

-- 2) Média de notas do aluno 'Aluno 7'
SELECT 
  AVG(m.Nota)::NUMERIC(4,2) AS media_notas
FROM Matricula m
WHERE m.NomeAluno = 'Aluno 7';

-- 3) Professores que ministram disciplinas que pertencem à cursos do departamento 3
SELECT 
  p.NomeCompleto   AS professor,
  r.CodigoDisciplina AS disciplina
FROM Professor p
JOIN Responsabilidade r
  ON p.NomeCompleto = r.NomeCompleto
 AND p.Telefone    = r.Telefone
JOIN Composicao c
  ON c.CodigoDisciplina = r.CodigoDisciplina
JOIN Curso cur
  ON cur.Codigo = c.CodigoCurso
WHERE cur.deptID = 3
ORDER BY p.NomeCompleto;

-- 4) Numero de matriculas em cada ano
SELECT ano, COUNT(*) 
FROM Matricula m 
JOIN Turma t 
  ON t.Id = m.idTurma 
JOIN Composicao comp 
  ON comp.CodigoDisciplina = t.CodigoDisc 
GROUP BY ano;

-- 5) Contagem de alunos por turma
SELECT 
  t.Id       AS turma, 
  COUNT(*)   AS num_alunos
FROM Matricula m
JOIN Turma t 
  ON t.Id = m.idTurma
GROUP BY t.Id
ORDER BY turma;

-- 6) Média de didática por professor
SELECT 
  p.NomeCompleto,
  ROUND(AVG(ap.ClassificaDidatica),2) AS media_didatica
FROM AvaliacaoProfessor ap
JOIN Professor p
  ON p.NomeCompleto = ap.NomeProf
 AND p.Telefone    = ap.TelefoneProf
GROUP BY p.NomeCompleto
ORDER BY media_didatica DESC;

-- 7) Materiais didáticos por disciplina 
SELECT 
  d.Nome             AS disciplina,
  (array_agg(md.Nome))[1:15] AS materiais
FROM Disciplina d
JOIN MateriaisDisc mdx
  ON mdx.CodigoDisciplina = d.Codigo
JOIN MaterialDidatico md
  ON md.Id = mdx.IDMaterial
GROUP BY d.Nome
ORDER BY d.Nome;

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
