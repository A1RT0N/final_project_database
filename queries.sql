-- 1) Alunos matriculados na disciplina 'D003' no período letivo 3
SELECT 
  m.NomeAluno, 
  m.TelefoneAluno, 
  m.Nota
FROM Matricula m
JOIN Turma t 
  ON t.Id = m.idTurma
WHERE t.CodigoDisc       = 'D003'     -- código da disciplina 3
  AND t.IDPeriodoLetivo  = 3
ORDER BY m.NomeAluno;

-- 2) Média de notas do aluno 'Aluno 7'
SELECT 
  AVG(m.Nota)::NUMERIC(4,2) AS media_notas
FROM Matricula m
WHERE m.NomeAluno = 'Aluno 7';

-- 3) Professores do departamento 3 com suas disciplinas
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

-- 7) Materiais didáticos por disciplina (corrigido)
SELECT 
  d.Nome             AS disciplina,
  array_agg(md.Nome) AS materiais
FROM Disciplina d
JOIN MateriaisDisc mdx
  ON mdx.CodigoDisciplina = d.Codigo
JOIN MaterialDidatico md
  ON md.Id = mdx.IDMaterial
GROUP BY d.Nome
ORDER BY d.Nome;
