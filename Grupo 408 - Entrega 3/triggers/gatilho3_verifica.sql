.mode columns
.headers on 
.nullvalue NULL 

PRAGMA foreign_keys = ON;

SELECT * FROM ALUNOUC 

INSERT into UC VALUES ('L.EEC02','Matemática', '6', 'Análise Matemática II','9546', '80');
INSERT INTO OCORRENCIAUC VALUES('17','2021-2022','2','1','60','L.EEC02');

INSERT INTO ALUNOUC VALUES('202001099','L.EEC02');
INSERT INTO ALUNOUC VALUES('202001099','L.EIC012');

DELETE FROM AlunoUc WHERE nummecanografico = '202001099' AND coduc = 'L.EEC02';
DELETE FROM OcorrenciaUc WHERE idocorrenciauc = '17';
DELETE FROM UC WHERE coduc = 'L.EEC02';

select * from ALUNOUC