.mode columns
.headers on 
.nullvalue NULL

SELECT Docente.nome 
FROM Docente, DirecaoCurso
INNER JOIN DirecaoCurso AS diretordirecao on DirecaoCurso.diretor = Docente.numFuncionario
INNER JOIN Curso on Curso.codCurso = DirecaoCurso.codCurso
where (
diretordirecao.codcurso = 
(SELECT DISTINCT DirecaoCurso.codcurso
from DirecaoCurso
WHERE (
 Curso.nomecurso = "Licenciatura em Engenharia Quimica"
)))
UNION
SELECT DISTINCT Docente.nome
FROM Docente, DirecaoCurso
INNER JOIN DirecaoCurso AS subdiretordirecao on DirecaoCurso.subdiretor = Docente.numfuncionario
INNER JOIN Curso on Curso.codCurso = DirecaoCurso.codCurso
where (
subdiretordirecao.codcurso = 
(SELECT DirecaoCurso.codcurso
from DirecaoCurso
WHERE (
 Curso.nomecurso = "Licenciatura em Engenharia Quimica"
)))
GROUP BY Docente.nome