.mode columns
.headers on 
.nullvalue NULL 

SELECT ROUND(AVG(salario), 1) AS "Media de salarios"
FROM Estatuto
INNER JOIN Docente ON Docente.idEstatuto = Estatuto.idEstatuto