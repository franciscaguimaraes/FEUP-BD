PRAGMA foreign_keys = on;


DROP TABLE IF EXISTS Aluno;
CREATE TABLE Aluno (
    numMecanografico INTEGER PRIMARY KEY,
    nome VARCHAR(64) NOT NULL,
    nif INTEGER NOT NULL UNIQUE,
    morada VARCHAR(64) NOT NULL,
    dataNasc DATE NOT NULL
);

DROP TABLE IF EXISTS AlunoUc;
CREATE TABLE AlunoUc (
    numMecanografico INTEGER CONSTRAINT fk_AlunoUc_numMecanografico REFERENCES Aluno (numMecanografico) ON DELETE CASCADE
                                                                                                        ON UPDATE CASCADE,
    codUc INTEGER CONSTRAINT fk_AlunoUc_codUc REFERENCES Uc (codUc) ON DELETE CASCADE
                                                                    ON UPDATE CASCADE,
    PRIMARY KEY(
        numMecanografico, 
        codUc
    )
);

DROP TABLE IF EXISTS Uc;
CREATE TABLE Uc (
    codUc VARCHAR(32) PRIMARY KEY,
    nomeUc VARCHAR(64) NOT NULL,
    numCreditos INTEGER CONSTRAINT check_Uc_numCreditos CHECK (numCreditos > 0 AND 
                                                                  numCreditos < 8),
    programaCurr VARCHAR(128) NOT NULL,
    codCurso INTEGER CONSTRAINT fk_Uc_codCurso REFERENCES Curso (codCurso) ON DELETE CASCADE
                                                                           ON UPDATE CASCADE
);

DROP TABLE IF EXISTS OcorrenciaUc;
CREATE TABLE OcorrenciaUc (
    idOcorrenciaUc INTEGER PRIMARY KEY,
    anoLetivo INTEGER NOT NULL,
    anoCurricular INTEGER NOT NULL,
    semestre INTEGER CONSTRAINT check_OcorrenciaUc_semestre CHECK (semestre = 1 OR semestre = 2),
    numInscricoes INTEGER CONSTRAINT check_OcorrenciaUc_numInscricoes CHECK (numInscricoes > 0 AND numInscricoes < 500),
    codUc INTEGER CONSTRAINT fk_OcorrenciaUc_codUc REFERENCES Uc (codUc) ON DELETE CASCADE
                                                                         ON UPDATE CASCADE
);

DROP TABLE IF EXISTS NaoDocente;
CREATE TABLE NaoDocente (
    numFuncionario INTEGER PRIMARY KEY,
    nome VARCHAR(64) NOT NULL,
    salario INTEGER CONSTRAINT check_NaoDocente_salario CHECK (salario >= 665),
    durContrato INTEGER CONSTRAINT check_NaoDocente_durContrato CHECK (durContrato >= 6),
    funcaoFac VARCHAR(32) NOT NULL
);

DROP TABLE IF EXISTS Docente;
CREATE TABLE Docente (
    numFuncionario INTEGER PRIMARY KEY,
    nome VARCHAR(64) NOT NULL,
    sigla VARCHAR(8) NOT NULL UNIQUE,
    correioEletronico VARCHAR(128) NOT NULL UNIQUE,
    idEstatuto INTEGER CONSTRAINT fk_Docente_idEstatuto REFERENCES Estatuto (idEstatuto) ON DELETE CASCADE
                                                                                         ON UPDATE CASCADE,
    codDep VARCHAR(16) CONSTRAINT fk_Docente_codDep REFERENCES Departamento (codDep) ON DELETE CASCADE
                                                                                 ON UPDATE CASCADE
);

DROP TABLE IF EXISTS Lecionam;
CREATE TABLE Lecionam (
    codUc INTEGER CONSTRAINT fk_Lecionam_codUc REFERENCES Uc (codUc) ON DELETE CASCADE
                                                                     ON UPDATE CASCADE,
    numFuncionario INTEGER CONSTRAINT fk_Lecionam_numFuncionario REFERENCES Docente (numFuncionario) ON DELETE CASCADE
                                                                                                     ON UPDATE CASCADE,
    PRIMARY KEY(
        codUc, 
        numFuncionario
    )
);

DROP TABLE IF EXISTS DocenteResp;
CREATE TABLE DocenteResp (
    codUc VARCHAR(16) PRIMARY KEY CONSTRAINT fk_DocenteResp_codUc REFERENCES Uc (codUc) ON DELETE CASCADE
                                                                        ON UPDATE CASCADE,
    numFuncionario INTEGER NOT NULL CONSTRAINT fk_DocenteResp_numFuncionario REFERENCES Docente (numFuncionario) ON DELETE CASCADE
                                                                                                        ON UPDATE CASCADE
);

DROP TABLE IF EXISTS Estatuto;
CREATE TABLE Estatuto(
    idEstatuto INTEGER PRIMARY KEY,
    salario INTEGER CONSTRAINT check_Estatuto_salario CHECK (salario >= 665),
    qualificacao VARCHAR(32) NOT NULL
);

DROP TABLE IF EXISTS Departamento;
CREATE TABLE Departamento (
    codDep VARCHAR(16) PRIMARY KEY,
    nomeDep VARCHAR(64) NOT NULL
);

DROP TABLE IF EXISTS Curso;
CREATE TABLE Curso(
    codCurso INTEGER PRIMARY KEY,
    nomeCurso VARCHAR(64) NOT NULL,
    codDep VARCHAR(16) CONSTRAINT fk_Curso_codDep REFERENCES Departamento (codDep) ON DELETE CASCADE
                                                                               ON UPDATE CASCADE
);

DROP TABLE IF EXISTS Licenciatura;
CREATE TABLE Licenciatura(
    codCurso INTEGER CONSTRAINT fk_Licenciatura_codCurso REFERENCES Curso (codCurso) ON DELETE CASCADE
                                                                                     ON UPDATE CASCADE,
    codLic VARCHAR(16) NOT NULL UNIQUE,
    numVagasLic INTEGER CONSTRAINT check_Licenciatura_numVagasLic CHECK (numVagasLic >=0 AND numVagasLic < 400),
    duracaoLic INTEGER CONSTRAINT check_Licenciatura_duracaoLic CHECK (duracaoLic <=8 AND duracaoLic >= 6),
    PRIMARY KEY(
        codCurso
    )
);

DROP TABLE IF EXISTS Mestrado; 
CREATE TABLE Mestrado(
    codCurso INTEGER CONSTRAINT fk_Mestrado_codCurso REFERENCES Curso (codCurso) ON DELETE CASCADE
                                                                                 ON UPDATE CASCADE,
    codMest VARCHAR(16) NOT NULL UNIQUE,
    numVagasMest INTEGER CONSTRAINT check_Mestrado_numVagasMest CHECK (numVagasMest >=0 AND numVagasMest < 200),
    duracaoMest INTEGER CONSTRAINT check_Mestrado_duracaoMest CHECK (duracaoMest <=4 AND duracaoMest >= 3),
    PRIMARY KEY(
        codCurso
    )
);

DROP TABLE IF EXISTS DirecaoCurso; 
CREATE TABLE DirecaoCurso(
    idDirecaoCurso INTEGER PRIMARY KEY,
    dataMudanca DATE NOT NULL,
    codCurso INTEGER CONSTRAINT fk_DirecaoCurso_codCurso REFERENCES Curso (codCurso) ON DELETE CASCADE
                                                                                     ON UPDATE CASCADE
);

DROP TABLE IF EXISTS Diretor;
CREATE TABLE Diretor(
    numFuncionario INTEGER NOT NULL CONSTRAINT fk_Diretor_numFuncionario REFERENCES Docente (numFuncionario) ON DELETE CASCADE
                                                                                                    ON UPDATE CASCADE,
    idDirecaoCurso INTEGER NOT NULL CONSTRAINT fk_Diretor_idDirecaoCurso REFERENCES DirecaoCurso (idDirecaoCurso) ON DELETE CASCADE
                                                                                                    ON UPDATE CASCADE
);

DROP TABLE IF EXISTS SubDiretor;
CREATE TABLE SubDiretor(
    numFuncionario INTEGER NOT NULL CONSTRAINT fk_SubDiretor_numFuncionario REFERENCES Docente (numFuncionario) ON DELETE CASCADE
                                                                                                       ON UPDATE CASCADE,
    idDirecaoCurso INTEGER NOT NULL CONSTRAINT fk_SubDiretor_idDirecaoCurso REFERENCES DirecaoCurso (idDirecaoCurso) ON DELETE CASCADE
                                                                                                                     ON UPDATE CASCADE
);
                                                                                