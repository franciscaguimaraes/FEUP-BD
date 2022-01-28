.mode columns
.headers on 
.nullvalue NULL 

PRAGMA foreign_keys = ON;

SELECT numInscricoes From OcorrenciaUc where codUc = 'L.EIC013';

INSERT into AlunoUc values('202001055','L.EIC013');
SELECT numInscricoes From OcorrenciaUc where codUc = 'L.EIC013';
INSERT into AlunoUc values('202001056','L.EIC013');

-- Verificar aumento e diminuição das inscrições
SELECT  numInscricoes From OcorrenciaUc where codUc = 'L.EIC013';

DELETE FROM AlunoUc WHERE numMecanografico = '202001055' and codUc = 'L.EIC013';

SELECT  numInscricoes From OcorrenciaUc where codUc = 'L.EIC013';

DELETE FROM AlunoUc WHERE numMecanografico = '202001056' and codUc = 'L.EIC013';

SELECT  numInscricoes From OcorrenciaUc where codUc = 'L.EIC013';

-- Verificar mensagem de erro ultrapassando as 500 inscrições 

INSERT into UC VALUES ('L.EEC02','Matemática', '6', 'Análise Matemática II','9546', '80');

INSERT INTO OCORRENCIAUC VALUES('17','2021-2022','2','1','500','L.EEC02');

SELECT numinscricoes FROM OcorrenciaUc WHERE codUc = 'L.EEC02';

INSERT into AlunoUc values('202001099','L.EEC02');

SELECT  numInscricoes From OcorrenciaUc where codUc = 'L.EEC02';

DELETE FROM AlunoUc WHERE nummecanografico = '202001099' AND coduc = 'L.EEC02';

DELETE FROM OcorrenciaUc WHERE idocorrenciauc = '17';

DELETE FROM UC WHERE coduc = 'L.EEC02';
