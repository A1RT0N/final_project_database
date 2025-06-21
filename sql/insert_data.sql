-- 1. Localidade
INSERT INTO Localidade (Id, Nome)
SELECT i, 'Localidade '||i
FROM generate_series(0,10000) AS s(i);

-- 2. Departamento
INSERT INTO Departamento (Id, Nome)
SELECT i, 'Departamento '||i
FROM generate_series(0,10000) AS s(i);

-- 3. UnidadeDaEscola
INSERT INTO UnidadeDaEscola (Id, Nome, IDLocalidade, RuaEnd, CepEnd, PaisEnd)
SELECT 
  i,
  'Unid. Escola '||i,
  i,
  'Rua Principal, nº '||i,
  lpad(i::text,5,'0'),
  'Brasil'
FROM generate_series(0,10000) AS s(i);

-- 4. PeriodoLetivo
INSERT INTO PeriodoLetivo (Id, Ano, DiaLimite, MesLimite)
SELECT
  i,
  2020 + (i % 6),
  ((i*3) % 28) + 1,
  ((i*4) % 12) + 1
FROM generate_series(0,10000) AS s(i);

-- 5. SalaDeAula
INSERT INTO SalaDeAula (Id, NumDeVagas)
SELECT
  i,
  10 + (i % 20)
FROM generate_series(0,10000) AS s(i);

-- 6. Curso
INSERT INTO Curso (Codigo, Nome, NumVagas, CargaHor, Tipo, deptID)
SELECT
  'C'||lpad(i::text,5,'0'),
  'Curso '||i,
  20 + (i % 15),
  30 + (i % 50),
 CASE WHEN i % 2 = 0 THEN 'Fundamental' ELSE 'Médio' END,
  (i % 10)
FROM generate_series(0,10000) AS s(i);

-- 7. Disciplina
INSERT INTO Disciplina (Codigo, Nome, AulasSema)
SELECT
  'D'||lpad(i::text,5,'0'),
  'Disciplina '||i,
  1 + (i % 5)
FROM generate_series(0,10000) AS s(i);

-- 8. Desconto
INSERT INTO Desconto (Id, Valor, Tipo)
SELECT
  i,
  i::NUMERIC,
  CASE WHEN i % 2 = 0 THEN 'Porcentagem' ELSE 'Total' END
FROM generate_series(0,10000) AS s(i);

-- 9. Regra
INSERT INTO Regra (RegraID, Descricao)
SELECT
  i,
  'Regra '||i
FROM generate_series(0,10000) AS s(i);

--10. Infraestrutura
INSERT INTO Infraestrutura (InfraID, Nome)
SELECT
  i,
  'Infraestrutura '||i
FROM generate_series(0,10000) AS s(i);

--11. MaterialDidatico
INSERT INTO MaterialDidatico (Id, Nome, Descricao)
SELECT
  i,
  'Material '||i,
  'Descrição do material '||i
FROM generate_series(0,10000) AS s(i);

--12. Bolsa
INSERT INTO Bolsa (Id, Nome, Descricao, Instituicao)
SELECT
  i,
  'Bolsa '||i,
  'Descrição da bolsa número '||i,
  'Instituição '|| (i % 20)
FROM generate_series(0,10000) AS s(i);

--13. Aluno
INSERT INTO Aluno (
  NomeCompleto, Telefone, Sexo, Email, Senha, Tipo,
  IDUnidade, AnoNasc, DiaNasc, MesNasc, RuaEnd, CidadeEnd, CepEnd
)
SELECT
  'Aluno '||i,
  '11900000'||lpad(i::text,5,'0'),
  CASE WHEN i % 2 = 0 THEN 'M' ELSE 'F' END,
  'aluno'||i||'@escola.edu.br',
  'senha'||i,
  'Aluno',
  i,
  1995 + (i % 10),
  ((i*5) % 28) + 1,
  ((i*3) % 12) + 1,
  'Rua A, nº '||i,
  'Cidade '||i,
  lpad(i::text,8,'0')
FROM generate_series(0,10000) AS s(i);

--14. Professor
INSERT INTO Professor (
  NomeCompleto, Telefone, Sexo, Email, Senha, Tipo,
  Especializacao, Titulacao, IDUnidade, AnoNasc, DiaNasc, MesNasc, RuaEnd, CidadeEnd, CepEnd
)
SELECT
  'Prof. '||i,
  '11910000'||lpad(i::text,5,'0'),
  CASE WHEN i % 2 = 0 THEN 'M' ELSE 'F' END,
  'prof'||i||'@escola.edu.br',
  'senhaP'||i,
  'Professor',
  'Área '|| ((i % 5)+1),
  CASE WHEN i % 3 = 0 THEN 'Doutor' WHEN i % 3 = 1 THEN 'Mestre' ELSE 'Graduado' END,
  i,
  1970 + (i % 25),
  ((i*7) % 28) + 1,
  ((i*2) % 12) + 1,
  'Av. B, nº '||i,
  'Cidade '||i,
  lpad(i::text,8,'0')
FROM generate_series(0,10000) AS s(i);

--15. FuncionarioAdm
INSERT INTO FuncionarioAdm (
  NomeCompleto, Telefone, Sexo, Email, Senha, Tipo,
  AnoNasc, DiaNasc, MesNasc, RuaEnd, CidadeEnd, CepEnd
)
SELECT
  'Adm '||i,
  '11920000'||lpad(i::text,5,'0'),
  CASE WHEN i % 2 = 0 THEN 'M' ELSE 'F' END,
  'adm'||i||'@escola.edu.br',
  'senhaA'||i,
  'Adm',
  1980 + (i % 20),
  ((i*4) % 28) + 1,
  ((i*5) % 12) + 1,
  'Rua C, nº '||i,
  'Cidade '||i,
  lpad(i::text,8,'0')
FROM generate_series(0,10000) AS s(i);

--16. Turma
INSERT INTO Turma (
  Id, Capacidade, ValorTotalMatricula, DiaLimite, MesLimite, AnoLimite,
  IDPeriodoLetivo, IDSalaDeAula, CodigoDisc, NomePr, TelefonePr
)
SELECT
  i,
  20 + (i % 25),
  1000.00 + (i * 5),
  ((i*4) % 28) + 1,
  ((i*3) % 12) + 1,
  2025,
  (i%4),
  (i%3),
  'D'||lpad( (i%4) ::text,5,'0'),
  'Prof. '||i,
  '11910000'||lpad(i::text,5,'0')
FROM generate_series(0,10000) AS s(i);

--17. Mensagem
INSERT INTO Mensagem (
  id, Timestamp, Texto, tipo, NomeU, TelefoneU
)
SELECT
  i,
  NOW() + (i || ' days')::INTERVAL,
  'Texto mensagem '||i,
  CASE WHEN i % 2 = 0 THEN 'Info' ELSE 'Alerta' END,
  CASE WHEN i % 3 = 0 THEN 'Aluno '||i ELSE 'Prof. '||i END,
  CASE WHEN i % 3 = 0 THEN '11900000'||lpad(i::text,5,'0') ELSE '11910000'||lpad(i::text,5,'0') END
FROM generate_series(0,10000) AS s(i);

--18. Destinatarios
INSERT INTO Destinatarios (id, Destinatario)
SELECT
  i,
  'Destinatário '||i
FROM generate_series(0,10000) AS s(i);

--19. AvaliacaoDisciplina
INSERT INTO AvaliacaoDisciplina (
  Id, Comentario, Tipo,
  ClassificaMaterialApoio, ClassificaRelevanciaConteudo, ClassificaInfraestrutura,
  NomeA, TelefoneA,CodigoDisciplina
)
SELECT
  i,
  'Comentário D'||i,
  CASE WHEN i % 2 = 0 THEN 'Positivo' ELSE 'Negativo' END,
  1 + (i % 5),
  1 + (i % 5),
  1 + (i % 5),
  'Aluno '||i,
  '11900000'||lpad(i::text,5,'0'),
  'D'||lpad((i%4)::text,5,'0')
FROM generate_series(0,10000) AS s(i);

--20. AvaliacaoProfessor
INSERT INTO AvaliacaoProfessor (
  Id, Comentario, Tipo, ClassificaDidatica, NomeA, TelefoneA, NomeProf, TelefoneProf
)
SELECT
  i,
  'Comentário P'||i,
  CASE WHEN i % 2 = 0 THEN 'Elogio' ELSE 'Reclamação' END,
  1 + (i % 5),
  'Aluno '||i,
  '11900000'||lpad(i::text,5,'0'),
  'Prof. '||i,
  '11910000'||lpad(i::text,5,'0')
FROM generate_series(0,10000) AS s(i);

--21. MateriaisDisc
INSERT INTO MateriaisDisc (CodigoDisciplina, IDMaterial)
SELECT
  'D'||lpad((i%10)::text,5,'0'),
  i
FROM generate_series(0,10000) AS s(i);

--22. Requisito
INSERT INTO Requisito (CodigoDisciplina, CodigoCurso)
SELECT
  'D'||lpad((i % 100)::text,5,'0'),
  'C'||lpad((i)::text,5,'0')
FROM generate_series(0,10000) AS s(i);

--23. Composicao
INSERT INTO Composicao (CodigoDisciplina, CodigoCurso)
SELECT
  'D'||lpad((i % 100)::text,5,'0'),
  'C'||lpad((i)::text,5,'0')
FROM generate_series(0,10000) AS s(i);

--24. RegraCurso
INSERT INTO RegraCurso (CodigoCurso, RegraID)
SELECT
  'C'||lpad((i % 101)::text,5,'0'),
  i
FROM generate_series(0,10000) AS s(i);

--25. InfraCurso
INSERT INTO InfraCurso (CodigoCurso, InfraID)
SELECT
  'C'||lpad((i % 101)::text,5,'0'),
  i
FROM generate_series(0,10000) AS s(i);

--26. Matricula
INSERT INTO Matricula (
  id_matricula, idTurma, NomeAluno, TelefoneAluno,
  Dia, Mes, Ano, Status, Nota, DescontoID, BolsaID
)
SELECT
  i,
  (i % 7),
  'Aluno '||i,
  '11900000'||lpad(i::text,5,'0'),
  ((i*3) % 28) + 1,
  ((i*2) % 12) + 1,
  2020 + (i % 6),
  CASE WHEN i % 2 = 0 THEN 'Confirmado' ELSE 'Pendente' END,
  (i % 11)::NUMERIC,
  i,
  i
FROM generate_series(0,10000) AS s(i);

--27. Responsabilidade
INSERT INTO Responsabilidade (NomeCompleto, Telefone, CodigoDisciplina)
SELECT 
  p.NomeCompleto,
  p.Telefone,
  d.Codigo
FROM generate_series(0,10000) AS s(i)
JOIN Professor p 
  ON p.NomeCompleto = 'Prof. '||(s.i%4)
JOIN Disciplina d 
  ON d.Codigo = 'D'||lpad((s.i)::text,5,'0');
