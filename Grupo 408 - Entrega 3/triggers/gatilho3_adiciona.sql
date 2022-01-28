.mode columns
.headers on 
.nullvalue NULL 

PRAGMA foreign_keys = ON;

CREATE TRIGGER  IF NOT EXISTS gatilho3_adiciona
before insert on ALUNOUC
FOR each row
WHEN EXISTS(SELECT * FROM alunoUC where alunoUC.numMecanografico = new.numMecanografico AND substr(alunoUC.codUC,1,5) != substr(new.codUC,1,5))
BEGIN
SELECT RAISE(ABORT, "A Student can't enroll in curricular units of different courses");
END;
