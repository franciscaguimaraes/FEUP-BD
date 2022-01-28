.mode columns
.headers on 
.nullvalue NULL 

PRAGMA foreign_keys = ON;

CREATE TRIGGER IF NOT EXISTS gatilho1_adiciona
before INSERT on DirecaoCurso 
FOR EACH ROW
when EXISTS(SELECT * from DirecaoCurso where diretor = new.subdiretor)
BEGIN
	SELECT RAISE(ABORT,"A teacher can't be Director and Subdiretor in the same Course Direction");
    
END; 