.mode columns
.headers on 
.nullvalue NULL

select ROUND(AVG(numcreditos),1) AS "Média de créditos por aluno"
from AlunoUc
INNER JOIN Uc on Uc.codUc = AlunoUc.coduc

