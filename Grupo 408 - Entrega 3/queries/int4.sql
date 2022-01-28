.mode columns
.headers on 
.nullvalue NULL

select nomeuc as cadeiras from UC 
where codCurso = (select codCurso from Curso where nomeCurso = 'Licenciatura em Engenharia Informática e Computacao')
GROUP BY nomeuc