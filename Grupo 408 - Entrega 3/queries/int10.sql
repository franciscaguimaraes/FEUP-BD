.mode columns
.headers on 
.nullvalue NULL 

select docente.nome, Departamento.nomeDep AS Departamento
from Departamento
inner join Docente on Docente.codDep = Departamento.codDep
WHERE 
Docente.nome like 'F%'
group by Docente.nome