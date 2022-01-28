.mode columns
.headers on 
.nullvalue NULL 

SELECT Uc.nomeUc AS "Cadeiras frequentadas"
from AlunoUc
INNER JOIN Uc on Uc.codUc = AlunoUc.codUc
WHERE numMecanografico 
like (select numMecanografico from Aluno C1 WHERE not exists (select * FROM Aluno C2 where LENGTH(C1.nome) < LENGTH(C2.nome)))
GROUP by nomeUc