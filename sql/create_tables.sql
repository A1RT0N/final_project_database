-- Criação da tabela Localidade
CREATE TABLE Localidade (
    Id SERIAL PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL
);

-- Criação da tabela UnidadeDaEscola
CREATE TABLE UnidadeDaEscola (
    Id SERIAL PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    IDLocalidade INTEGER REFERENCES Localidade(Id),
    RuaEnd VARCHAR(255),
    CepEnd VARCHAR(10),
    PaisEnd VARCHAR(10000)
);

-- Criação da tabela Departamento
CREATE TABLE Departamento (
    Id SERIAL PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL
);

-- Criação da tabela Curso
CREATE TABLE Curso (
    Codigo VARCHAR(20) PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    NumVagas INTEGER,
    CargaHor INTEGER,
    Tipo VARCHAR(50),
    deptID INTEGER REFERENCES Departamento(Id)
);

-- Criação da tabela SalaDeAula
CREATE TABLE SalaDeAula (
    Id SERIAL PRIMARY KEY,
    NumDeVagas INTEGER
);

-- Criação da tabela Disciplina
CREATE TABLE Disciplina (
    Codigo VARCHAR(20) PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    AulasSema INTEGER
);

-- Criação da tabela Aluno
CREATE TABLE Aluno (
    NomeCompleto VARCHAR(255) NOT NULL,
    Telefone VARCHAR(20) NOT NULL,
    Sexo CHAR(1),
    Email VARCHAR(255) UNIQUE NOT NULL,
    Senha VARCHAR(255) NOT NULL,
    Tipo VARCHAR(50),
    IDUnidade INTEGER REFERENCES UnidadeDaEscola(Id),
    AnoNasc INTEGER,
    DiaNasc INTEGER,
    MesNasc INTEGER,
    RuaEnd VARCHAR(255),
    CidadeEnd VARCHAR(10000),
    CepEnd VARCHAR(10),
    PRIMARY KEY (NomeCompleto, Telefone)
);

-- Criação da tabela Professor
CREATE TABLE Professor (
    NomeCompleto VARCHAR(255) NOT NULL,
    Telefone VARCHAR(20) NOT NULL,
    Sexo CHAR(1),
    Email VARCHAR(255) UNIQUE NOT NULL,
    Senha VARCHAR(255) NOT NULL,
    Tipo VARCHAR(50),
    Especializacao VARCHAR(255),
    Titulacao VARCHAR(100),
    IDUnidade INTEGER REFERENCES UnidadeDaEscola(Id),
    AnoNasc INTEGER,
    DiaNasc INTEGER,
    MesNasc INTEGER,
    RuaEnd VARCHAR(255),
    CidadeEnd VARCHAR(100),
    CepEnd VARCHAR(10),
    PRIMARY KEY (NomeCompleto, Telefone)
);

-- Criação da tabela FuncionarioAdm
CREATE TABLE FuncionarioAdm (
    NomeCompleto VARCHAR(255) NOT NULL,
    Telefone VARCHAR(20) NOT NULL,
    Sexo CHAR(1),
    Email VARCHAR(255) UNIQUE NOT NULL,
    Senha VARCHAR(255) NOT NULL,
    Tipo VARCHAR(50),
    AnoNasc INTEGER,
    DiaNasc INTEGER,
    MesNasc INTEGER,
    RuaEnd VARCHAR(255),
    CidadeEnd VARCHAR(100),
    CepEnd VARCHAR(10),
    PRIMARY KEY (NomeCompleto, Telefone)
);

-- Criação da tabela PeriodoLetivo
CREATE TABLE PeriodoLetivo (
    Id SERIAL PRIMARY KEY,
    Ano INTEGER NOT NULL,
    DiaLimite INTEGER,
    MesLimite INTEGER
);

-- Criação da tabela Turma
CREATE TABLE Turma (
    Id SERIAL PRIMARY KEY,
    Capacidade INTEGER,
    ValorTotalMatricula NUMERIC(10, 2),
    DiaLimite INTEGER,
    MesLimite INTEGER,
    AnoLimite INTEGER,
    IDPeriodoLetivo INTEGER REFERENCES PeriodoLetivo(Id),
    IDSalaDeAula INTEGER REFERENCES SalaDeAula(Id),
    CodigoDisc VARCHAR(20) REFERENCES Disciplina(Codigo),
    NomePr VARCHAR(255),
    TelefonePr VARCHAR(20),
    FOREIGN KEY (NomePr, TelefonePr) REFERENCES Professor(NomeCompleto, Telefone)
);

-- Criação da tabela Desconto
CREATE TABLE Desconto (
    Id SERIAL PRIMARY KEY,
    Valor NUMERIC(10, 2),
    Tipo VARCHAR(50)
);

-- Criação da tabela Bolsa
CREATE TABLE Bolsa (
    Id SERIAL PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Descricao TEXT,
    Instituicao VARCHAR(255)
);

-- Criação da tabela Matricula
CREATE TABLE Matricula (
    id_matricula SERIAL PRIMARY KEY,
    idTurma INTEGER REFERENCES Turma(Id),
    NomeAluno VARCHAR(255),
    TelefoneAluno VARCHAR(20),
    Dia INTEGER,
    Mes INTEGER,
    Ano INTEGER,
    Status VARCHAR(50),
    Nota NUMERIC(4, 2),
    DescontoID INTEGER REFERENCES Desconto(Id),
    BolsaID INTEGER REFERENCES Bolsa(Id),
    FOREIGN KEY (NomeAluno, TelefoneAluno) REFERENCES Aluno(NomeCompleto, Telefone)
);

-- Criação da tabela Mensagem
CREATE TABLE Mensagem (
    id SERIAL PRIMARY KEY,
    Timestamp TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    Texto TEXT,
    tipo VARCHAR(50),
    NomeU VARCHAR(255),
    TelefoneU VARCHAR(20)
);

-- Criação da tabela Destinatários
CREATE TABLE Destinatarios (
    id INTEGER REFERENCES Mensagem(id),
    Destinatario VARCHAR(255),
    PRIMARY KEY (id, Destinatario)
);

-- Criação da tabela AvaliacaoDisciplina
CREATE TABLE AvaliacaoDisciplina (
    Id SERIAL PRIMARY KEY,
    Comentario TEXT,
    Tipo VARCHAR(50),
    ClassificaMaterialApoio INTEGER,
    ClassificaRelevanciaConteudo INTEGER,
    ClassificaInfraestrutura INTEGER,
    NomeA VARCHAR(255),
    TelefoneA VARCHAR(20),
    FOREIGN KEY (NomeA, TelefoneA) REFERENCES Aluno(NomeCompleto, Telefone),
    CodigoDisciplina VARCHAR(20),
    FOREIGN KEY (CodigoDisciplina) REFERENCES Disciplina(Codigo)
);

-- Criação da tabela AvaliacaoProfessor
CREATE TABLE AvaliacaoProfessor (
    Id SERIAL PRIMARY KEY,
    Comentario TEXT,
    Tipo VARCHAR(50),
    ClassificaDidatica INTEGER,
    NomeA VARCHAR(255),
    TelefoneA VARCHAR(20),
    FOREIGN KEY (NomeA, TelefoneA) REFERENCES Aluno(NomeCompleto, Telefone),
    NomeProf VARCHAR(255),
    TelefoneProf VARCHAR(20),
    FOREIGN KEY (NomeProf, TelefoneProf) REFERENCES Professor(NomeCompleto, Telefone)
);

-- Criação da tabela Regra
CREATE TABLE Regra (
    RegraID SERIAL PRIMARY KEY,
    Descricao TEXT
);

-- Criação da tabela Infraestrutura
CREATE TABLE Infraestrutura (
    InfraID SERIAL PRIMARY KEY,
    Nome VARCHAR(255)
);

-- Criação da tabela MaterialDidatico
CREATE TABLE MaterialDidatico (
    Id SERIAL PRIMARY KEY,
    Nome VARCHAR(255),
    Descricao TEXT
);

-- Criação da tabela Responsabilidade (tabela de junção)
CREATE TABLE Responsabilidade (
    NomeCompleto VARCHAR(255),
    Telefone VARCHAR(20),
    CodigoDisciplina VARCHAR(20) REFERENCES Disciplina(Codigo),
    PRIMARY KEY (NomeCompleto, Telefone, CodigoDisciplina),
    FOREIGN KEY (NomeCompleto, Telefone) REFERENCES Professor(NomeCompleto, Telefone)
);

-- Criação da tabela MateriaisDisc (tabela de junção)
CREATE TABLE MateriaisDisc (
    CodigoDisciplina VARCHAR(20) REFERENCES Disciplina(Codigo),
    IDMaterial INTEGER REFERENCES MaterialDidatico(Id),
    PRIMARY KEY (CodigoDisciplina, IDMaterial)
);

-- Criação da tabela Requisito (tabela de junção)
CREATE TABLE Requisito (
    CodigoDisciplina VARCHAR(20) REFERENCES Disciplina(Codigo),
    CodigoCurso VARCHAR(20) REFERENCES Curso(Codigo),
    PRIMARY KEY (CodigoDisciplina, CodigoCurso)
);

-- Criação da tabela Composição (tabela de junção)
CREATE TABLE Composicao (
    CodigoDisciplina VARCHAR(20) REFERENCES Disciplina(Codigo),
    CodigoCurso VARCHAR(20) REFERENCES Curso(Codigo),
    PRIMARY KEY (CodigoDisciplina, CodigoCurso)
);

-- Criação da tabela RegraCurso (tabela de junção)
CREATE TABLE RegraCurso (
    CodigoCurso VARCHAR(20) REFERENCES Curso(Codigo),
    RegraID INTEGER REFERENCES Regra(RegraID),
    PRIMARY KEY (CodigoCurso, RegraID)
);

-- Criação da tabela InfraCurso (tabela de junção)
CREATE TABLE InfraCurso (
    CodigoCurso VARCHAR(20) REFERENCES Curso(Codigo),
    InfraID INTEGER REFERENCES Infraestrutura(InfraID),
    PRIMARY KEY (CodigoCurso, InfraID)
);
