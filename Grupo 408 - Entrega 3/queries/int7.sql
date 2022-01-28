.mode columns
.headers on 
.nullvalue NULL 

select funcaoFac AS Função,count(*) as Quantidade from NaoDocente
        group by funcaoFac
          having count(*) =(select max(nor) from 
            (select funcaoFac,count(*) as nor from NaoDocente group by funcaoFac) NaoDocente)

