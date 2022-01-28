.mode columns
.headers on 
.nullvalue NULL

SELECT Docente.nome
FROM Lecionam
INNER JOIN Docente on Docente.numFuncionario = Lecionam.numfuncionario
where Lecionam.codUc LIKE 'L.EIC%'
GROUP BY Docente.nome